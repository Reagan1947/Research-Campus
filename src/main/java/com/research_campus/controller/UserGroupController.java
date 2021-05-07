package com.research_campus.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.research_campus.domain.GroupOfResearchDepartment;
import com.research_campus.domain.GroupOfSecretary;
import com.research_campus.domain.Subject;
import com.research_campus.domain.UserInfo;
import com.research_campus.service.IDepartmentService;
import com.research_campus.service.IUserGroupService;
import com.research_campus.utils.activiti.ActivitiMapTool;
import com.research_campus.utils.activiti.IDGenerator;
import org.activiti.engine.IdentityService;
import org.activiti.engine.ProcessEngine;
import org.activiti.engine.identity.Group;
import org.activiti.engine.identity.User;
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
import java.util.stream.Collectors;

/**
 * 用户与用户组控制器
 *
 * @author buwan
 */
@Controller
public class UserGroupController {

    ProcessEngine processEngine;

    @Autowired
    public void setProcessEngine(ProcessEngine processEngine) {
        this.processEngine = processEngine;
    }

    IDepartmentService departmentService;

    @Autowired
    public void setDepartmentService(IDepartmentService departmentService) {
        this.departmentService = departmentService;
    }

    IUserGroupService userGroupService;

    @Autowired
    public void setUserGroupService(IUserGroupService userGroupService) {
        this.userGroupService = userGroupService;
    }

    @RequestMapping("/toUserGroupPage")
    public String toUserGroupPage(HttpServletRequest request) throws Exception {
        return "page_userGroup";
    }

    @RequestMapping(value = "/getGroupOfUserSelect")
    @ResponseBody
    public void getGroupOfUserSelect(HttpServletResponse response) throws IOException {
        JSONArray jsonArray = new JSONArray();
        JSONObject json = new JSONObject();
        IdentityService identityService = processEngine.getIdentityService();
        Map<String, List<Group>> map = new HashMap<>();

        try {
            List<Group> groupList = identityService.createGroupQuery().list();

            map = groupList.stream().collect(Collectors.groupingBy(Group::getType));

            map.forEach((key, value) -> {
                JSONArray formatUserToSelect = formatUserToSelect(value);
                JSONObject templeObject = new JSONObject();
                templeObject.put("text", key);
                templeObject.put("children", formatUserToSelect);
                jsonArray.add(templeObject);
            });

        } catch (Exception e) {
            e.printStackTrace();
        }
        json.put("results", jsonArray);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print(json.toJSONString());
    }

    @RequestMapping(value = "/getGroupOfUser")
    @ResponseBody
    public List<Map<String, Object>> getGroupOfUser() throws IOException {
        IdentityService identityService = processEngine.getIdentityService();
        List<Group> groupList = identityService.createGroupQuery().list();
        List<Map<String, Object>> listMap = new ArrayList<>();

        // 循环
        String[] groupInformation = {"id", "name", "type"};
        for (Group group : groupList) {
            Map<String, Object> map = ActivitiMapTool.obj2map(group, groupInformation);
            listMap.add(map);
        }
        return listMap;
    }

