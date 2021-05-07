package com.research_campus.service;

import com.research_campus.domain.Subject;

import java.util.List;

/**
 * 一二级部门 Service 接口
 * @author buwan
 */
public interface IDepartmentService {

    /**
     * 查询所有二级部门
     * @return List Subject
     */
    List<Subject> findAllSubject();

    /**
     * 添加部门-科研秘书 信息
     * @param subject 二级部门ID
     * @param groupOfUser 用户群组ID
     */
    void addGroupOfSecretary(String subject, String groupOfUser);

    /**
     * 更改部门-科研秘书信息
     * @param groupOfUserUuid 用户群组 Id
     * @param groupOfSecretaryId 部门-科研秘书 Id
     */
    void modifyGroupOfSecretary(String groupOfUserUuid, Integer groupOfSecretaryId);

    /**
     * 删除 部门-科研秘书 信息
     * @param groupOfSecretaryId GroupOfSecretary Id
     */
    void removeGroupOfSecretaryById(String groupOfSecretaryId);

    /**
     * 添加项目主体-科研处用户群组 信息
     * @param projectEntity 项目主体uuid
     * @param groupOfUser 用户群组uuid
     * @param type 群组-项目主体类型(professor: 专家群组，research Department：科研处群组)
     */
    void addGroupOfResearchDepartment(String projectEntity, String groupOfUser, String type);

    /**
     * 更改科研项目主体-科研处信息
     * @param groupOfUserUuid 科研群组uuid
     * @param groupOfResearchDepartmentId 科研处用户群组id
     */
    void modifyGroupOfResearchDepartment(String groupOfUserUuid, Integer groupOfResearchDepartmentId);

    /**
     * 删除 科研项目主体-科研处 信息
     * @param groupOfResearchDepartmentId groupOfResearchDepartmentId
     */
    void removeGroupOfResearchDepartment(String groupOfResearchDepartmentId);
}
