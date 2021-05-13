package com.research_campus.service.impl;

import com.research_campus.dao.IBpmnListDao;
import com.research_campus.domain.BpmnList;
import com.research_campus.domain.MyResearchProject;
import com.research_campus.service.IActivitiService;
import com.research_campus.utils.activiti.CommUtils;
import org.activiti.engine.ProcessEngine;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.beans.PropertyDescriptor;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.*;

/**
 * @author buwan
 */
@Service
public class ActivitiServiceImpl implements IActivitiService {

    IBpmnListDao bpmnListDao;

    @Autowired
    public ActivitiServiceImpl(IBpmnListDao bpmnListDao) {
        this.bpmnListDao = bpmnListDao;
    }

    ProcessEngine processEngine;

    @Autowired
    public void setProcessEngine(ProcessEngine processEngine) {
        this.processEngine = processEngine;
    }

    @Override
    public void bpmnListAddData(BpmnList bpmnList) {
        // 0 表示未部署 1 表示已部署

        bpmnListDao.bpmnListAddData(bpmnList);
    }

    @Override
    public List<BpmnList> getBpmnList() {
        return  bpmnListDao.getBpmnList();
    }

    @Override
    public BpmnList getBpmnListByUuid(String uuid) {
        return bpmnListDao.getBpmnListByUuid(uuid);
    }

    @Override
    public void deleteBpmnByUuid(String bpmnUuid) {
        bpmnListDao.deleteBpmn(bpmnUuid);
    }

    @Override
    public void changeBpmnByUuid(BpmnList bpmnList) {
        bpmnListDao.changeBpmnInfByUuid(bpmnList);
    }

    @Override
    public void addDataToInstanceBpmnList(String deploymentId, String bpmnUuid) {
        bpmnListDao.addDataToInstanceBpmnList(deploymentId, bpmnUuid);
    }

    @Override
    public void deleteInstanceBpmnByDepId(String deploymentId) {
        bpmnListDao.deleteInstanceBpmnByDepId(deploymentId);
    }

    @Override
    public String getUuidByDeploymentId(String deploymentId) {
        return bpmnListDao.getUuidByDeploymentId(deploymentId);
    }

    @Override
    public List<MyResearchProject> getPersonalResearchProjectDetail(String userUuid) {
        List<MyResearchProject> myResearchProjectList = bpmnListDao.selectPersonalResearchProjectDetail(userUuid);

        String[] taskKey = { "id", "taskDefinitionKey", "name", "assignee", "processInstanceId"};

        for (MyResearchProject myResearchProject : myResearchProjectList) {
            // 获取当前Task 以及 instance 状态
            ProcessInstance pro = processEngine.getRuntimeService()
                    .createProcessInstanceQuery()
                    .processInstanceId(myResearchProject.getProcessInstanceId())
                    .singleResult();
            if (pro != null) {
                myResearchProject.setInstanceStatus("进行中");
                Task task = processEngine.getTaskService()
                        .createTaskQuery()
                        .processInstanceId(myResearchProject.getProcessInstanceId())
                        .active().singleResult();
                // Task 转 Map 防止懒加载错误
                Map<String, Object> map = CommUtils.obj2map(task, taskKey);
                myResearchProject.setNowTask(map);
            } else {
                myResearchProject.setInstanceStatus("已完成");
                myResearchProject.setNowTask(null);
            }
        }

        return myResearchProjectList;
    }

}
