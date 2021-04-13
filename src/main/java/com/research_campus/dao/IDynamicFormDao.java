package com.research_campus.dao;

import com.research_campus.domain.DynamicForm;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 动态表单Dao
 * @author buwan
 */
public interface IDynamicFormDao {

    /**
     * 查找所有DynamicForm信息 Dao
     * @return Dynamic-Form pojo
     */
    @Select("SELECT * FROM dynamicforminf")
    List<DynamicForm> findAllDynamicFormInf();
}
