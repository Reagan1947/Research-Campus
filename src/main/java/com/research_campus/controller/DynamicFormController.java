package com.research_campus.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.JSON;
import com.research_campus.domain.*;
import com.research_campus.service.IDeclarationService;
import com.research_campus.service.IDynamicFormService;
import com.research_campus.service.IEntityService;
import com.research_campus.service.impl.DeclarationServiceImpl;
import com.research_campus.utils.activiti.IDGenerator;
import com.research_campus.utils.stream.ConvertUtil;
import com.research_campus.utils.tencentCloudCos.CosClientTool;
import org.activiti.engine.FormService;
import org.activiti.engine.ProcessEngine;
import org.activiti.engine.TaskService;
import org.activiti.engine.form.TaskFormData;
import org.activiti.engine.task.Task;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Map;

/**
 * 处理表格相关业务
 * @author buwan
 */
@Controller
public class DynamicFormController {
    private static final Logger LOGGER = Logger.getLogger(ActivitiController.class);

    ProcessEngine processEngine;

    @Autowired
    public void setProcessEngine(ProcessEngine processEngine) {
        this.processEngine = processEngine;
    }

    IEntityService entityService;

    @Autowired
    public void setEntityService(IEntityService entityService) {
        this.entityService = entityService;
    }

    IDynamicFormService dynamicFormService;

