package com.research_campus.controller;

import com.alibaba.fastjson.JSONObject;
import com.research_campus.domain.*;
import com.research_campus.service.IEntityService;
import com.research_campus.service.IUserGroupService;
import org.activiti.engine.TaskService;
import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * @author buwan
 */
@Controller
public class ExamineAndApproveController {

    TaskService taskService;

    @Autowired
    public void setTaskService(TaskService taskService) {
        this.taskService = taskService;
    }

    IEntityService entityService;

    @Autowired
    public void setEntityService(IEntityService entityService) {
        this.entityService = entityService;
    }

    IUserGroupService userGroupService;

    @Autowired
    public void setUserGroupService(IUserGroupService userGroupService) {
        this.userGroupService = userGroupService;
    }

    @RequestMapping("/examineAndApprove")
    public String directToExamineAndApprove(HttpServletRequest request) throws Exception{

        // 前往科研项目审批页面
        return "page_examineAndApprove";
    }

    @RequestMapping(value="/getExamineAndApproveTask",method = RequestMethod.GET)
    @ResponseBody
    public Map<String,Object> getExamineAndApproveTask(HttpServletRequest request){
        Map<String,Object> result =new HashMap<>();

        // 绘制计数器。这个是用来确保Ajax从服务器返回的是对应的（Ajax是异步的，因此返回的顺序是不确定的）, 要求在服务器接收到此参数后再返回
        String strDraw = request.getParameter("draw");

        // 第一条数据的起始位置，比如0代表第一条数据
        String strStart = request.getParameter("start");

        // 一共需要的条数
        String strLength = request.getParameter("length");

        int draw = strDraw == null ? 0 : Integer.parseInt(strDraw);
        int start = strStart == null ? 0 : Integer.parseInt(strStart);
        int length = strLength == null ? 10 : Integer.parseInt(strLength);

        HttpSession session = request.getSession();
        String assignee = (String) session.getAttribute("uuid");
        List<Task> taskList = taskService.createTaskQuery().taskCandidateUser(assignee).listPage(start, length);

        List<Map<String, Object>> customTaskList = new ArrayList<>();
        for (Task task : taskList) {
            Map<String, Object> map = new LinkedHashMap<>();
            map.put("taskId", task.getId());
            map.put("taskDefinitionKey", task.getTaskDefinitionKey());
            map.put("taskName", task.getName());
            map.put("taskAssignee", task.getAssignee());
            map.put("processInstanceId", task.getProcessInstanceId());

            // 获取 proBusUuid
            String proBusUuid = (String) taskService.getVariable(task.getId(), "proBusUuid");

            // 根据 proBusUuid 查询 proBus
            ProBus proBus = entityService.selectProBusByProBusUuid(proBusUuid);

            // 根据 projectUuid 查询 projectEntity
            ProjectEntity projectEntity = entityService.getProjectEntityByUuid(proBus.getProjectEntityUuid());

            map.put("projectName", projectEntity.getProjectEntityName());

            // 获取申请审批用户信息
            UserInfo userInfo = userGroupService.findUserByUuid(assignee);

            map.put("userName", userInfo.getUserName());
            map.put("userUuid", userInfo.getUuid());

            customTaskList.add(map);
        }

        // count为该表总的数据条数
        int count = (int) taskService.createTaskQuery().taskCandidateUser(assignee).count();

        result.put("draw", draw);
        result.put("recordsTotal", count);
        result.put("recordsFiltered", count);
        result.put("data", customTaskList);
        result.put("error", "");

        return result;
    }

    @RequestMapping(value = "/claimTask", method = RequestMethod.POST)
    @ResponseBody
    public void getDeclaration(@RequestBody HashMap<String, String> map, HttpServletResponse response, HttpServletRequest request) throws Exception {
        String taskId = map.get("taskId");
        JSONObject json = new JSONObject();
        HttpSession session = request.getSession();
        String userUuid = (String) session.getAttribute("uuid");
        int code = 200;
        String msg = "任务认领成功";

        try {
             taskService.claim(taskId, userUuid);
        }catch (Exception e){
            code = 400;
            msg = "任务认领失败";
            e.printStackTrace();
        }

        json.put("code", code);
        json.put("msg", msg);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print(json.toJSONString());
    }

