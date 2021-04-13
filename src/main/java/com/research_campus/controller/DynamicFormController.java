package com.research_campus.controller;

import com.research_campus.domain.BpmnList;
import com.research_campus.domain.DynamicForm;
import com.research_campus.service.IDynamicFormService;
import com.research_campus.utils.activiti.ActivitiMapTool;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.repository.ProcessDefinitionQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 处理表格相关业务
 * @author buwan
 */
@Controller
public class DynamicFormController {

    IDynamicFormService dynamicFormService;

    @Autowired
    public DynamicFormController(IDynamicFormService dynamicFormService) {
        this.dynamicFormService = dynamicFormService;
    }

    @RequestMapping(value = "/getAllDynamicFormInf")
    @ResponseBody
    public List<DynamicForm> getAllDynamicFormInf() throws IOException {
        return dynamicFormService.findAllDynamicFormInf();
    }
}