    @Autowired
    public void setDynamicFormService(IDynamicFormService dynamicFormService) {
        this.dynamicFormService = dynamicFormService;
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

    ConvertUtil convertUtil;

    @Autowired
    public void setConvertUtil(ConvertUtil convertUtil) {
        this.convertUtil = convertUtil;
    }

    @RequestMapping(value = "/getAllDynamicFormInf")
    @ResponseBody
    public List<DynamicForm> getAllDynamicFormInf() throws IOException {
        return dynamicFormService.findAllDynamicFormInf();
    }

    @RequestMapping(value = "/uploadDynamicForm")
    @ResponseBody
    public void uploadBpmn(MultipartFile dynamicFormJsonConfig, String dynamicFormDesc, String dynamicFormName, HttpServletResponse response, HttpServletRequest request) throws Exception {

        JSONObject json = new JSONObject();
        HttpSession session = request.getSession();

        String jsonString = new String(dynamicFormJsonConfig.getBytes(), StandardCharsets.UTF_8);
        String uuid = IDGenerator.getUuid();


        int code = 200;
        String msg = "创建成功";

        // 在数据库中保存BPMN数据
        try {
            DynamicForm dynamicForm = new DynamicForm();
            dynamicForm.setFormName(dynamicFormName);
            dynamicForm.setCreateBy((Integer) session.getAttribute("userId"));
            dynamicForm.setFormJson(jsonString);
            dynamicForm.setFormDesc(dynamicFormDesc);
            dynamicForm.setFormName(dynamicFormName);
            dynamicForm.setUuid(uuid);

            dynamicFormService.addDynamicFormInf(dynamicForm);

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

    @RequestMapping("/formBuilder")
    public String directToFormBuilder() throws Exception{

        // 定位到buildBPMN界面

        return "page_formBuilder";
    }

    @RequestMapping(value = "/getDynamicFormJsonByUuid", method = RequestMethod.POST)
    @ResponseBody
    public void getDynamicFormJsonByUuid(@RequestBody HashMap<String, String> map, HttpServletResponse response) throws Exception {
        // 删除数据库中的UUID
        String dynamicFormUuid = map.get("dynamicFormUuid");
        JSONObject json = new JSONObject();
        DynamicForm dynamicForm = null;
        int code = 200;

        try {
            dynamicForm = dynamicFormService.getDynamicFormJsonByUuid(dynamicFormUuid);

        }catch (Exception e){
            code = 400;
            e.printStackTrace();
        }
        json.put("code", code);
        json.put("dynamicForm", dynamicForm);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print(json.toJSONString());
    }

    @RequestMapping(value = "/deleteDynamicFormInfByUuid", method = RequestMethod.POST)
    @ResponseBody
    public void deleteDynamicFormInfByUuid(@RequestBody HashMap<String, String> map, HttpServletResponse response) throws Exception {
        // 删除数据库中的UUID
        String dynamicFormUuid = map.get("dynamicFormUuid");
        JSONObject json = new JSONObject();
        int code = 200;
        String msg = "动态表单删除成功！";

        try {
            // 从数据库中删除DynamicForm信息 根据UUID
            dynamicFormService.deleteDynamicFormInfByUuid(dynamicFormUuid);

        }catch (Exception e){
            code = 400;
            msg = "动态表单删除失败！";
            e.printStackTrace();
        }
        json.put("code", code);
        json.put("msg", msg);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print(json.toJSONString());
    }

    @RequestMapping(value = "/applyDynamicFormInfByUuid", method = RequestMethod.POST)
    @ResponseBody
    public void applyDynamicFormInfByUuid(@RequestBody HashMap<String, String> map, HttpServletResponse response) throws Exception {
        // 删除数据库中的UUID
        String dynamicFormUuid = map.get("dynamicFormUuid");
        JSONObject json = new JSONObject();
        DynamicForm dynamicForm = new DynamicForm();
        int code = 200;
        String msg = "动态表单应用成功！";

        try {
            // 根据uuid获得动态表单数据
            dynamicForm = dynamicFormService.getDynamicFormJsonByUuid(dynamicFormUuid);
            // 更改表单状态为1

            dynamicFormService.modifyFormStatus(dynamicFormUuid, 1);

        }catch (Exception e){
            code = 400;
            msg = "表单应用失败！";
            e.printStackTrace();
        }

        // 将json String 转化为json对象
        JSONObject dynamicFormJsonObject = JSONObject.parseObject(dynamicForm.getFormJson());

        // 解析控件信息并存入Map中
        Map<String, String> tableFields = new IdentityHashMap<>();
        JSONArray jsonArray = dynamicFormJsonObject.getJSONArray("list");
        for (Object o : jsonArray) {
            JSONObject object = (JSONObject) o;
            tableFields.put((String) object.get("type"), (String) object.get("key"));
        }

        String tableName = "dynamic_" + dynamicForm.getUuid();

        LOGGER.info("动态表单tableFiles控件Map：" + tableFields);

        // 使用AutoCreate创建数据表
        dynamicFormService.autoCreateTask(tableName,tableFields);

        json.put("code", code);
        json.put("msg", msg);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print(json.toJSONString());
    }

    @RequestMapping("/dynamicFormPreview")
    public ModelAndView dynamicFormPreview(String uuid) throws Exception{
        // 根据uuid查询流程图的具体信息
        DynamicForm dynamicForm = new DynamicForm();
        try {
            dynamicForm = dynamicFormService.getDynamicFormJsonByUuid(uuid);
        }catch (Exception e){
            e.printStackTrace();
        }
        ModelAndView mv = new ModelAndView();
        //添加模型数据 可以是任意的POJO对象
        mv.addObject("dynamicForm", JSON.toJSONString(dynamicForm.getFormJson()));
        mv.setViewName("page_dynamicFormPreview");

        return mv;
    }


    @RequestMapping(value = "/applyDynamicFormInfChange", method = RequestMethod.POST)
    @ResponseBody
    public void applyDynamicFormInfChange(@RequestBody HashMap<String, String> map, HttpServletResponse response, HttpServletRequest request) throws Exception {
        // 删除数据库中的UUID
        String dynamicFormUuid = map.get("uuid");

        HttpSession session = request.getSession();
        JSONObject json = new JSONObject();
        DynamicForm dynamicForm = new DynamicForm();
        dynamicForm.setFormName(map.get("dynamicFormName"));
        dynamicForm.setCreateBy(Integer.parseInt(map.get("createBy")));
        dynamicForm.setFormDesc(map.get("dynamicFormDescInf"));
        dynamicForm.setUpdateBy((Integer) session.getAttribute("userId"));
        dynamicForm.setUuid(dynamicFormUuid);
        dynamicForm.setFormJson(map.get("dynamicFormJson"));
        int code = 200;
        String msg = "表单信息更改成功";

        try {
            // 更改表单内容
            dynamicFormService.modifyFormInf(dynamicForm);

        }catch (Exception e){
            code = 400;
            msg= "信息更改失败！";
            e.printStackTrace();
        }

        json.put("code", code);
        json.put("msg", msg);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print(json.toJSONString());
    }

    @RequestMapping("/toBusinessEntityDynamicForm")
    public ModelAndView toBusinessEntityDynamicForm(String taskId) throws Exception{
        // 通过 Activiti formService 获取 formKey
        FormService formService = processEngine.getFormService();
        TaskService taskService = processEngine.getTaskService();
        TaskFormData formData = formService.getTaskFormData(taskId);
        String formKey = formData.getFormKey();
        Declaration declaration = new Declaration();
        BusinessEntity businessEntity = new BusinessEntity();
        ProBus proBus = new ProBus();
        ProjectEntity projectEntity = new ProjectEntity();
        Task task = taskService.createTaskQuery().taskId(taskId).singleResult();

        // 根据uuid查询流程图的具体信息
        DynamicForm dynamicForm = new DynamicForm();

        try {
            dynamicForm = dynamicFormService.getDynamicFormJsonByUuid(formKey);

            // 获取 proBusUuid
            String proBusUuid = (String) taskService.getVariable(taskId, "proBusUuid");

            // 根据 proBusUuid 查询 proBus
            proBus = entityService.selectProBusByProBusUuid(proBusUuid);

            // 根据 businessEntityUuid 查询 businessEntity
            businessEntity = entityService.getBusinessEntityByUuid(proBus.getBusinessEntityUuid());

            // 根据 proBusUuid 查询 declaration
            declaration = declarationService.getDeclarationByProBusUuid(proBusUuid);

            // 根据 projectUuid 查询 projectEntity
            projectEntity = entityService.getProjectEntityByUuid(proBus.getProjectEntityUuid());

        }catch (Exception e){
            e.printStackTrace();
        }
        ModelAndView mv = new ModelAndView();
        //添加模型数据 可以是任意的POJO对象
        mv.addObject("dynamicForm", JSON.toJSONString(dynamicForm.getFormJson()));
        mv.addObject("declaration", declaration);
        mv.addObject("businessEntity", businessEntity);
        mv.addObject("task", task);
        mv.addObject("projectEntity", projectEntity);

        mv.setViewName("page_showDynamicForm");

        return mv;
    }
}
