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

}
