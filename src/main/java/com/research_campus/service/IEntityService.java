package com.research_campus.service;

import com.research_campus.domain.*;

import java.util.List;

/**
 * 项目主体与业务主体服务类
 * @author buwan
 */
public interface IEntityService {

    /**
     * 获得所有的Project Entity实例信息
     * @return List Project Entity
     */
    List<ProjectEntity> getAllProjectEntity();

    /**
     * 添加项目主体
     * @param projectEntity 项目主体 pojo
     */
    void addProjectEntity(ProjectEntity projectEntity);

    /**
     * 根据项目实体uuid 删除项目实体信息
     * @param projectEntityUuid 项目实体uuid
     */
    void deleteProjectEntityByUuid(String projectEntityUuid);

    /**
     * 根据 business entity uuid 查询business entity
     * @param businessEntityUuid business entity uuid
     * @return business entity pojo
     */
    BusinessEntity getBusinessEntityByUuid(String businessEntityUuid);

    /**
     * 获得所有pbp信息
     * @return pbp pojo
     * @param businessEntityUuid 业务主体Uuid
     */
    List<ProBusDetail> findProBusDetailByBusinessEntityUuid(String businessEntityUuid);

    /**
     * 根据UUID 获得 projectEntity信息
     * @param projectEntityUuid projectEntity UUID
     * @return projectEntity pojo
     */
    ProjectEntity getProjectEntityByUuid(String projectEntityUuid);

    /**
     * 根据 project entity uuid 更改project entity
     * @param projectEntity project entity
     */
    void modifyProjectEntityInf(ProjectEntity projectEntity);

    /**
     * 根据business entity uuid 和 project entity uuid 查询 declaration
     * @param businessEntityUuid business 实体 uuid
     * @param projectEntityUuid project 实体 Uuid
     * @return Declaration pojo
     */
    Declaration getDeclarationDetail(String businessEntityUuid, String projectEntityUuid);


    /**
     * 添加 pbep 信息
     * @param proBus pbep pojo
     */
    void addProBus(ProBus proBus);

    /**
     * 更改pbep信息
     * @param proBus pbep pojo
     */
    void modifyProBus(ProBus proBus);

    /**
     * 根据Id删除PBIformation
     * @param id PBInformation id
     */
    void delete(Integer id);

    /**
     * 伴随businessEntity内容的更改 projectdeclarationform 表单信息更改
     * @param proBus pbep pojo
     */
    void projectDeclarationForm(ProBus proBus);

    /**
     * 根据 ProBusUuid 删除 proBusUuid
     * @param proBusUuid proBusUuid
     */
    void removeProBusByProBusUuid(String proBusUuid);

    /**
     * 根据 proBusUuid 查询 declarationUuid
     * @param proBusUuid proBusUuid
     * @return String declarationUuid
     */
    String findDeclarationUuidByProBusUuid(String proBusUuid);

    /**
     * 根据 declarationUuid 查询 declarationPageUuid
     * @param declarationUuid declarationUuid
     * @return String declarationPageUuid
     */
    String findProjectBodyInformationUrlByDeclarationUuid(String declarationUuid);

    /**
     * 根据 DeclarationUuid 删除 Declaration
     * @param declarationUuid declarationUuid
     */
    void removeDeclarationByDeclarationUuid(String declarationUuid);

    /**
     * 根据 proBusUuid 删除 proBus 与 declaration 关系维护表信息
     * @param proBusUuid proBusUuid
     */
    void removeDeclarationProBusConnect(String proBusUuid);
}
