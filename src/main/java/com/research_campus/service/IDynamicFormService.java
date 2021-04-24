package com.research_campus.service;

import com.research_campus.domain.DynamicForm;

import java.util.List;
import java.util.Map;

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


    /**
     * 根据tableName,控件field自动创建数据库表
     * @param tableName 表单名称
     * @param tableFields 表单控件
     */
    void autoCreateTask(String tableName, Map<String, String> tableFields);

    /**
     * 根据dynamicFormUuid 更改表单状态
     * @param dynamicFormUuid 动态表单uuid
     * @param status 表单状态
     */
    void modifyFormStatus(String dynamicFormUuid, Integer status);

    /**
     * 根据dynamicFormUuid 更改整个表单详细信息
     * @param dynamicForm 表单更改后的信息
     */
    void modifyFormInf(DynamicForm dynamicForm);
}
