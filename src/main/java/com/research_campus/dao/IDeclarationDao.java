package com.research_campus.dao;

import com.research_campus.domain.Declaration;
import com.research_campus.domain.ProBus;
import com.research_campus.domain.UserProcessAction;
import org.apache.ibatis.annotations.*;

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
    @Insert("INSERT INTO declaration (declarationName, declarationAnnouncement, declarationOverview, declarationUuid)" +
            "VALUES (#{declarationName}, #{declarationAnnouncement}, #{declarationOverview}, #{declarationUuid})")
    void addDeclaration(Declaration declaration);

    /**
     * 更改 Declaration 信息
     * @param declaration declaration pojo
     */
    @Update("UPDATE declaration SET declarationName=#{declarationName}, " +
            "declarationAnnouncement=#{declarationAnnouncement}, " +
            "declarationOverview=#{declarationOverview} " +
            "WHERE declarationUUID=#{declarationUuid}")
    void modifyDeclaration(Declaration declaration);

    /**
     * 根据declaration uuid 更改其 declaration url
     * @param uuid declaration url
     * @param declarationUuid declaration uuid
     */
    @Update("UPDATE declaration SET projectBodyInformationURL=#{uuid} WHERE declarationUuid=#{declarationUuid}")
    void addDeclarationUrlByDeclarationUuid(@Param("uuid") String uuid, @Param("declarationUuid") String declarationUuid);

    /**
     * 根据BusinessEntityUuid检索 declaration 公告
     * @param businessEntityUuid business Entity Uuid
     * @return List Declaration
     */
    @Select("SELECT * FROM projectdeclarationform WHERE businessEntityUuid=#{businessEntityUuid}")
    List<Declaration> getDeclarationByBusinessEntityUuid(String businessEntityUuid);

    /**
     * 根据 proBusUuid 查询 declarationUuid
     * @param proBusUuid proBusUuid
     * @return declarationUuid
     */
    @Select("SELECT declarationUuid FROM probus_declaration WHERE proBusUuid=#{proBusUuid}")
    String selectDeclarationUuidByProBusUuid(@Param("proBusUuid") String proBusUuid);

    /**
     * 根据 declarationUuid 查询 Declaration
     * @param declarationUuid declarationUuid
     * @return Declaration
     */
    @Select("SELECT * FROM declaration WHERE declarationUuid=#{declarationUuid}")
    Declaration findDeclarationByDeclarationUuid(String declarationUuid);

    /**
     * 增加 proBus 与 Declaration 间关系
     * @param uuid declaration uuid
     * @param proBusUuid proBus Uuid
     */
    @Insert("INSERT INTO probus_declaration (proBusUuid, declarationUuid) VALUES (#{proBusUuid}, #{uuid})")
    void addProBusDeclaration(@Param("uuid") String uuid, @Param("proBusUuid") String proBusUuid);

    /**
     * 根据 declarationUuid 查询 declarationPageUuid
     * @param declarationUuid declarationUuid
     * @return String declarationPageUuid / projectBodyInformationURL
     */
    @Select("SELECT projectBodyInformationURL FROM declaration WHERE declarationUuid=#{declarationUuid}")
    String selectProjectBodyInformationUrlByDeclarationUuid(@Param("declarationUuid") String declarationUuid);

    /**
     * 根据 declarationUuid 删除 declaration
     * @param declarationUuid declarationUuid
     */
    @Delete("DELETE FROM declaration WHERE declarationUuid=#{declarationUuid}")
    void deleteDeclarationByDeclarationUuid(@Param("declarationUuid") String declarationUuid);

    /**
     * 根据 proBusUuid 删除 proBus 与 declaration 关系维护表信息
     * @param proBusUuid proBusUuid
     */
    @Delete("DELETE FROM probus_declaration WHERE proBusUuid=#{proBusUuid}")
    void deleteDeclarationProBusConnect(String proBusUuid);

    /**
     * 根据 businessEntityUuid 返回 ProBus List
     * @param businessEntityUuid businessEntityUuid
     * @return List ProBus
     */
    @Select("SELECT * FROM proBus WHERE businessEntityUuid=#{businessEntityUuid}")
    List<ProBus> selectProBusListByBusinessEntityUuid(@Param("businessEntityUuid") String businessEntityUuid);

    /**
     * 根据 declarationUuid 查询 proBusUuid
     * @param declarationUuid declarationUuid
     * @return proBusUuid
     */
    @Select("SELECT proBusUuid FROM probus_declaration WHERE declarationUuid=#{declarationUuid}")
    String selectProBusUuidByDeclarationUuid(String declarationUuid);

    /**
     * 添加 userProcessAction 信息
     * @param userProcessAction userProcessAction pojo
     */
    @Insert("INSERT INTO user_process_action " +
            "(businessEntityUuid, userUuid, projectEntityUuid, processDefineId, processInstanceId) " +
            "VALUES (#{businessEntityUuid}, #{userUuid}, #{projectEntityUuid}, #{processDefineId}, #{processInstanceId})")
    void insertUserProcessAction(UserProcessAction userProcessAction);
}
