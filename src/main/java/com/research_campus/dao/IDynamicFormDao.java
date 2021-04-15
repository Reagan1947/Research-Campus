package com.research_campus.dao;

import com.research_campus.domain.DynamicForm;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
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

    /**
     * 增加 dynamic form 实体 dao 方法
     * @param dynamicForm dynamic form dao pojo
     */
    @Insert("INSERT INTO dynamicforminf (formName, formJson, createBy, createTime, UUID, formDesc) " +
            "values (#{formName}, #{formJson}, #{createBy}, now(), #{uuid}, #{formDesc})")
    void addDynamicFormInf(DynamicForm dynamicForm);

    /**
     * 根据 dynamic form uuid 查询 dynamic form pojo 实例
     * @param dynamicFormUuid dynamic form uuid
     * @return dynamic form
     */
    @Select("SELECT * FROM dynamicforminf WHERE UUID='${dynamicFormUuid}'")
    DynamicForm getDynamicFormJsonByUuid(@Param("dynamicFormUuid") String dynamicFormUuid);

    /**
     * 根据 uuid 删除对应dynamic form dao层
     * @param dynamicFormUuid dynamic form uuid
     */
    @Delete("DELETE FROM dynamicforminf WHERE UUID='${dynamicFormUuid}'")
    void deleteDynamicFormInfByUuid(@Param("dynamicFormUuid") String dynamicFormUuid);
}
