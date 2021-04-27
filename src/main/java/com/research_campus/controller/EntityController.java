package com.research_campus.controller;

import com.alibaba.fastjson.JSONObject;
import com.qcloud.cos.model.PutObjectResult;
import com.research_campus.domain.*;
import com.research_campus.service.IDeclarationService;
import com.research_campus.service.IEntityService;
import com.research_campus.utils.activiti.IDGenerator;
import com.research_campus.utils.tencentCloudCos.CosClientTool;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.runtime.ProcessInstance;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 业务主体与项目主体管理
 * @author buwan
 */
@Controller
public class EntityController {
    private static final Logger LOGGER = Logger.getLogger(ActivitiController.class);

    IEntityService entityService;

    @Autowired
    public void setEntityService(IEntityService entityService) {
        this.entityService = entityService;
    }

    IDeclarationService declarationService;

    @Autowired
    public void setDeclarationService(IDeclarationService declarationService) {
        this.declarationService = declarationService;
    }

    CosClientTool clientTool;

    @Autowired
    public void setClientTool(CosClientTool clientTool) {
        this.clientTool = clientTool;
    }

    RepositoryService repositoryService;

    @Autowired
    public void setRepositoryService(RepositoryService repositoryService) {
        this.repositoryService = repositoryService;
    }

    RuntimeService runtimeService;

    @Autowired
    public void setRuntimeService(RuntimeService runtimeService) {
        this.runtimeService = runtimeService;
    }

    @RequestMapping("/projectEntityManager")
    public String directToProjectEntityManager() throws Exception{

        // 定位到pageEntity 主体管理界面界面

        return "page_projectEntity";
    }

    @RequestMapping(value = "/getAllProjectEntity")
    @ResponseBody
    public List<ProjectEntity> getAllDynamicFormInf() throws IOException {
        return entityService.getAllProjectEntity();
    }

    @RequestMapping(value = "/addProjectEntity")
    @ResponseBody
    public void uploadBpmn(String projectEntityName, String projectEntityDesc, HttpServletResponse response, HttpServletRequest request) throws Exception {

        JSONObject json = new JSONObject();
        HttpSession session = request.getSession();

        String uuid = IDGenerator.getUuid();

        int code = 200;
        String msg = "项目主体添加成功";

        // 在数据库中保存BPMN数据
        try {
            ProjectEntity projectEntity = new ProjectEntity();
            projectEntity.setProjectEntityCreateBy((Integer) session.getAttribute("userId"));
            projectEntity.setProjectEntityUuid(uuid);
            projectEntity.setProjectEntityName(projectEntityName);
            projectEntity.setProjectEntityDesc(projectEntityDesc);

            entityService.addProjectEntity(projectEntity);

        }catch (Exception e){
            code = 400;
            msg = "项目主体添加失败";
            e.printStackTrace();
        }
        json.put("code", code);
        json.put("Msg", msg);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print(json.toJSONString());
    }

    @RequestMapping(value = "/deleteProjectEntityByUuid", method = RequestMethod.POST)
    @ResponseBody
    public void deleteProjectEntityByUuid(@RequestBody HashMap<String, String> map, HttpServletResponse response) throws Exception {
        // 删除数据库中的UUID
        String projectEntityUuid = map.get("projectEntityUuid");
        JSONObject json = new JSONObject();
        int code = 200;
        String msg = "删除项目实体成功！";

        try {
            // 从数据库中删除ProjectEntity信息 根据UUID
            entityService.deleteProjectEntityByUuid(projectEntityUuid);

        }catch (Exception e){
            code = 400;
            msg = "删除项目实体失败！";
            e.printStackTrace();
        }
        json.put("code", code);
        json.put("msg", msg);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print(json.toJSONString());
    }

