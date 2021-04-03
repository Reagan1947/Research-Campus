package com.research_campus.controller;

import com.alibaba.fastjson.JSONObject;
import com.qcloud.cos.model.ObjectMetadata;
import com.qcloud.cos.model.PutObjectResult;
import com.research_campus.domain.BpmnList;
import com.research_campus.service.IActivitiService;
import com.research_campus.utils.activiti.ActivitiMapTool;
import com.research_campus.utils.activiti.IDGenerator;
import com.research_campus.utils.tencentCloudCos.CosClientTool;
import jdk.nashorn.internal.ir.RuntimeNode;
import org.activiti.engine.ProcessEngine;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.repository.ProcessDefinitionQuery;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Base64Utils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Activiti 控制类
 * @author buwan
 */
@Controller
public class ActivitiController {
    private static final Logger LOGGER = Logger.getLogger(ActivitiController.class);


    ProcessEngine processEngine;

    @Autowired
    public void setProcessEngine(ProcessEngine processEngine) {
        this.processEngine = processEngine;
    }


    RepositoryService repositoryService;

    @Autowired
    public void setRepositoryService(RepositoryService repositoryService) {
        this.repositoryService = repositoryService;
    }

    IActivitiService activitiService;

    @Autowired
    public ActivitiController(IActivitiService activitiService) {
        this.activitiService = activitiService;
    }

    CosClientTool clientTool;

    @Autowired
    public void setClientTool(CosClientTool clientTool) {
        this.clientTool = clientTool;
    }

    /**
     * 获取已经部署的流程列表
     * @return 返回list\<ProcessDefinition\>
     * @throws IOException nedDesc
     */
    @RequestMapping(value = "/getImplementBPMN")
    @ResponseBody
    public List<Map<String, Object>> getImplementBPMN() throws IOException {
        // 查询对象
        ProcessDefinitionQuery createProcessDefinitionQuery = repositoryService.createProcessDefinitionQuery();
        // 封装的列表map 代替 实体类 ProcessDefinition (因为 ProcessDefinitionEntity
        // List<IdentityLinkEntity> definitionIdentityLinkEntities 懒加载对象 )
        List<Map<String, Object>> listMap = new ArrayList<>();
        // 目标类
        List<ProcessDefinition> list = createProcessDefinitionQuery.list();
        // 循环
        String[] ps = { "id", "name", "version", "key", "diagramResourceName", "resourceName", "deploymentId",
                "suspensionState" };
        for (ProcessDefinition pd : list) {
            // Map<String, Object> map=new HashMap<>();
            // map.put("id", pd.getId());
            // map.put("name", pd.getName());
            Map<String, Object> map = ActivitiMapTool.obj2map(pd, ps);
            listMap.add(map);
        }
        return listMap;

    }

    /**
     * 上传BPMN文件，并进行部署
     * @param response 上传文件对象
     */

    @RequestMapping(value = "/uploadAndDepBPMN")
    @ResponseBody
    public void deploymentProcessDefinitionClasspath(MultipartFile uploadBpmn, MultipartFile uploadPng, String processName, HttpServletResponse response) throws IOException {
        // 获取ClasspathResource 并进行部署
        System.out.println(processName);
        Deployment deployment = null;
        JSONObject json = new JSONObject();

        // bpmn上传
        String resourceNameBpmn = uploadBpmn.getOriginalFilename();
        InputStream inputStreamBpmn = uploadBpmn.getInputStream();

        // png上传文件名
         String resourceNamePng = uploadPng.getOriginalFilename();
         InputStream inputStreamPng = uploadPng.getInputStream();


        try {
            deployment = processEngine.getRepositoryService()
                    .createDeployment()
                    .name("流程定义")
                    .addInputStream(resourceNameBpmn, inputStreamBpmn)
                    .addInputStream(resourceNamePng, inputStreamPng)
                    .deploy();
        }catch (Exception e){
            json.put("code", 400);
            json.put("Msg", "创建失败");
            e.printStackTrace();
        }

        json.put("code", 200);
        json.put("Msg", "创建成功");
        assert deployment != null;
        System.out.println("部署ID："+deployment.getId());
        System.out.println("部署名称:"+deployment.getName());
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print(json.toJSONString());
    }

    @RequestMapping(value = "/uploadBPMN")
    @ResponseBody
    public void uploadBPMN(MultipartFile uploadBpmn, MultipartFile uploadSvg, String processName, String processDesc, HttpServletResponse response, HttpServletRequest request) throws IOException {
        PutObjectResult putObjectResultBpmn;
        PutObjectResult putObjectResultPng;

        // bpmn上传
        String resourceNameBpmn = uploadBpmn.getOriginalFilename();

        // png上传文件名
        String resourceNameSvg = uploadSvg.getOriginalFilename();

        JSONObject json = new JSONObject();
        HttpSession session = request.getSession();
        String uuid = IDGenerator.getUuid();

        // 在数据库中保存BPMN数据
        try {
            BpmnList bpmnList = new BpmnList();
            bpmnList.setBpmnName(processName);
            bpmnList.setUploadUserId((Integer) session.getAttribute("userId"));
            bpmnList.setBpmnDesc(processDesc);
            bpmnList.setBpmnStatus(0);
            bpmnList.setBpmnUUID(uuid);
            bpmnList.setBpmnFileName(resourceNameBpmn);
            bpmnList.setSvgFileName(resourceNameSvg);

            activitiService.bpmnListAddData(bpmnList);

            // 上传对象到腾讯云
            putObjectResultBpmn = clientTool.uploadFileWithExtension(uuid, uploadBpmn, "bpmn", "bpmn");
            putObjectResultPng = clientTool.uploadFileWithExtension(uuid, uploadSvg, "svg", "bpmn");

            LOGGER.info(putObjectResultBpmn);
            LOGGER.info(putObjectResultPng);

        }catch (Exception e){
            json.put("code", 400);
            json.put("Msg", "创建失败");
            e.printStackTrace();
        }
            json.put("code", 200);
            json.put("Msg", "创建成功");
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().print(json.toJSONString());
    }

    @RequestMapping(value = "/getBPMNList")
    @ResponseBody
    public List<BpmnList> getBpmnList() throws IOException {
        return activitiService.getBpmnList();
    }

    @RequestMapping("/showBPMN")
    public ModelAndView directToShowBpmn(String uuid, HttpServletRequest request) throws Exception{

        // 定位到show BPMN界面

        // 根据uuid查询流程图的具体信息
        BpmnList bpmnList = activitiService.getBpmnListByUuid(uuid);

        ModelAndView mv = new ModelAndView();
        //添加模型数据 可以是任意的POJO对象
        mv.addObject(bpmnList);
        //设置逻辑视图名，视图解析器会根据该名字解析到具体的视图页面
        mv.setViewName("page_showBPMN");

        return mv;
    }
}