    @RequestMapping("/claimExamineAndApprove")
    public String claimExamineAndApprove(HttpServletRequest request) throws Exception{

        // 前往科研项目审批页面
        return "page_claimExamineAndApprove";
    }

    @RequestMapping(value="/getClaimTaskOfEa",method = RequestMethod.GET)
    @ResponseBody
    public Map<String,Object> getClaimTaskOfEa(HttpServletRequest request){
        Map<String,Object> result =new HashMap<>();

        // 绘制计数器。这个是用来确保Ajax从服务器返回的是对应的（Ajax是异步的，因此返回的顺序是不确定的）, 要求在服务器接收到此参数后再返回
        String strDraw = request.getParameter("draw");

        // 第一条数据的起始位置，比如0代表第一条数据
        String strStart = request.getParameter("start");

        // 一共需要的条数
        String strLength = request.getParameter("length");

        int draw = strDraw == null ? 0 : Integer.parseInt(strDraw);
        int start = strStart == null ? 0 : Integer.parseInt(strStart);
        int length = strLength == null ? 10 : Integer.parseInt(strLength);

        HttpSession session = request.getSession();
        String assignee = (String) session.getAttribute("uuid");
        List<Task> taskList = taskService.createTaskQuery().taskAssignee(assignee).listPage(start, length);

        List<Map<String, Object>> customTaskList = new ArrayList<>();
        for (Task task : taskList) {
            Map<String, Object> map = new LinkedHashMap<>();
            map.put("taskId", task.getId());
            map.put("taskDefinitionKey", task.getTaskDefinitionKey());
            map.put("taskName", task.getName());
            map.put("taskAssignee", task.getAssignee());
            map.put("processInstanceId", task.getProcessInstanceId());

            // 获取 proBusUuid
            String proBusUuid = (String) taskService.getVariable(task.getId(), "proBusUuid");
            String lunchUserUuid = (String) taskService.getVariable(task.getId(), "userUuid");

            // 根据 proBusUuid 查询 proBus
            ProBus proBus = entityService.selectProBusByProBusUuid(proBusUuid);

            // 根据 projectUuid 查询 projectEntity
            ProjectEntity projectEntity = entityService.getProjectEntityByUuid(proBus.getProjectEntityUuid());

            map.put("projectName", projectEntity.getProjectEntityName());

            // 获取申请审批用户信息
            UserInfo userInfo = userGroupService.findUserByUuid(lunchUserUuid);

            map.put("userName", userInfo.getUserName());
            map.put("userUuid", userInfo.getUuid());

            customTaskList.add(map);
        }

        // count为该表总的数据条数
        int count = (int) taskService.createTaskQuery().taskCandidateUser(assignee).count();

        result.put("draw", draw);
        result.put("recordsTotal", count);
        result.put("recordsFiltered", count);
        result.put("data", customTaskList);
        result.put("error", "");

        return result;
    }

    @RequestMapping(value = "/cancelClaim", method = RequestMethod.POST)
    @ResponseBody
    public void cancelClaim(@RequestBody HashMap<String, String> map, HttpServletResponse response, HttpServletRequest request) throws Exception {
        String taskId = map.get("taskId");
        JSONObject json = new JSONObject();
        int code = 200;
        String msg = "取消任务领取成功";

        try {
            taskService.setAssignee(taskId, null);
        }catch (Exception e){
            code = 400;
            msg = "取消任务领取失败";
            e.printStackTrace();
        }

        json.put("code", code);
        json.put("msg", msg);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print(json.toJSONString());
    }
}