    public JSONArray formatUserToSelect(List<Group> value) {
        JSONArray jsonArray = new JSONArray();
        for (Group group : value) {
            JSONObject templeObject = new JSONObject();
            templeObject.put("id", group.getId());
            templeObject.put("text", group.getName());
            jsonArray.add(templeObject);
        }

        return jsonArray;
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

    @RequestMapping("/toResearchSecretary")
    public String toResearchSecretary(HttpServletRequest request) throws Exception {
        return "page_researchSecretary";
    }

    @RequestMapping(value = "/addGroupOfSecretary")
    @ResponseBody
    public void addGroupOfSecretary(String subject, String groupOfUser, HttpServletResponse response) throws IOException {
        JSONObject json = new JSONObject();
        int code = 200;
        String msg = "添加科研秘书用户组信息成功";

        try {
            departmentService.addGroupOfSecretary(subject, groupOfUser);

        } catch (Exception e) {
            code = 400;
            msg = "添加科研秘书用户组信息失败";
            e.printStackTrace();
        }
        json.put("code", code);
        json.put("Msg", msg);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print(json.toJSONString());
    }

    @RequestMapping(value = "/addGroupOfDepartment")
    @ResponseBody
    public void addGroupOfDepartment(String projectEntity, String groupOfUser, String type, HttpServletResponse response) throws IOException {
        JSONObject json = new JSONObject();
        int code = 200;
        String msg = "添加科研处用户组信息成功";

        try {
            departmentService.addGroupOfResearchDepartment(projectEntity, groupOfUser, type);

        } catch (Exception e) {
            code = 400;
            msg = "添加科研处用户组信息失败";
            e.printStackTrace();
        }
        json.put("code", code);
        json.put("Msg", msg);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print(json.toJSONString());
    }

    @RequestMapping(value = "/getGroupOfSecretary")
    @ResponseBody
    public List<GroupOfSecretary> getGroupOfSecretary() throws IOException {
        List<GroupOfSecretary> groupOfSecretaryList = new ArrayList<>();

        try {
            groupOfSecretaryList = userGroupService.findGroupOfSecretaryList();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return groupOfSecretaryList;
    }

    @RequestMapping(value = "/getGroupOfResearchDepartment")
    @ResponseBody
    public List<GroupOfResearchDepartment> getGroupOfResearchDepartment() throws IOException {
        List<GroupOfResearchDepartment> groupOfResearchDepartmentList = new ArrayList<>();

        try {
            groupOfResearchDepartmentList = userGroupService.findGroupOfResearchDepartment("researchDepartment");

        } catch (Exception e) {
            e.printStackTrace();
        }

        return groupOfResearchDepartmentList;
    }

    @RequestMapping(value = "/getGroupOfProfessor")
    @ResponseBody
    public List<GroupOfResearchDepartment> getGroupOfProfessor() throws IOException {
        List<GroupOfResearchDepartment> groupOfResearchDepartmentList = new ArrayList<>();

        try {
            groupOfResearchDepartmentList = userGroupService.findGroupOfResearchDepartment("professor");

        } catch (Exception e) {
            e.printStackTrace();
        }

        return groupOfResearchDepartmentList;
    }

    @RequestMapping(value = "/changeGroupOfSecretary")
    @ResponseBody
    public void changeProBusInformation(String groupOfUserUuid, String groupOfSecretaryId, HttpServletResponse response) throws IOException {
        JSONObject json = new JSONObject();
        int code = 200;
        String msg = "科研用户群组信息更改成功";

        try {
            departmentService.modifyGroupOfSecretary(groupOfUserUuid, Integer.parseInt(groupOfSecretaryId));

        } catch (Exception e) {
            code = 400;
            msg = "科研用户群组信息更改失败";
            e.printStackTrace();
        }
        json.put("code", code);
        json.put("Msg", msg);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print(json.toJSONString());
    }

    @RequestMapping(value = "/changeGroupOfResearchDepartment")
    @ResponseBody
    public void changeGroupOfResearchDepartment(String groupOfUserUuid, String groupOfResearchDepartmentId, HttpServletResponse response) throws IOException {
        JSONObject json = new JSONObject();
        int code = 200;
        String msg = "科研处用户群组信息更改成功";

        try {
            departmentService.modifyGroupOfResearchDepartment(groupOfUserUuid, Integer.parseInt(groupOfResearchDepartmentId));

        } catch (Exception e) {
            code = 400;
            msg = "科研处用户群组信息更改失败";
            e.printStackTrace();
        }
        json.put("code", code);
        json.put("Msg", msg);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print(json.toJSONString());
    }

    @RequestMapping(value = "/deleteGroupOfResearchDepartmentInf")
    @ResponseBody
    public void deleteGroupOfResearchDepartmentInf(@RequestBody HashMap<String, String> map, HttpServletResponse response, HttpServletRequest request) throws IOException {
        String groupOfResearchDepartmentId = map.get("groupOfResearchDepartmentId");
        JSONObject json = new JSONObject();
        int code = 200;
        String msg = "科研处用户群组删除成功";

        try {
            departmentService.removeGroupOfResearchDepartment(groupOfResearchDepartmentId);

        } catch (Exception e) {
            code = 400;
            msg = "科研秘书用户群组删除失败";
            e.printStackTrace();
        }
        json.put("code", code);
        json.put("msg", msg);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print(json.toJSONString());
    }

    @RequestMapping(value = "/deleteGroupOfSecretaryInf")
    @ResponseBody
    public void deleteGroupOfSecretaryInf(@RequestBody HashMap<String, String> map, HttpServletResponse response, HttpServletRequest request) throws IOException {
        String groupOfSecretaryId = map.get("groupOfSecretaryId");
        JSONObject json = new JSONObject();
        Group group = null;
        int code = 200;
        String msg = "科研秘书用户群组删除成功";

        try {
            departmentService.removeGroupOfSecretaryById(groupOfSecretaryId);

        } catch (Exception e) {
            code = 400;
            msg = "科研秘书用户群组删除失败";
            e.printStackTrace();
        }
        json.put("code", code);
        json.put("msg", msg);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print(json.toJSONString());
    }

    @RequestMapping("/editGroupUsers")
    public ModelAndView editGroupUsers(String userGroupId, HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView();

        IdentityService identityService = processEngine.getIdentityService();
        Group group = identityService.createGroupQuery().groupId(userGroupId).singleResult();
        List<User> userList = identityService.createUserQuery().memberOfGroup(userGroupId).list();

        mv.addObject("group", group);

        mv.setViewName("page_editGroupUsers");

        return mv;
    }


    @RequestMapping(value = "/getUserInGroup")
    @ResponseBody
    public void getUserInGroup(@RequestBody HashMap<String, String> map, HttpServletResponse response, HttpServletRequest request) throws IOException {
        String userGroupId = map.get("userGroupId");
        JSONObject json = new JSONObject();
        IdentityService identityService = processEngine.getIdentityService();
        int code = 200;
        List<User> userList = new ArrayList<>();

        try {
            userList = identityService.createUserQuery().memberOfGroup(userGroupId).list();

        } catch (Exception e) {
            code = 400;
            e.printStackTrace();
        }
        json.put("code", code);
        json.put("userList", userList);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print(json.toJSONString());
    }

    @RequestMapping(value = "/getUsersGroupBySubject")
    @ResponseBody
    public JSONArray getUsersGroupBySubject() throws IOException {
        List<Subject> subjectList = new ArrayList<>();
        JSONArray resultJsonArray = new JSONArray();

        try {
            subjectList = userGroupService.getUsersGroupBySubject();

        } catch (Exception e) {
            e.printStackTrace();
        }

        for (Subject subject : subjectList) {
            JSONArray array = JSONArray.parseArray(JSON.toJSONString(subject.getUsers()));
            JSONObject templeObject = new JSONObject();
            templeObject.put("groupItem", subject.getSubjectDesc());
            templeObject.put("groupArray", array);
            resultJsonArray.add(templeObject);
        }

        return resultJsonArray;
    }

    @RequestMapping(value = "/setUsersOfGroup")
    @ResponseBody
    public void setUsersOfGroup(@RequestBody HashMap<String, Object> map, HttpServletResponse response, HttpServletRequest request) throws IOException {
        ArrayList<String> userInfoArrayList = (ArrayList<String>) map.get("usersOfSelect");
        String userGroupId = (String) map.get("userGroupId");
        JSONArray selectUserArray = JSONArray.parseArray(JSON.toJSONString(userInfoArrayList));
        IdentityService identityService = processEngine.getIdentityService();
        JSONObject json = new JSONObject();
        User user;
        int code = 200;
        String msg = "群组用户成员信息配置成功";

        try {
            for (int i = 0; i < selectUserArray.size(); i++) {
                String uuid = (String) selectUserArray.getJSONObject(i).get("uuid");
                user = identityService.createUserQuery().userId(uuid).singleResult();
                if (user == null) {
                    user = identityService.newUser(uuid);
                    identityService.saveUser(user);
                }
                List<User> userList = identityService.createUserQuery().memberOfGroup(userGroupId).list();
                String tag = "no";
                for (User user1 : userList) {
                    if (user1.getId().equals(uuid)) {
                        tag = "yes";
                    }
                }
                if ("no".equals(tag)) {
                    identityService.createMembership(uuid, userGroupId);
                }
            }

            List<User> userList1 = identityService.createUserQuery().memberOfGroup(userGroupId).list();
            for (User user2 : userList1) {
                String tag1 = "no";
                for (int j = 0; j < selectUserArray.size(); j++) {
                    String uuid = (String) selectUserArray.getJSONObject(j).get("uuid");
                    if (user2.getId().equals(uuid)) {
                        tag1 = "have";
                    }
                }
                if ("no".equals(tag1)) {
                    identityService.deleteMembership(user2.getId(), userGroupId);
                }
            }

        } catch (Exception e) {
            code = 400;
            msg = "群组用户成员信息配置失败";
            e.printStackTrace();
        }
        json.put("code", code);
        json.put("msg", msg);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print(json.toJSONString());
    }

    @RequestMapping(value = "/getUserInGroupDetail")
    @ResponseBody
    public void getUserInGroupDetail(@RequestBody HashMap<String, String> map, HttpServletResponse response, HttpServletRequest request) throws IOException {
        String userGroupId = map.get("userGroupId");
        JSONObject json = new JSONObject();
        IdentityService identityService = processEngine.getIdentityService();
        int code = 200;
        List<User> userList = new ArrayList<>();
        List<UserInfo> userInfoList = new ArrayList<>();

        try {
            userList = identityService.createUserQuery().memberOfGroup(userGroupId).list();
            for (User user : userList) {
                userInfoList.add(userGroupService.findUserByUuid(user.getId()));
            }

        } catch (Exception e) {
            code = 400;
            e.printStackTrace();
        }
        json.put("code", code);
        json.put("userInfoList", userInfoList);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print(json.toJSONString());
    }

    @RequestMapping("/toResearchDepartmentGroup")
    public String toResearchDepartmentGroup(HttpServletRequest request) throws Exception {
        return "page_researchDepartmentGroup";
    }

    @RequestMapping("/toProfessorGroup")
    public String toProfessorGroup(HttpServletRequest request) throws Exception {
        return "page_professorGroup";
    }

}
