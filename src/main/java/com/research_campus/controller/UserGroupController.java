package com.research_campus.controller;

import com.alibaba.fastjson.JSONObject;
import com.research_campus.domain.BpmnList;
import com.research_campus.domain.ProjectEntity;
import com.research_campus.service.IDeclarationService;
import com.research_campus.utils.activiti.ActivitiMapTool;
import com.research_campus.utils.activiti.IDGenerator;
import org.activiti.engine.IdentityService;
import org.activiti.engine.ProcessEngine;
import org.activiti.engine.identity.Group;
import org.apache.http.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 用户与用户组控制器
 * @author buwan
 */
@Controller
public class UserGroupController {

    ProcessEngine processEngine;

    @Autowired
    public void setProcessEngine(ProcessEngine processEngine) {
        this.processEngine = processEngine;
    }

    @RequestMapping("/toUserGroupPage")
    public String toUserGroupPage(HttpServletRequest request) throws Exception{
       return "page_userGroup";
    }

    @RequestMapping(value = "/getGroupOfUser")
    @ResponseBody
    public List<Map<String, Object>> getGroupOfUser() throws IOException {
        IdentityService identityService = processEngine.getIdentityService();
        List<Group> groupList = identityService.createGroupQuery().list();
        List<Map<String, Object>> listMap = new ArrayList<>();

        // 循环
        String[] groupInformation = { "id", "name", "type"};
        for (Group group : groupList) {
            Map<String, Object> map = ActivitiMapTool.obj2map(group, groupInformation);
            listMap.add(map);
        }
        return listMap;
    }

    @RequestMapping(value = "/createUserGroup")
    @ResponseBody
    public void getGroupOfUser(String groupOfUserName, String groupOfUserType, HttpServletResponse response) throws IOException {
        JSONObject json = new JSONObject();
        String uuid = IDGenerator.getUuid();
        int code = 200;
        String msg = "用户群组创建成功";

        try {
            IdentityService identityService = processEngine.getIdentityService();
            Group group = identityService.newGroup(uuid);
            group.setName(groupOfUserName);
            group.setType(groupOfUserType);

            identityService.saveGroup(group);

        } catch (Exception e) {
            code = 400;
            msg = "用户群组创建失败";
            e.printStackTrace();
        }
        json.put("code", code);
        json.put("Msg", msg);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print(json.toJSONString());
    }

    @RequestMapping(value = "/deleteGroupOfUser")
    @ResponseBody
    public void deleteGroupOfUser(@RequestBody HashMap<String, String> map, HttpServletResponse response, HttpServletRequest request) throws IOException {
        String groupOfUserUuid = map.get("groupOfUserUuid");
        JSONObject json = new JSONObject();
        int code = 200;
        String msg = "用户群组删除成功";

        try {
            IdentityService identityService = processEngine.getIdentityService();
            identityService.deleteGroup(groupOfUserUuid);

        } catch (Exception e) {
            code = 400;
            msg = "用户群组删除失败";
            e.printStackTrace();
        }
        json.put("code", code);
        json.put("Msg", msg);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print(json.toJSONString());
    }

    @RequestMapping(value = "/applyGroupOfUserChange")
    @ResponseBody
    public void applyGroupOfUserChange(@RequestBody HashMap<String, String> map, HttpServletResponse response, HttpServletRequest request) throws IOException {
        String groupOfUserUuid = map.get("id");
        String groupOfUserName = map.get("name");
        String groupOfUserType = map.get("type");
        JSONObject json = new JSONObject();
        int code = 200;
        String msg = "用户群组信息更新成功";

        try {
            IdentityService identityService = processEngine.getIdentityService();
            Group group = identityService.createGroupQuery().groupId(groupOfUserUuid).singleResult();
            group.setName(groupOfUserName);
            group.setType(groupOfUserType);

            identityService.saveGroup(group);

        } catch (Exception e) {
            code = 400;
            msg = "用户群组信息更新失败";
            e.printStackTrace();
        }
        json.put("code", code);
        json.put("Msg", msg);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print(json.toJSONString());
    }

    @RequestMapping(value = "/getGroupOfUserInf")
    @ResponseBody
    public void getGroupOfUserInf(@RequestBody HashMap<String, String> map, HttpServletResponse response, HttpServletRequest request) throws IOException {
        String groupOfUserUuid = map.get("groupOfUserUuid");
        IdentityService identityService = processEngine.getIdentityService();
        JSONObject json = new JSONObject();
        Group group = null;
        int code = 200;

        try {
            group = identityService.createGroupQuery().groupId(groupOfUserUuid).singleResult();

        } catch (Exception e) {
            code = 400;
            e.printStackTrace();
        }
        json.put("code", code);
        json.put("group", group);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print(json.toJSONString());
    }
}
