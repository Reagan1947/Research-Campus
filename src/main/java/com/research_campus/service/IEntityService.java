package com.research_campus.service;

import com.research_campus.domain.*;
import org.springframework.stereotype.Service;

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
    List<PbpInformation> getPbpInformationByBeUuid(String businessEntityUuid);

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
     * @param pbep pbep pojo
     */
    void addPBEDetail(Pbep pbep);

    /**
     * 更改pbep信息
     * @param pbep pbep pojo
     * @param id pbep id
     */
    void modifyPbep(Pbep pbep, String id);

    /**
     * 根据Id删除PBIformation
     * @param id PBInformation id
     */
    void deletePBInformationById(Integer id);

    /**
     * 根据projectEntityUuid、processDefineId 删除 Declaration
     * @param projectEntityUuid project Entity Uuid
     * @param processDefineId process Define Id
     */
    void deleteDeclaration(String projectEntityUuid, String processDefineId);

    /**
     * 伴随businessEntity内容的更改 projectdeclarationform 表单信息更改
     * @param pbep pbep pojo
     */
    void projectDeclarationForm(Pbep pbep);
}
