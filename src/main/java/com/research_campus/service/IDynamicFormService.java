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
}
