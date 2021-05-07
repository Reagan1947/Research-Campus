package com.research_campus.service;

import com.research_campus.domain.GroupOfResearchDepartment;
import com.research_campus.domain.GroupOfSecretary;
import com.research_campus.domain.Subject;
import com.research_campus.domain.UserInfo;

import java.util.List;

/**
 * 用户群组 Service 类
 * @author buwan
 */
public interface IUserGroupService {

    /**
     * 查询用户群组与科研秘书关系结果
     * @return List GroupOfSecretary
     */
    List<GroupOfSecretary> findGroupOfSecretaryList();

    /**
     * 根据二级部门 组织用户
     * @return 二级部门 pojo (包含用户)
     */
    List<Subject> getUsersGroupBySubject();

    /**
     * 根据 Uuid 查询用户
     * @param id userUuid
     * @return UserInfo pojo
     */
    UserInfo findUserByUuid(String id);

    /**
     * 根据用户 uuid 查询其对应二级部门 科研秘书群组
     * @param userUuid User uuid
     * @return String 二级部门秘书群组Id
     */
    String findGroupOfSecretaryByUserUuid(String userUuid);

    /**
     * 查询用户群组与科研处关系结果
     * @return List GroupOfResearchDepartment pojo
     */
    List<GroupOfResearchDepartment> findGroupOfResearchDepartment(String type);
}
