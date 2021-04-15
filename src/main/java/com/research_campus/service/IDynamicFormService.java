package com.research_campus.service;

import com.research_campus.domain.DynamicForm;

import java.util.List;

/**
 * 处理表单相关Service
 * @author buwan
 */
public interface IDynamicFormService {
    /**
     * 查询所有Dynamic-Form信息
     * @return Dynamic-FOrm Pojo
     */
    List<DynamicForm> findAllDynamicFormInf();

    /**
     * 添加dynamicForm 信息
     * @param dynamicForm dynamicForm pojo
     */
    void addDynamicFormInf(DynamicForm dynamicForm);

    /**
     * 根据 uuid 查询 dynamic form
     * @param dynamicFormUuid dynamicForm UUID
     * @return dynamic form pojo
     */
    DynamicForm getDynamicFormJsonByUuid(String dynamicFormUuid);

    /**
     * 根据uuid 删除对应 dynamic form
     * @param dynamicFormUuid dynamic form uuid
     */
    void deleteDynamicFormInfByUuid(String dynamicFormUuid);


}
