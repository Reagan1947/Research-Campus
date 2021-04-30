package com.research_campus.service;

import com.research_campus.domain.Declaration;
import com.research_campus.domain.ProBus;
import com.research_campus.domain.UserProcessAction;

import java.util.List;

/**
 * 可申报项目 service
 * @author buwan
 */
public interface IDeclarationService {

    /**
     * 查询所有的 可申报项目
     * @return 可申报项目list
     */
    List<Declaration> getAllDeclaration();

    /**
     * 增加Declaration 信息
     * @param declaration declaration pojo 实体
     */
    void addDeclaration(Declaration declaration);

    /**
     * 更改Declaration 信息
     * @param declaration declaration pojo 实体
     */
    void modifyDeclaration(Declaration declaration);

    /**
     * 添加declaration url 信息 by uuid
     * @param uuid declaration url
     * @param declarationUuid declaration uuid
     */
    void addDeclarationUrlByDeclarationUuid(String uuid, String declarationUuid);

    /**
     * 根据BusinessEntityUuid检索 declaration 公告
     * @param businessEntityUuid businessEntityUUid 业务主体
     * @return List Declaration
     */
    List<Declaration> getDeclarationByBusinessEntityUuid(String businessEntityUuid);

    /**
     * 根据 declarationUuid 返回 declaration
     * @param declarationUuid declaration uuid
     * @return List Declaration
     */
    Declaration getDeclarationByUuid(String declarationUuid);

    /**
     * 根据 ProBusUui 查询 Declaration
     * @param proBusUuid proBusUuid
     * @return Declaration
     */
    Declaration getDeclarationByProBusUuid(String proBusUuid);

    /**
     * 增加 proBus 与 Declaration 关系
     * @param uuid Declaration Uuid
     * @param proBusUuid proBus Uuid
     */
    void addProBusDeclaration(String uuid, String proBusUuid);

    /**
     * 根据 proBus 中 businessEntityUuid 查询 declarationList
     * @param businessEntityUuid proBus中 businessEntityUuid
     * @return Declaration List
     */
    List<Declaration> findDeclarationListByBusinessEntityUuid(String businessEntityUuid);

    /**
     * 根据 declarationUuid 查询 ProBus
     * @param declarationUuid declarationUuid
     * @return ProBus
     */
    ProBus findProBusByDeclarationUuid(String declarationUuid);

    /**
     * 添加 userProcessAction 信息
     * @param userProcessAction userProcessAction pojo
     */
    void addUserProcessAction(UserProcessAction userProcessAction);
}
