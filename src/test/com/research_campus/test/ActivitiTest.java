package com.research_campus.test;

import com.alibaba.fastjson.JSONArray;
import com.research_campus.domain.DynamicForm;
import com.research_campus.service.IDynamicFormService;
import com.research_campus.utils.tencentCloudCos.CosClientTool;
import org.activiti.engine.ProcessEngine;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.impl.util.json.JSONObject;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.DeploymentBuilder;
import org.activiti.engine.repository.Model;
import org.activiti.engine.repository.ProcessDefinition;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.json.GsonBuilderUtils;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.io.IOException;
import java.io.InputStream;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Consumer;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:applicationContext.xml"})//spring与mybatis整合的配置文件
public class ActivitiTest {

    @Autowired
    RepositoryService repositoryService;

    @Autowired
    ProcessEngine processEngine;

    @Autowired
    CosClientTool clientTool;

    @Autowired
    IDynamicFormService dynamicFormService;


    @Test
    public void implementBPMNTest() {

        InputStream inputStream =
                this.getClass().getClassLoader().getResourceAsStream("diagramtest.bpmn");

        Deployment deployment =
                repositoryService.createDeployment().addInputStream("diagramtest.bpmn", inputStream).deploy();

        System.out.println(deployment.getDeploymentTime());
        System.out.println(deployment.getId());
    }

    @Test
    public void deployProcess() {
        DeploymentBuilder builder = repositoryService.createDeployment();
        String processFileName = "diagramtest";
        InputStream inputStream =
                this.getClass().getClassLoader().getResourceAsStream("bpmn/diagramtest.bpmn");
        builder.addInputStream(processFileName, inputStream)
                .name("请假流程").category("公司员工普通请假流程").tenantId("10023").deploy();
    }

    @Test
    public void queryProcess() {
        repositoryService.createDeploymentQuery().deploymentNameLike("请假流程").list().forEach(new Consumer<Deployment>() {
            @Override
            public void accept(Deployment deployment) {
                System.out.println(deployment.getName());
                System.out.println(deployment.getId());
                System.out.println(deployment.getDeploymentTime());
                System.out.println(deployment.getCategory());
                System.out.println(deployment.getTenantId());
            }
        });
    }

    @Test
    public void deploymentProcessDefinition_classpath() {
        Deployment deployment = processEngine.getRepositoryService()//与流程定义和部署对象相关的Service
                .createDeployment()//创建一个部署对象
                .name("流程定义")//添加部署名称
                .addClasspathResource("bpmn/diagramtest.bpmn")//从classpath的资源中加载，一次只能加载一个文件
                .addClasspathResource("bpmn/diagramtest.bpmn")
                .deploy();//完成部署
        System.out.println("部署ID：" + deployment.getId());
        System.out.println("部署名称:" + deployment.getName());

    }

    @Test
    public void selectAll() {
        List<ProcessDefinition> resultList = repositoryService.createProcessDefinitionQuery().list();
        JSONObject resultJson = new JSONObject();
//        resultJson.put("data", resultList);

        System.out.println(resultList);
    }

    @Test
    public void uploadStringTest() throws IOException {
        clientTool.uploadFileWithExtension("uuid", "测试", "bpmn", "bpmn");
    }

    @Test
    public void JsonAnalysisTest() throws IOException {
        String testUuid = "c422a370106d4ca9b317c5cd3f4c6443";
        DynamicForm dynamicForm = dynamicFormService.getDynamicFormJsonByUuid(testUuid);
        com.alibaba.fastjson.JSONObject dynamicFormJsonObject = com.alibaba.fastjson.JSONObject.parseObject(dynamicForm.getFormJson());

        Map<String, String> tableFields = new IdentityHashMap<>();
        JSONArray jsonArray = dynamicFormJsonObject.getJSONArray("list");
        for (int i = 0; i < jsonArray.size(); i++) {
            com.alibaba.fastjson.JSONObject object = (com.alibaba.fastjson.JSONObject) jsonArray.get(i);
            tableFields.put((String)object.get("type"), (String)object.get("key"));
        }
        System.out.println(tableFields);

    }
}
