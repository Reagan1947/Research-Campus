package com.research_campus.dao;

import com.research_campus.domain.Declaration;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

/**
 * 可申报项目dao
 * @author buwan
 */
public interface IDeclarationDao {

    /**
     * 查询所有Declaration
     * @return list Declaration
     */
    @Select("SELECT * FROM projectdeclarationform")
    List<Declaration> getAllDeclaration();

    /**
     * 增加Declaration 信息
     * @param declaration declaration pojo 实体
     */
    @Insert("INSERT INTO projectdeclarationform (declarationName, declarationAnnouncement, declarationOverview, processDefineId, declarationUuid, projectEntityUuid, businessEntityUuid)" +
            "VALUES (#{declarationName}, #{declarationAnnouncement}, #{declarationOverview}, #{processDefineId}, #{declarationUuid}, #{projectEntityUuid}, #{businessEntityUuid})")
    void addDeclaration(Declaration declaration);

    /**
     * 更改 Declaration 信息
     * @param declaration declaration pojo
     */
    @Update("UPDATE projectdeclarationform SET declarationName=#{declarationName}, " +
            "declarationAnnouncement=#{declarationAnnouncement}, " +
            "declarationOverview=#{declarationOverview}, " +
            "processDefineId=#{processDefineId}, " +
            "projectEntityUuid=#{projectEntityUuid}," +
            "businessEntityUuid=#{businessEntityUuid}," +
            "WHERE declarationUuid=#{declarationUuid}")
    void modifyDeclaration(Declaration declaration);
}
