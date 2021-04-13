package com.research_campus.controller;

import com.alibaba.fastjson.JSONObject;
import com.qcloud.cos.model.COSObjectInputStream;
import com.qcloud.cos.model.PutObjectResult;
import com.research_campus.domain.BpmnList;
import com.research_campus.domain.Declaration;
import com.research_campus.service.IActivitiService;
import com.research_campus.service.IDeclarationService;
import com.research_campus.utils.activiti.ActivitiMapTool;
import com.research_campus.utils.activiti.IDGenerator;
import com.research_campus.utils.stream.ConvertUtil;
import com.research_campus.utils.tencentCloudCos.CosClientTool;
import org.activiti.engine.ProcessEngine;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.repository.ProcessDefinitionQuery;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.research_campus.utils.SVG.SvgUtils.convert2PNG;

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
    public void setActivitiService(IActivitiService activitiService) {
        this.activitiService = activitiService;
    }

    CosClientTool clientTool;

    @Autowired
    public void setClientTool(CosClientTool clientTool) {
        this.clientTool = clientTool;
    }

    ConvertUtil convertUtil;

    @Autowired
    public void setConvertUtil(ConvertUtil convertUtil) {
        this.convertUtil = convertUtil;
    }


    IDeclarationService declarationService;

    @Autowired
    public void setDeclarationService(IDeclarationService declarationService) {
        this.declarationService = declarationService;
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

//    @RequestMapping(value = "/uploadAndDepBPMN")
//    @ResponseBody
//    public void deploymentProcessDefinitionClasspath(MultipartFile uploadBpmn, MultipartFile uploadPng, String processName, HttpServletResponse response) throws IOException {
//        // 获取ClasspathResource 并进行部署
//        System.out.println(processName);
//        Deployment deployment = null;
//        JSONObject json = new JSONObject();
//
//        // bpmn上传
//        String resourceNameBpmn = uploadBpmn.getOriginalFilename();
//        InputStream inputStreamBpmn = uploadBpmn.getInputStream();
//
//        // png上传文件名
//         String resourceNamePng = uploadPng.getOriginalFilename();
//         InputStream inputStreamPng = uploadPng.getInputStream();
//
//
//        try {
//            deployment = processEngine.getRepositoryService()
//                    .createDeployment()
//                    .name("流程定义")
//                    .addInputStream(resourceNameBpmn, inputStreamBpmn)
//                    .addInputStream(resourceNamePng, inputStreamPng)
//                    .deploy();
//        }catch (Exception e){
//            json.put("code", 400);
//            json.put("Msg", "创建失败");
//            e.printStackTrace();
//        }
//
//        json.put("code", 200);
//        json.put("Msg", "创建成功");
//        assert deployment != null;
//        System.out.println("部署ID："+deployment.getId());
//        System.out.println("部署名称:"+deployment.getName());
//        response.setCharacterEncoding("UTF-8");
//        response.setContentType("text/html;charset=UTF-8");
//        response.getWriter().print(json.toJSONString());
//    }

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

        int code = 200;
        String msg = "创建成功";

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
            code = 400;
            msg = "创建失败";
            e.printStackTrace();
        }
            json.put("code", code);
            json.put("Msg", msg);
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

    @RequestMapping(value = "/deleteBPMN", method = RequestMethod.POST)
    @ResponseBody
    public void deleteBpmn(@RequestBody HashMap<String, String> map, HttpServletResponse response, HttpServletRequest request) throws Exception {
        // 删除数据库中的UUID
        String bpmnUuid = map.get("bpmnUuid");
        activitiService.deleteBpmnByUuid(bpmnUuid);
        JSONObject json = new JSONObject();

        int code = 200;
        String msg = "删除成功";

        try {
            activitiService.deleteBpmnByUuid(bpmnUuid);
            // 删除BPMN
            clientTool.deleteObjectByUuid(bpmnUuid, "bpmn");
            // 删除SVG
            clientTool.deleteObjectByUuid(bpmnUuid, "svg");

        }catch (Exception e){
            code = 400;
            msg = "删除失败";
            e.printStackTrace();
        }
        json.put("code", code);
        json.put("Msg", msg);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print(json.toJSONString());
    }

    @RequestMapping("/reviewBPMN")
    public String directToReviewBPMN(HttpServletRequest request) throws Exception{

        // 定位到buildBPMN界面

        return "page_reviewBPMN";
    }

    @RequestMapping(value = "/changeBPMNInf", method = RequestMethod.POST)
    @ResponseBody
    public void changeBpmnInf(String bpmnName, String bpmnUuid, String bpmnFileName, String svgFileName, String bpmnDesc, HttpServletResponse response, HttpServletRequest request) throws Exception {
        BpmnList bpmnList = activitiService.getBpmnListByUuid(bpmnUuid);
        int code = 200;
        String msg = "流程更改成功";

        bpmnList.setBpmnName(bpmnName);
        bpmnList.setBpmnUUID(bpmnUuid);
        bpmnList.setBpmnDesc(bpmnDesc);
        bpmnList.setBpmnFileName(bpmnFileName);
        bpmnList.setSvgFileName(svgFileName);
        JSONObject json = new JSONObject();

        try {
            activitiService.changeBpmnByUuid(bpmnList);
        }catch (Exception e){
            code = 400;
            msg = "流程更改失败";
            e.printStackTrace();
        }
        json.put("code", code);
        json.put("Msg", msg);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print(json.toJSONString());
    }

    @RequestMapping(value = "/depBPMN")
    @ResponseBody
    public void deploymentProcessDefinitionClasspath(@RequestBody HashMap<String, String> map, HttpServletResponse response) throws Exception {
        // 获取ClasspathResource 并进行部署
        String bpmnUuid = map.get("bpmnUuid");

        int code = 200;
        String msg = "流程部署成功";

        // 根据id获得信息
        BpmnList bpmnList = activitiService.getBpmnListByUuid(bpmnUuid);

        System.out.println("正在部署：" + bpmnUuid);
        Deployment deployment = null;
        JSONObject json = new JSONObject();

        // 获取bpmn file stream
        String bpmnKey = "bpmn/" + bpmnUuid + ".bpmn";
        String bpmnFileName =  bpmnUuid + ".bpmn";
        COSObjectInputStream bpmnFileStream = clientTool.downloadObject(bpmnKey);

        // 获取svg file stream 转为 png file stream
        String svgKey = "bpmn/" + bpmnUuid + ".svg";
        String pngFileName = bpmnUuid + ".png";
        COSObjectInputStream svgFileStream = clientTool.downloadObject(svgKey);
        ByteArrayOutputStream pngSwapStream = new ByteArrayOutputStream();
        convert2PNG(svgFileStream, pngSwapStream);
        InputStream pngStream = convertUtil.parse(pngSwapStream);

        try {
            deployment = processEngine.getRepositoryService()
                    .createDeployment()
                    .name(bpmnList.getBpmnName())
                    .addInputStream(bpmnFileName, bpmnFileStream)
                    .addInputStream(pngFileName, pngStream)
                    .deploy();
        }catch (Exception e){
            code = 400;
            msg = "流程部署失败";
            e.printStackTrace();
        }

        // 部署成功修改状态为1
        bpmnList.setBpmnStatus(1);

        // 更新bpmn list
        activitiService.changeBpmnByUuid(bpmnList);
        json.put("code", code);
        json.put("Msg", msg);
        assert deployment != null;
        System.out.println("部署ID：" + deployment.getId());
        System.out.println("部署名称:" + deployment.getName());

        // 在流程与实例关系表中添加数据
        String deploymentId = deployment.getId();
        activitiService.addDataToInstanceBpmnList(deploymentId, bpmnUuid);

        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print(json.toJSONString());

        bpmnFileStream.close();
        svgFileStream.close();
    }

    @RequestMapping(value = "/saveBPMNEdit", method = RequestMethod.POST)
    @ResponseBody
    public void saveBPMNEdit(@RequestBody HashMap<String, String> map, HttpServletResponse response, HttpServletRequest request) throws Exception {
        PutObjectResult putObjectResultBpmn;
        PutObjectResult putObjectResultPng;
        JSONObject json = new JSONObject();
        HttpSession session = request.getSession();
        String uuid = IDGenerator.getUuid();
        int code = 200;
        String msg = "保存成功";

        // 得到数据
        String svgDataLink = map.get("svg_data").substring(42);
        String bpmnDataLink = map.get("bpmn_data").substring(42);
        String bpmnName = map.get("bpmn_name");
        String bpmnDesc = map.get("bpmn_desc");

        String svgData = new String(svgDataLink.getBytes(StandardCharsets.UTF_8));
        String bpmnData = new String(bpmnDataLink.getBytes(StandardCharsets.UTF_8));

        // bpmn文件上传名
        String bpmnEditName = "diagramByEdit.bpmn";

        // svg上传文件名
        String svgEditName = "diagramByEdit.svg";

        // 在数据库中保存BPMN数据
        try {
            BpmnList bpmnList = new BpmnList();
            bpmnList.setBpmnName(bpmnName);
            bpmnList.setUploadUserId((Integer) session.getAttribute("userId"));
            bpmnList.setBpmnDesc(bpmnDesc);
            bpmnList.setBpmnStatus(0);
            bpmnList.setBpmnUUID(uuid);
            bpmnList.setBpmnFileName(bpmnEditName);
            bpmnList.setSvgFileName(svgEditName);

            activitiService.bpmnListAddData(bpmnList);

            // 上传对象到腾讯云
            putObjectResultBpmn = clientTool.uploadFileWithExtension(uuid, svgData, "svg", "bpmn");
            putObjectResultPng = clientTool.uploadFileWithExtension(uuid, bpmnData, "bpmn", "bpmn");

            LOGGER.info(putObjectResultBpmn);
            LOGGER.info(putObjectResultPng);

        }catch (Exception e){
            code = 400;
            msg = "保存失败";
            e.printStackTrace();
        }
        json.put("code", code);
        json.put("Msg", msg);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print(json.toJSONString());
    }

    @RequestMapping(value = "/changeBPMNEdit", method = RequestMethod.POST)
    @ResponseBody
    public void changeBPMNEdit(@RequestBody HashMap<String, String> map, HttpServletResponse response, HttpServletRequest request) throws Exception {
        PutObjectResult putObjectResultBpmn;
        PutObjectResult putObjectResultPng;
        JSONObject json = new JSONObject();
        int code = 200;
        String msg = "保存成功";

        // 得到数据
        String svgDataLink = map.get("svg_data").substring(42);
        String bpmnDataLink = map.get("bpmn_data").substring(42);
        String uuid = map.get("bpmn_uuid");

        String svgData = new String(svgDataLink.getBytes("GBK"));
        String bpmnData = new String(bpmnDataLink.getBytes("GBK"));


        try {
            // 上传对象到腾讯云
            putObjectResultBpmn = clientTool.uploadFileWithExtension(uuid, bpmnData, "bpmn", "bpmn");
            putObjectResultPng = clientTool.uploadFileWithExtension(uuid, svgData, "svg", "bpmn");

            LOGGER.info(putObjectResultBpmn);
            LOGGER.info(putObjectResultPng);

        }catch (Exception e){
            code = 400;
            msg = "保存失败";
            e.printStackTrace();
        }
        json.put("code", code);
        json.put("Msg", msg);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print(json.toJSONString());
    }

    // 挂起单个流程

    // 挂起流程定义
    @RequestMapping(value = "/suspendedSingleBpmn", method = RequestMethod.POST)
    @ResponseBody
    public void suspendedSingleBpmn(@RequestBody HashMap<String, String> map, HttpServletResponse response, HttpServletRequest request) throws Exception {
        JSONObject json = new JSONObject();
        String processDefinitionId = map.get("processDefinitionId");
        int code = 200;
        String msg = "流程挂起成功";

        try {
            repositoryService.suspendProcessDefinitionById(processDefinitionId, true, null);

            LOGGER.info("流程 " + processDefinitionId + " 已挂起");

        }catch (Exception e){
            code = 400;
            msg = "流程挂起失败";
            e.printStackTrace();
        }

        json.put("code", code);
        json.put("Msg", msg);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print(json.toJSONString());
    }

    // 挂起整个流程
    @RequestMapping(value = "/activateSingleBpmn", method = RequestMethod.POST)
    @ResponseBody
    public void activateSingleBpmn(@RequestBody HashMap<String, String> map, HttpServletResponse response, HttpServletRequest request) throws Exception {
        JSONObject json = new JSONObject();
        String processDefinitionId = map.get("processDefinitionId");
        int code = 200;
        String msg = "流程激活成功";

        try {
            repositoryService.activateProcessDefinitionById(processDefinitionId, true, null);

            LOGGER.info("流程 " + processDefinitionId + " 已激活");

        }catch (Exception e){
            code = 400;
            msg = "流程激活失败";
            e.printStackTrace();
        }

        json.put("code", code);
        json.put("Msg", msg);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print(json.toJSONString());
    }

    // Tool getType
    public static String getType(Object o){
        return o.getClass().toString();
    }

    // 删除流程定义、部署
    @RequestMapping(value = "/deleteSingleBpmn", method = RequestMethod.POST)
    @ResponseBody
    public void deleteSingleBpmn(@RequestBody HashMap<String, String> map, HttpServletResponse response, HttpServletRequest request) throws Exception {
        JSONObject json = new JSONObject();
        String deleteCase = map.get("deleteCase");
        boolean deleteCaseBool = true;
        String deploymentId = map.get("deploymentId");
        int code = 200;
        String msg = "流程定义(流程)已删除";
        System.out.println("[ Message-1 不删除实例 " + " DeleteCase-标记值为:" + deleteCase + " 其类型为:" + getType(deleteCase) + " ]");

        // 首先删除instance bpmn 关系表中数据
        activitiService.deleteInstanceBpmnByDepId(deploymentId);

        // 是否删除实例
        String deleteCaseString = "0";
        // String undeleteCaseString = "1";

        if (deleteCaseString.equals(deleteCase)){
            deleteCaseBool = false;
            System.out.println("[ Message-2 不删除实例 " + " DeleteCase-标记值为:" + deleteCase + " 其类型为:" + getType(deleteCase) + " ]");
        }


        try {
            // 参数cascade 表示是否删除实例
            processEngine.getRepositoryService()
                    .deleteDeployment(deploymentId, deleteCaseBool);
            LOGGER.info("流程定义(流程) " + deploymentId + " 已删除");

        }catch (Exception e){
            code = 400;
            msg = "流程定义(流程)删除失败";
            e.printStackTrace();
        }

        json.put("code", code);
        json.put("Msg", msg);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print(json.toJSONString());
    }

    @RequestMapping(value = "/getUuidByDeploymentId", method = RequestMethod.POST)
    @ResponseBody
    public void getUuidByDeploymentId(@RequestBody HashMap<String, String> map, HttpServletResponse response, HttpServletRequest request) throws Exception {
        JSONObject json = new JSONObject();
        String deploymentId = map.get("deploymentId");
        String bpmnUuid = null;
        int code = 200;

        // 在关系表中查询

        try {
            bpmnUuid = activitiService.getUuidByDeploymentId(deploymentId);
        }catch (Exception e){
            code = 400;
            e.printStackTrace();
        }

        json.put("code", code);
        json.put("bpmnUUID", bpmnUuid);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print(json.toJSONString());
    }

    @RequestMapping("/toBusinessPage")
    public ModelAndView directToBusinessPage(String uuid, HttpServletRequest request) throws Exception{
        // 根据uuid查询流程图的具体信息
        BpmnList bpmnList = activitiService.getBpmnListByUuid(uuid);

        ModelAndView mv = new ModelAndView();
        //添加模型数据 可以是任意的POJO对象
        mv.addObject(bpmnList);
        mv.setViewName("page_businessInf");

        return mv;
    }

    @RequestMapping("/formCommon")
    public String directToFormCommon(HttpServletRequest request) throws Exception{


        return "page_formCommon";
    }

    @RequestMapping("/toDeclarationPage")
    public ModelAndView directToDeclaration(HttpServletRequest request) throws Exception{

        List<Declaration> declarations = declarationService.getAllDeclaration();

        ModelAndView mv = new ModelAndView();
        //添加模型数据 可以是任意的POJO对象
        mv.addObject(declarations);
        mv.setViewName("page_declaration");

        return mv;
    }
}