    @RequestMapping("/businessEntityDetail")
    public ModelAndView toBusinessEntityDetail(String businessEntityUuid) throws Exception{
        BusinessEntity businessEntity = new BusinessEntity();
        try {
            businessEntity = entityService.getBusinessEntityByUuid(businessEntityUuid);
        }catch (Exception e){
            e.printStackTrace();
        }
        ModelAndView mv = new ModelAndView();
        //添加模型数据 可以是任意的POJO对象
        mv.addObject("businessEntity",  businessEntity);
        mv.setViewName("page_businessEntityDetail");

        return mv;
    }

    @RequestMapping(value = "/getProjectEntity")
    @ResponseBody
    public List<ProjectEntity> getProjectEntity() throws IOException {
        return entityService.getAllProjectEntity();
    }

    @RequestMapping(value = "/getPbpInformation")
    @ResponseBody
    public List<PbpInformation> getPbpInformation(String businessEntityUuid) throws IOException {
        return entityService.getPbpInformationByBeUuid(businessEntityUuid);
    }

    @RequestMapping(value = "/getProjectEntityByUuid")
    @ResponseBody
    public void getProjectEntityByUuid(@RequestBody HashMap<String, String> map, HttpServletResponse response, HttpServletRequest request) throws IOException {
        JSONObject json = new JSONObject();
        ProjectEntity projectEntity = new ProjectEntity();
        int code = 200;

        String projectEntityUuid = map.get("projectEntityUUid");
        try {
            projectEntity = entityService.getProjectEntityByUuid(projectEntityUuid);
        } catch (Exception e) {
            code = 400;
            e.printStackTrace();
        }
        json.put("code", code);
        json.put("projectEntity", projectEntity);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print(json.toJSONString());
    }

    @RequestMapping(value = "/applyProjectEntityChange", method = RequestMethod.POST)
    @ResponseBody
    public void applyDynamicFormInfChange(@RequestBody HashMap<String, String> map, HttpServletResponse response, HttpServletRequest request) throws Exception {
        // 删除数据库中的UUID
        String projectEntityUuid = map.get("projectEntityUuid");

        JSONObject json = new JSONObject();
        ProjectEntity projectEntity = new ProjectEntity();
        projectEntity.setProjectEntityDesc(map.get("projectEntityDesc"));
        projectEntity.setProjectEntityCreateBy(Integer.parseInt(map.get("projectEntityCreateBy")));
        projectEntity.setProjectEntityUuid(projectEntityUuid);
        projectEntity.setProjectEntityName(map.get("projectEntityName"));

        int code = 200;
        String msg = "项目主体信息更改成功！";

        try {
            // 更改项目主体信息
            entityService.modifyProjectEntityInf(projectEntity);

        }catch (Exception e){
            code = 400;
            msg= "项目主体信息更改失败！";
            e.printStackTrace();
        }

        json.put("code", code);
        json.put("msg", msg);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print(json.toJSONString());
    }

    @RequestMapping("/declarationEdit")
    public ModelAndView toDeclarationEdit(String PeUuid, String BeUuid, String processDefineId) throws Exception{
        BusinessEntity businessEntity = new BusinessEntity();
        ProjectEntity projectEntity = new ProjectEntity();

        try {
            businessEntity = entityService.getBusinessEntityByUuid(BeUuid);
            projectEntity = entityService.getProjectEntityByUuid(PeUuid);
        }catch (Exception e){
            e.printStackTrace();
        }
        ModelAndView mv = new ModelAndView();

        mv.addObject("businessEntity",  businessEntity);
        mv.addObject("projectEntity",  projectEntity);
        mv.addObject("processDefineId", processDefineId);

        mv.setViewName("page_declarationEdit");

        return mv;
    }

