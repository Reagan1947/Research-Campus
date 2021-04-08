package com.research_campus.dao;

import com.research_campus.domain.BpmnList;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

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
    @Delete("UPDATE bpmnlist SET bpmnName=#{bpmnName}, bpmnDesc=#{bpmnDesc}, bpmnFileName=#{bpmnFileName}, svgFileName=#{svgFileName}, bpmnStatus=#{bpmnStatus} WHERE bpmnUUID=#{bpmnUUID}")
    void changeBpmnInfByUuid(BpmnList bpmnList);
}
