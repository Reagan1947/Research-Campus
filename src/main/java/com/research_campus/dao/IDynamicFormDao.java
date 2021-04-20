package com.research_campus.dao;

import com.research_campus.domain.DynamicForm;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

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

    /**
     * 自动创建动态表单任务
     * @param tableName 动态表单名称
     * @param tableFields 动态表单 Map 数据
     */
    void autoCreateTask(@Param("tableName")String tableName,@Param("tableFields") Map<String, String> tableFields);

    /**
     * 根据dynamic form uuid 更改 表单状态
     * @param dynamicFormUuid 表单uuid
     * @param status 表单状态
     */
    @Update("UPDATE dynamicforminf SET formStatus=#{status} WHERE UUID=#{dynamicFormUuid}")
    void updateFormStatus(@Param("dynamicFormUuid") String dynamicFormUuid, @Param("status") Integer status);
}