    @RequestMapping(value = "/getDeclarationDetail", method = RequestMethod.POST)
    @ResponseBody
    public void getDeclarationDetail(@RequestBody HashMap<String, String> map, HttpServletResponse response, HttpServletRequest request) throws Exception {
        // 删除数据库中的UUID
        String projectEntityUuid = map.get("projectEntityUuid");
        String businessEntityUuid = map.get("businessEntityUuid");
        Declaration declaration = new Declaration();
        JSONObject json = new JSONObject();
        int code = 200;

        try {
            // 更改项目主体信息
            declaration = entityService.getDeclarationDetail(businessEntityUuid, projectEntityUuid);

        }catch (Exception e){
            code = 400;
            e.printStackTrace();
        }

        json.put("code", code);
        json.put("declaration", declaration);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print(json.toJSONString());
    }

    @RequestMapping(value = "/addPBEDetail")
    @ResponseBody
    public void addPBEDetail(String projectEntityUuid, String businessEntityUuid, String processDefineId, HttpServletResponse response, HttpServletRequest request) throws Exception {

        JSONObject json = new JSONObject();

        int code = 200;
        String msg = "配置信息添加成功！";

        // 在数据库中保存BPMN数据
        try {
            Pbep pbep = new Pbep();
            pbep.setBusinessEntityUuid(businessEntityUuid);
            pbep.setProjectEntityUuid(projectEntityUuid);
            pbep.setProcessDefineId(processDefineId);

            entityService.addPBEDetail(pbep);

        }catch (Exception e){
            code = 400;
            msg = "配置信息添加失败！";
            e.printStackTrace();
        }
        json.put("code", code);
        json.put("Msg", msg);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print(json.toJSONString());
    }


    @RequestMapping(value = "/applyDeclarationDetail", method = RequestMethod.POST)
    @ResponseBody
    public void applyDeclarationDetail(@RequestBody HashMap<String, String> map, HttpServletResponse response, HttpServletRequest request) throws Exception {
        JSONObject json = new JSONObject();
        int code = 200;

        // 获取declarationUuid
        String declarationUuid = map.get("declarationUuid");
        Declaration declaration = new Declaration();
        declaration.setDeclarationName(map.get("declarationName"));
        declaration.setDeclarationAnnouncement(map.get("declarationAnnouncement"));
        declaration.setDeclarationOverview(map.get("declarationOverview"));
        declaration.setBusinessEntityUuid(map.get("businessEntityUuid"));
        declaration.setProjectEntityUuid(map.get("projectEntityUuid"));
        declaration.setProcessDefineId(map.get("processDefineId"));

        if(declarationUuid == null){
            String uuid = IDGenerator.getUuid();
            declaration.setDeclarationUuid(uuid);
            try {
                // 增加公告信息主体信息
                declarationService.addDeclaration(declaration);

            }catch (Exception e){
                code = 400;
                e.printStackTrace();
            }
        } else {
            try {
                declaration.setDeclarationUuid(declarationUuid);
                declarationService.modifyDeclaration(declaration);
            } catch (Exception e) {
                code = 400;
                e.printStackTrace();
            }
        }

        json.put("code", code);
        json.put("declaration", declaration);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print(json.toJSONString());
    }

    @RequestMapping(value = "/applyDeclarationDetailHtml", method = RequestMethod.POST)
    @ResponseBody
    public void applyDeclarationDetailHtml(@RequestBody HashMap<String, String> map, HttpServletResponse response, HttpServletRequest request) throws Exception {
        JSONObject json = new JSONObject();
        PutObjectResult putObjectResult = new PutObjectResult();
        int code = 200;

        // 获取declarationUuid
        String declarationDetailHtml = map.get("declarationDetailHtml");
        String declarationDetailUrl = map.get("declarationDetailUrl");
        String declarationUuid = map.get("declarationDetail.declarationUuid");

        if(declarationDetailUrl == null){
            String uuid = IDGenerator.getUuid();
            declarationDetailHtml = new String(declarationDetailHtml.getBytes("GBK"));

            try {
                // 上传declarationDetailHtml信息
                putObjectResult = clientTool.uploadFileWithExtension(uuid, declarationDetailHtml, "html", "declarationDetail");
                // 向数据库添加信息
                declarationService.addDeclarationUrlByDeclarationUuid(uuid, declarationUuid);

            }catch (Exception e){
                code = 400;
                e.printStackTrace();
            }
        } else {
            declarationDetailHtml = new String(declarationDetailHtml.getBytes("GBK"));
            try {
                // 上传declarationDetailHtml信息
                putObjectResult = clientTool.uploadFileWithExtension(declarationDetailUrl, declarationDetailHtml, "html", "declarationDetail");
            } catch (Exception e) {
                code = 400;
                e.printStackTrace();
            }
        }


        System.out.println("上传结果 " + putObjectResult);
        json.put("code", code);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print(json.toJSONString());
    }

