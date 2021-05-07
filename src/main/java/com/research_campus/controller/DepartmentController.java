package com.research_campus.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.research_campus.domain.Subject;
import com.research_campus.service.IDepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * 用户一级二级部门 Controller
 * @author buwan
 */
@Controller
public class DepartmentController {

    IDepartmentService departmentService;

    @Autowired
    public void setDepartmentService(IDepartmentService departmentService) {
        this.departmentService = departmentService;
    }

    @RequestMapping(value = "/getAllSubject")
    @ResponseBody
    public void getSubject(HttpServletResponse response) throws IOException {
        JSONObject json = new JSONObject();
        int code = 200;
        List<Subject> subjectList = new ArrayList<>();

        try {
            subjectList = departmentService.findAllSubject();
        } catch (Exception e) {
            code = 400;
            e.printStackTrace();
        }
        json.put("code", code);
        json.put("subjectList", subjectList);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print(json.toJSONString());
    }

    @RequestMapping(value = "/getAllSubjectSelect")
    @ResponseBody
    public void getSubjectSelect(HttpServletResponse response) throws IOException {
        JSONObject json = new JSONObject();
        List<Subject> subjectList = new ArrayList<>();
        JSONArray jsonArray = new JSONArray();

        try {
            subjectList = departmentService.findAllSubject();

            for(Subject subject : subjectList) {
                JSONObject templeObject = new JSONObject();
                templeObject.put("id", subject.getId());
                templeObject.put("text", subject.getSubjectDesc());
                jsonArray.add(templeObject);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        json.put("results", jsonArray);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print(json.toJSONString());
    }
}
