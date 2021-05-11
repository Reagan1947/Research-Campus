package com.research_campus.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.research_campus.domain.DynamicForm;
import com.research_campus.domain.ProjectEntity;
import com.research_campus.domain.UserInfo;
import com.research_campus.service.IDynamicFormService;
import com.research_campus.service.IEntityService;
import com.research_campus.service.IUserInfService;
import org.activiti.engine.ProcessEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author buwan
 */
@Controller
public class OverViewController {

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

    IUserInfService userInfService;

    @Autowired
    public void setUserInfService(IUserInfService userInfService) {
        this.userInfService = userInfService;
    }

    ProcessEngine processEngine;

    @Autowired
    public void setProcessEngine(ProcessEngine processEngine) {
        this.processEngine = processEngine;
    }

    @RequestMapping(value = "/getOverViewData")
    @ResponseBody
    public void getAllDynamicFormInfSelect(HttpServletResponse response) throws IOException {
        JSONObject json = new JSONObject();
        JSONObject jsonObject = new JSONObject();
        int code = 200;

        try {
            // 查询项目总数
            List<ProjectEntity> projectEntityList = entityService.getAllProjectEntity();
            jsonObject.put("projectEntityCount", projectEntityList.size());

            // 查询动态表单总数
            List<DynamicForm> dynamicFormList = dynamicFormService.findAllDynamicFormInf();
            jsonObject.put("dynamicFormCount", dynamicFormList.size());

            // 查询用户总数
            List<UserInfo> userInfoList = userInfService.findAllUserInfo();
            jsonObject.put("userCount", userInfoList.size());

            // 查询流程实例总数
            int processInstanceCount = (int) processEngine.getRuntimeService().createProcessInstanceQuery().count();
            jsonObject.put("processInstanceCount", processInstanceCount);

        } catch (Exception e) {
            code = 400;
            e.printStackTrace();
        }
        json.put("code", code);
        json.put("overViewData", jsonObject);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print(json.toJSONString());
    }
}
