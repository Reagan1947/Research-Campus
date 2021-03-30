package com.research_campus.controller;

import com.research_campus.utils.activiti.ActivitiMapTool;
import org.activiti.engine.ProcessEngine;
import org.activiti.engine.RepositoryService;
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
 * Activiti 控制类
 * @author buwan
 */
@Controller
public class ActivitiController {

    ProcessEngine processEngine;

    @Autowired
    public void setProcessEngine(ProcessEngine processEngine) {
        this.processEngine = processEngine;
    }


    RepositoryService repositoryService;

    @Autowired
    public void setRepositoryService(RepositoryService repositoryService) {
        this.repositoryService = repositoryService;
    }

    /**
     * 获取已经部署的流程列表
     * @return 返回list\<ProcessDefinition\>
     * @throws IOException nedDesc
     */
    @RequestMapping(value = "/getImplementBPMN")
    @ResponseBody
    public List<Map<String, Object>> getImplementBPMN() throws IOException {
        // 查询对象
        ProcessDefinitionQuery createProcessDefinitionQuery = repositoryService.createProcessDefinitionQuery();
        // 封装的列表map 代替 实体类 ProcessDefinition (因为 ProcessDefinitionEntity
        // List<IdentityLinkEntity> definitionIdentityLinkEntities 懒加载对象 )
        List<Map<String, Object>> listMap = new ArrayList<>();
        // 目标类
        List<ProcessDefinition> list = createProcessDefinitionQuery.list();
        // 循环
        String[] ps = { "id", "name", "version", "key", "diagramResourceName", "resourceName", "deploymentId",
                "suspensionState" };
        for (ProcessDefinition pd : list) {
            // Map<String, Object> map=new HashMap<>();
            // map.put("id", pd.getId());
            // map.put("name", pd.getName());
            Map<String, Object> map = ActivitiMapTool.obj2map(pd, ps);
            listMap.add(map);
        }
        return listMap;

    }

}
