package com.research_campus.service;

import com.research_campus.domain.BpmnList;
import com.research_campus.domain.UserInfo;

import java.util.List;

/**
 * @author buwan
 */
public interface IActivitiService {
    /**
     * BPMN list 增加方法
     * @param bpmnList bpmn List pojo
     */
    void bpmnListAddData(BpmnList bpmnList);

    /**
     * 查询所有的BPMN list
     * @return bpmn list pojo
     */
    List<BpmnList> getBpmnList();

    /**
     * 根据uuid查询bpmn
     * @param uuid 模型的uuid
     * @return bpmn list pojo
     */
    BpmnList getBpmnListByUuid(String uuid);

    /**
     * 删除BPMN 通过 UUID
     * @param bpmnUuid BPMN list UUID
     */
    void deleteBpmnByUuid(String bpmnUuid);

    /**
     * 更改BPMN 的属性 通过uuid
     * @param bpmnList 流程的uuid
     */
    void changeBpmnByUuid(BpmnList bpmnList);

    /**
     * 添加Instance实例和bpmn之间的关系
     * @param deploymentId 部署以后的实例id
     * @param bpmnUuid bpmn uuid
     */
    void addDataToInstanceBpmnList(String deploymentId, String bpmnUuid);

    /**
     * 根据dep id 删除 bpmn instance关系表中的记录
     * @param deploymentId 部署 id
     */
    void deleteInstanceBpmnByDepId(String deploymentId);

    /**
     * 根据 deployment Id 查询所属 流程UUID
     * @param deploymentId 部署定义 id
     * @return 所属流程UUID
     */
    String getUuidByDeploymentId(String deploymentId);
}
