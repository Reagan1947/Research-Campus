package com.research_campus.controller;

import com.alibaba.fastjson.JSONObject;
import com.qcloud.cos.model.ObjectMetadata;
import com.research_campus.utils.activiti.ActivitiMapTool;
import org.activiti.engine.ProcessEngine;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.repository.ProcessDefinitionQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Base64Utils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
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

    @RequestMapping(value = "/uploadBPMN")
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

            json.put("code", 200);
            json.put("Msg", "创建成功");

        }catch (Exception e){
            json.put("code", 400);
            json.put("Msg", "创建失败");
            e.printStackTrace();
        } finally {
            assert deployment != null;
            System.out.println("部署ID："+deployment.getId());
            System.out.println("部署名称:"+deployment.getName());
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().print(json.toJSONString());
        }
    }

}
