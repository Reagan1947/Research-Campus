package com.research_campus.dao;

import com.research_campus.domain.BpmnList;
import com.research_campus.domain.MyResearchProject;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * bpmn 上传后list处理dao
 * @author buwan
 */
public interface IBpmnListDao {

    /**
     * 添加BPMNList 数据
     * @param bpmnList BPMN list pojo
     */
    @Insert("INSERT INTO bpmnlist (bpmnName, bpmnDesc, uploadDate, uploadUserId, bpmnStatus, bpmnUUID, bpmnFileName, svgFileName) " +
            "values (#{bpmnName}, #{bpmnDesc}, now(), #{uploadUserId}, #{bpmnStatus}, #{bpmnUUID}, #{bpmnFileName}, #{svgFileName})")
    void bpmnListAddData(BpmnList bpmnList);

    /**
     * 获得所有BPMN List
     * @return bpmn list pojo
     */
    @Select("SELECT * FROM bpmnlist")
    List<BpmnList> getBpmnList();

    /**
     * 根据uuid 查询 bpmn
     * @return bpmnList pojo
     * @param uuid 流程图uuid
     */
    @Select("SELECT * FROM bpmnlist WHERE bpmnUUID=#{uuid}")
    BpmnList getBpmnListByUuid(String uuid);

    /**
     * 根据UUID 删除BPMN
     * @param bpmnUuid 流程图uuid
     */
    @Delete("DELETE FROM bpmnlist WHERE bpmnUUID=#{bpmnUuid}")
    void deleteBpmn(String bpmnUuid);

    /**
     * 根据 UUID 更改BPMNlist
     * @param bpmnList bpmn list 实例
     */
    @Update("UPDATE bpmnlist SET bpmnName=#{bpmnName}, bpmnDesc=#{bpmnDesc}, bpmnFileName=#{bpmnFileName}, svgFileName=#{svgFileName}, bpmnStatus=#{bpmnStatus} WHERE bpmnUUID=#{bpmnUUID}")
    void changeBpmnInfByUuid(BpmnList bpmnList);

    /**
     * 添加instance 与 bpmn 之间关系
     * @param bpmnUuid 流程的 uuid
     * @param deploymentId 实例 deploymentId
     */
    @Insert("INSERT INTO bpmnlist_actinstance (bpmnUUID, deploymentId) " +
            "VALUES (#{bpmnUuid}, #{deploymentId})")
    void addDataToInstanceBpmnList(@Param("deploymentId") String deploymentId, @Param("bpmnUuid") String bpmnUuid);

    /**
     * 根据 deploymentId 删除 bpmn instance 表中记录
     * @param deploymentId 流程部署 id
     */
    @Delete("DELETE FROM bpmnlist_actinstance WHERE deploymentId=#{deploymentId}")
    void deleteInstanceBpmnByDepId(@Param("deploymentId") String deploymentId);

    /**
     * 根据 deploymentId 查询 所属流程UUID
     * @param deploymentId 部署定义id
     * @return 所属流程UUID
     */
    @Select("SELECT bpmnUUID FROM bpmnlist_actinstance WHERE deploymentId=#{deploymentId}")
    String getUuidByDeploymentId(String deploymentId);

    /**
     * 根据 根据流程定义id查询流程定义名称
     * @param processDefineId 流程定义id
     * @return 所属流程UUID
     */
    @Select("SELECT NAME_ FROM act_re_procdef WHERE ID_=#{processDefineId}")
    String getProcessDefineNameByPdId(@Param("processDefineId") String processDefineId);

    /**
     * 从 user_process_action 表中获取个人项目的详细信息
     * @return MyResearchProject Pojo Detail
     * @param userUuid 用户Uuid
     */
    @Select("SELECT * FROM (SELECT * FROM user_process_action ORDER BY createDate DESC LIMIT 9999) orderResult WHERE orderResult.userUuid=#{userUuid} GROUP BY orderResult.projectEntityUuid")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(column = "projectEntityUuid", property = "projectEntityUuid"),
            @Result(column = "businessEntityUuid", property = "businessEntityUuid"),
            @Result(column = "processInstanceId", property = "processInstanceId"),
            @Result(column = "processDefineId", property = "processDefineId"),
            @Result(column = "userUuid", property = "userUuid"),
            @Result(column = "createDate", property = "createDate"),
            @Result(property = "businessEntity", column = "businessEntityUuid", javaType = com.research_campus.domain.BusinessEntity.class, one = @One(select = "com.research_campus.dao.IEntityDao.selectBusinessEntityByUuid")),
            @Result(property = "projectEntity", column = "projectEntityUuid", javaType = com.research_campus.domain.ProjectEntity.class, one = @One(select = "com.research_campus.dao.IEntityDao.selectProjectEntityByUuid")),
    })
    List<MyResearchProject> selectPersonalResearchProjectDetail(@Param("userUuid") String userUuid);
}
