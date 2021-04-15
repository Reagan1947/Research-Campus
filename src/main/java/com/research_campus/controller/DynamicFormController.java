package com.research_campus.controller;

import com.alibaba.fastjson.JSONObject;
import com.qcloud.cos.model.PutObjectResult;
import com.research_campus.domain.BpmnList;
import com.research_campus.domain.DynamicForm;
import com.research_campus.service.IDynamicFormService;
import com.research_campus.utils.activiti.ActivitiMapTool;
import com.research_campus.utils.activiti.IDGenerator;
import com.research_campus.utils.stream.ConvertUtil;
import com.research_campus.utils.tencentCloudCos.CosClientTool;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.repository.ProcessDefinitionQuery;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 处理表格相关业务
 * @author buwan
 */
@Controller
public class DynamicFormController {
    private static final Logger LOGGER = Logger.getLogger(ActivitiController.class);


    IDynamicFormService dynamicFormService;

    @Autowired
    public DynamicFormController(IDynamicFormService dynamicFormService) {
        this.dynamicFormService = dynamicFormService;
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
    public void uploadBPMN(MultipartFile dynamicFormJsonConfig, String dynamicFormDesc, String dynamicFormName, HttpServletResponse response, HttpServletRequest request) throws Exception {
        PutObjectResult putObjectResultDynamicForm;

        JSONObject json = new JSONObject();
        HttpSession session = request.getSession();

//        InputStream inputStream = dynamicFormJsonConfig.getInputStream();
//        String jsonString = new String(convertUtil.parseString(inputStream).getBytes("GBK"),"UTF-8");
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
    public String directToFormBuilder(HttpServletRequest request) throws Exception{

        // 定位到buildBPMN界面

        return "page_formBuilder";
    }

    @RequestMapping(value = "/getDynamicFormJsonByUuid", method = RequestMethod.POST)
    @ResponseBody
    public void getDynamicFormJsonByUuid(@RequestBody HashMap<String, String> map, HttpServletResponse response, HttpServletRequest request) throws Exception {
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
}