    @RequestMapping(value = "/changePBInformation")
    @ResponseBody
    public void changePBInformation(String projectEntityUuid, String businessEntityUuid, String processDefineId, String id, HttpServletResponse response, HttpServletRequest request) throws Exception {

        JSONObject json = new JSONObject();

        int code = 200;
        String msg = "配置信息更改成功！";

        // 在数据库中保存BPMN数据
        try {
            Pbep pbep = new Pbep();
            pbep.setBusinessEntityUuid(businessEntityUuid);
            pbep.setProjectEntityUuid(projectEntityUuid);
            pbep.setProcessDefineId(processDefineId);

            entityService.modifyPbep(pbep, id);

            // projectDeclarationForm中也需要修改
            entityService.projectDeclarationForm(pbep);

        }catch (Exception e){
            code = 400;
            msg = "配置信息更改失败！";
            e.printStackTrace();
        }
        json.put("code", code);
        json.put("Msg", msg);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print(json.toJSONString());
    }

    @RequestMapping(value = "/deletePBInformation", method = RequestMethod.POST)
    @ResponseBody
    public void deletePBInformation(@RequestBody HashMap<String, String> map, HttpServletResponse response) throws Exception {
        // 根据 id 删除 pb_entity_processDefine
        Integer id = Integer.parseInt(map.get("id"));
        String projectEntityUuid = map.get("projectEntityUuid");
        String processDefineId = map.get("processDefineId");

        JSONObject json = new JSONObject();
        int code = 200;
        String msg = "删除项目实体成功！";

        try {
            // 根据ID删除pb_entity_processdefine数据
            entityService.deletePBInformationById(id);

            // 根据projectEntityUuid和processDefineId删除projectdeclarationform
            entityService.deleteDeclaration(projectEntityUuid, processDefineId);

        }catch (Exception e){
            code = 400;
            msg = "删除项目实体失败！";
            e.printStackTrace();
        }
        json.put("code", code);
        json.put("msg", msg);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print(json.toJSONString());
    }

    @RequestMapping(value = "/declarationProject", method = RequestMethod.POST)
    @ResponseBody
    public void declarationProject(@RequestBody HashMap<String, String> map, HttpServletResponse response, HttpServletRequest request) throws Exception {
        String processDefineId = map.get("processDefineId");
        String declarationUuid = map.get("declarationUuid");

        HttpSession session = request.getSession();
        String userUuid = (String) session.getAttribute("uuid");

        JSONObject json = new JSONObject();
        int code = 200;
        String msg = "删除项目实体成功！";

        // 是否要填入初始化用户信息？ ↓ 存入用户uuid
        HashMap<String, Object> hashMap = new HashMap<String, Object>();
        hashMap.put("userUuid", userUuid);
//
//        ProcessInstance processInstance = runtimeService
//                .startProcessInstanceById(processDefinition.getId(), map);

        ProcessInstance processInstance = runtimeService
                .startProcessInstanceById(processDefineId, hashMap);
        // 动作数据 存入 user process action 表中
        // 返回表单数据
        // 根据Activiti
        try {


        }catch (Exception e){
            code = 400;
            msg = "删除项目实体失败！";
            e.printStackTrace();
        }

        LOGGER.info("processInstance = {}, process'key = {}, process'name = {}");

        json.put("code", code);
        json.put("msg", msg);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print(json.toJSONString());
    }
}
