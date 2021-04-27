package com.research_campus.dao;

import com.research_campus.domain.*;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * Entity Dao层方法
 * @author buwan
 */
public interface IEntityDao {

    /**
     * 根据uuid查询project entity
     * @param projectEntityUuid projectEntity UUid
     * @return project Entity
     */
    @Select("SELECT * FROM project_entity WHERE projectEntityUuid=#{projectEntityUuid}")
    ProjectEntity selectProjectEntityByUuid(@Param("projectEntityUuid") String projectEntityUuid);

    /**
     * 获得所有项目Entity信息
     * @return List Project Entity
     */
    @Select("SELECT * FROM project_entity")
    List<ProjectEntity> selectAllProjectEntity();

    /**
     * 添加Project Entity 方法
     * @param projectEntity project Entity pojo
     */
    @Insert("INSERT INTO project_entity (projectEntityName, projectEntityUuid, projectEntityDesc, projectEntityCreateBy, projectEntityCreateTime) " +
            "values (#{projectEntityName}, #{projectEntityUuid}, #{projectEntityDesc}, #{projectEntityCreateBy}, now())")
    void insertProjectEntity(ProjectEntity projectEntity);

    /**
     * 根据项目实体 uuid 删除项目实体
     * @param projectEntityUuid 项目实体 uuid
     */
    @Delete("DELETE FROM project_entity WHERE projectEntityUuid='${projectEntityUuid}'")
    void deleteProjectEntityByUuid(@Param("projectEntityUuid") String projectEntityUuid);

    /**
     * 根据business entity uuid 查询business entity
     * @param businessEntityUuid business entity uuid
     * @return business entity pojo
     */
    @Select("SELECT * FROM business_entity WHERE businessEntityUuid= #{businessEntityUuid}")
    BusinessEntity selectBusinessEntityByUuid(@Param("businessEntityUuid") String businessEntityUuid);

    /**
     * 根据业务主体查询业务主体与项目主体信息
     * @param businessEntityUuid 业务主体uuid
     * @return PbpInformation pojo
     */
    @Select("SELECT * FROM pb_entity_processdefine WHERE businessEntityUuid= #{businessEntityUuid}")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(column = "businessEntityUuid", property = "businessEntityUuid"),
            @Result(column = "processDefineId", property = "processDefineId"),
            @Result(column = "projectEntityUuid", property = "projectEntityUuid"),
            @Result(property = "businessEntity", column = "businessEntityUuid", javaType = com.research_campus.domain.BusinessEntity.class, one = @One(select = "com.research_campus.dao.IEntityDao.selectBusinessEntityByUuid")),
            @Result(property = "projectEntity", column = "projectEntityUuid", javaType = com.research_campus.domain.ProjectEntity.class, one = @One(select = "com.research_campus.dao.IEntityDao.selectProjectEntityByUuid")),
            @Result(property = "processDefineName", column = "processDefineId", javaType =  java.lang.String.class, one = @One(select = "com.research_campus.dao.IBpmnListDao.getProcessDefineNameByPdId")),
    })
    List<PbpInformation> getPbpInformation(@Param("businessEntityUuid") String businessEntityUuid);

    /**
     *  根据uuid 查询 project entity
     * @param projectEntityUuid project 项目主体 uuid
     * @return project entity
     */
    @Select("SELECT * FROM project_entity WHERE projectEntityUuid=#{projectEntityUuid}")
    ProjectEntity getProjectEntityByUuid(@Param("projectEntityUuid") String projectEntityUuid);

    /**
     * 根据 project entity uuid 更改 project entity
     * @param projectEntity project entity pojo 实体
     */
    @Update("UPDATE project_entity " +
            " SET projectEntityName=#{projectEntityName}, projectEntityUuid=#{projectEntityUuid}, projectEntityDesc=#{projectEntityDesc}, projectEntityCreateBy=#{projectEntityCreateBy}" +
            " WHERE projectEntityUuid=#{projectEntityUuid}")
    void modifyProjectEntityInf(ProjectEntity projectEntity);

    /**
     * 根据business entity uuid 和 project entity uuid 查询 declaration
     * @param businessEntityUuid business Entity Uuid 实体识别UUID
     * @param projectEntityUuid project Entity Uuid 项目实体 识别 UUID
     * @return project declaration form / Declaration实例
     */
    @Select("SELECT * FROM projectdeclarationform WHERE projectEntityUuid=#{projectEntityUuid} AND businessEntityUuid=#{businessEntityUuid}")
    Declaration getDeclarationDetail(@Param("businessEntityUuid") String businessEntityUuid, @Param("projectEntityUuid") String projectEntityUuid);


    /**
     * 添加PBEP 信息
     * @param pbep pbep pojo //projectEntity businessEntity processDefine Id
     */
    @Insert("INSERT INTO pb_entity_processdefine (projectEntityUuid, businessEntityUuid, processDefineId)" +
            "VALUES (#{projectEntityUuid}, #{businessEntityUuid}, #{processDefineId})")
    void addPBEDetail(Pbep pbep);

    /**
     * 更改pbep信息
     * @param pbep pbep pojo
     * @param id pbep id
     */
    @Update("UPDATE pb_entity_processdefine " +
            " SET projectEntityUuid=#{pbep.projectEntityUuid}, businessEntityUuid=#{pbep.businessEntityUuid}, processDefineId=#{pbep.processDefineId}" +
            " WHERE id=#{id}")
    void modifyPbep(@Param("pbep")Pbep pbep, @Param("id")String id);

    /**
     * 根据Id删除PBInformation
     * @param id PBInformation Id
     */
    @Delete("DELETE FROM pb_entity_processdefine WHERE id=#{id}")
    void deletePBInformationById(@Param("id")Integer id);

    /**
     * 根据projectEntityUuid、processDefineId删除Declaration公告
     * @param projectEntityUuid projectEntity Uuid
     * @param processDefineId process Define Id
     */
    @Delete("DELETE FROM projectdeclarationform WHERE projectEntityUuid=#{projectEntityUuid} AND processDefineId=#{processDefineId}")
    void deleteDeclaration(@Param("projectEntityUuid")String projectEntityUuid, @Param("processDefineId")String processDefineId);


    /**
     * 根据业务主体id 更新 projectDeclarationForm
     * @param pbep pbep 实体
     */
    @Update("UPDATE projectdeclarationform " +
            "SET businessEntityUuid=#{pbep.businessEntityUuid}, processDefineId=#{pbep.processDefineId}" +
            "WHERE projectEntityUuid=#{pbep.projectEntityUuid}")
    void projectDeclarationForm(@Param("pbep")Pbep pbep);
}
