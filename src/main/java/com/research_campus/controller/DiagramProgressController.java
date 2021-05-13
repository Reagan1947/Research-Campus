package com.research_campus.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.io.InputStream;
import org.activiti.bpmn.model.BpmnModel;
import org.activiti.engine.HistoryService;
import org.activiti.engine.ProcessEngineConfiguration;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.history.HistoricActivityInstance;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.impl.cfg.ProcessEngineConfigurationImpl;
import org.activiti.engine.impl.context.Context;
import org.activiti.engine.impl.persistence.entity.ProcessDefinitionEntity;
import org.activiti.engine.impl.pvm.PvmTransition;
import org.activiti.engine.impl.pvm.process.ActivityImpl;
import org.activiti.image.ProcessDiagramGenerator;
import org.activiti.image.impl.DefaultProcessDiagramGenerator;
import org.activiti.spring.ProcessEngineFactoryBean;
import java.io.IOException;

/**
 * @author buwan
 */
@Controller
@RequestMapping("/diagramProgress")
public class DiagramProgressController {
    private static final org.apache.log4j.Logger LOGGER = Logger.getLogger(ActivitiController.class);

    RepositoryService repositoryService;

    @Autowired
    public void setRepositoryService(RepositoryService repositoryService) {
        this.repositoryService = repositoryService;
    }

    protected RuntimeService runtimeService;

    @Autowired
    public void setRuntimeService(RuntimeService runtimeService) {
        this.runtimeService = runtimeService;
    }

    ProcessEngineConfiguration processEngineConfiguration;

    @Autowired
    public void setProcessEngineConfiguration(ProcessEngineConfiguration processEngineConfiguration) {
        this.processEngineConfiguration = processEngineConfiguration;
    }

    ProcessEngineFactoryBean processEngine;

    @Autowired
    public void setProcessEngine(ProcessEngineFactoryBean processEngine) {
        this.processEngine = processEngine;
    }

    HistoryService historyService;

    @Autowired
    public void setHistoryService(HistoryService historyService) {
        this.historyService = historyService;
    }

    TaskService taskService;

    @Autowired
    public void setTaskService(TaskService taskService) {
        this.taskService = taskService;
    }

    @RequestMapping(params = "queryProPlan")
    public void queryProPlan(HttpServletRequest request,
                             HttpServletResponse response) throws IOException {
        String processInstanceId = request.getParameter("ProcessInstanceId");
        // 获取历史流程实例
        HistoricProcessInstance processInstance = historyService
                .createHistoricProcessInstanceQuery()
                .processInstanceId(processInstanceId).singleResult();
        // 获取流程图
        BpmnModel bpmnModel = repositoryService.getBpmnModel(processInstance
                .getProcessDefinitionId());
        processEngineConfiguration = processEngine
                .getProcessEngineConfiguration();
        Context.setProcessEngineConfiguration((ProcessEngineConfigurationImpl) processEngineConfiguration);
        //  activiti-engine-5.15.jar 版本获取 diagramGenerator 方式
        ProcessDiagramGenerator diagramGenerator = new DefaultProcessDiagramGenerator();
        //  activiti-engine-5.22.0.jar 版本获取 diagramGenerator 方式
        //  ProcessDiagramGenerator diagramGenerator = processEngineConfiguration
        //	.getProcessDiagramGenerator();
        ProcessDefinitionEntity definitionEntity = (ProcessDefinitionEntity) repositoryService
                .getProcessDefinition(processInstance.getProcessDefinitionId());
        /*第一种.高亮目前走过的节点*/
        List<HistoricActivityInstance> highLightedActivitList =  historyService.createHistoricActivityInstanceQuery().processInstanceId(processInstanceId).list();

        // 第二种,高亮最后走过的那个节点
        //		List<HistoricActivityInstance> highLightedActivitList1 = historyService
        //				.createHistoricActivityInstanceQuery()
        //				.processInstanceId(processInstanceId).orderByHistoricActivityInstanceStartTime().desc().list();
        //		List<HistoricActivityInstance> highLightedActivitList=new ArrayList<HistoricActivityInstance>();
        //		highLightedActivitList.add(highLightedActivitList1.get(0));

        // 高亮环节id集合
        List<String> highLightedActivitiList = new ArrayList<String>();

        // 高亮线路id集合
        List<String> highLightedFlows = getHighLightedFlows(definitionEntity,
                highLightedActivitList);

        for (HistoricActivityInstance tempActivity : highLightedActivitList) {
            String activityId = tempActivity.getActivityId();
            highLightedActivitiList.add(activityId);
        }
        // 中文显示的是口口口，设置字体就好了
        InputStream imageStream = diagramGenerator.generateDiagram(bpmnModel,
                "png", highLightedActivitiList, highLightedFlows, "微软雅黑", "微软雅黑",
                null, null, 1.0);
        // 单独返回流程图，不高亮显示
        // InputStream imageStream =
        // diagramGenerator.generatePngDiagram(bpmnModel);

        // 输出资源内容到相应对象
        byte[] b = new byte[1024];
        int len;
        while ((len = imageStream.read(b, 0, 1024)) != -1) {
            response.getOutputStream().write(b, 0, len);
        }


    }

    /**
     * 获取需要高亮的线
     * @return List String
     */
    private List<String> getHighLightedFlows(
            ProcessDefinitionEntity processDefinitionEntity,
            List<HistoricActivityInstance> historicActivityInstances) {

        // 用以保存高亮的线flowId
        List<String> highFlows = new ArrayList<String>();
        // 对历史流程节点进行遍历
        for (int i = 0; i < historicActivityInstances.size() - 1; i++) {
            // 得到节点定义的详细信息
            ActivityImpl activityImpl = processDefinitionEntity
                    .findActivity(historicActivityInstances.get(i)
                            .getActivityId());
            // 用以保存后需开始时间相同的节点
            List<ActivityImpl> sameStartTimeNodes = new ArrayList<ActivityImpl>();
            ActivityImpl sameActivityImpl1 = processDefinitionEntity
                    .findActivity(historicActivityInstances.get(i + 1)
                            .getActivityId());
            // 将后面第一个节点放在时间相同节点的集合里
            sameStartTimeNodes.add(sameActivityImpl1);
            for (int j = i + 1; j < historicActivityInstances.size() - 1; j++) {
                // 后续第一个节点
                HistoricActivityInstance activityImpl1 = historicActivityInstances
                        .get(j);
                // 后续第二个节点
                HistoricActivityInstance activityImpl2 = historicActivityInstances
                        .get(j + 1);
                if (activityImpl1.getStartTime().equals(
                        activityImpl2.getStartTime())) {
                    // 如果第一个节点和第二个节点开始时间相同保存
                    ActivityImpl sameActivityImpl2 = processDefinitionEntity
                            .findActivity(activityImpl2.getActivityId());
                    sameStartTimeNodes.add(sameActivityImpl2);
                } else {
                    // 有不相同跳出循环
                    break;
                }
            }
            // 取出节点的所有出去的线
            List<PvmTransition> pvmTransitions = activityImpl
                    .getOutgoingTransitions();
            for (PvmTransition pvmTransition : pvmTransitions) {
                // 对所有的线进行遍历
                ActivityImpl pvmActivityImpl = (ActivityImpl) pvmTransition
                        .getDestination();
                // 如果取出的线的目标节点存在时间相同的节点里，保存该线的id，进行高亮显示
                if (sameStartTimeNodes.contains(pvmActivityImpl)) {
                    highFlows.add(pvmTransition.getId());
                }
            }
        }
        return highFlows;
    }
}
