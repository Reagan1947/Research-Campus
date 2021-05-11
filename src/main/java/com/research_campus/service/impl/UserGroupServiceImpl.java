package com.research_campus.service.impl;

import com.research_campus.dao.ISubjectDao;
import com.research_campus.dao.IUserGroupDao;
import com.research_campus.domain.GroupOfResearchDepartment;
import com.research_campus.domain.GroupOfSecretary;
import com.research_campus.domain.Subject;
import com.research_campus.domain.UserInfo;
import com.research_campus.service.IUserGroupService;
import org.activiti.engine.IdentityService;
import org.activiti.engine.ProcessEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 用户群组 Service 实现类
 * @author buwan
 */
@Service
public class UserGroupServiceImpl implements IUserGroupService {

    IUserGroupDao userGroupDao;

    @Autowired
    public void setUserGroupDao(IUserGroupDao userGroupDao) {
        this.userGroupDao = userGroupDao;
    }

    ISubjectDao subjectDao;

    @Autowired
    public void setSubjectDao(ISubjectDao subjectDao) {
        this.subjectDao = subjectDao;
    }

    ProcessEngine processEngine;

    @Autowired
    public void setProcessEngine(ProcessEngine processEngine) {
        this.processEngine = processEngine;
    }

    @Override
    public List<GroupOfSecretary> findGroupOfSecretaryList() {
        IdentityService identityService = processEngine.getIdentityService();
        List<GroupOfSecretary>  groupOfSecretaryList =  userGroupDao.selectGroupOfSecretaryList();
        for(GroupOfSecretary groupOfSecretary : groupOfSecretaryList){
            // 根据GroupId 查询 Group
            groupOfSecretary.setGroup(identityService.createGroupQuery().groupId(groupOfSecretary.getGroupOfUserUuid()).singleResult());
        }

        return groupOfSecretaryList;
    }

    @Override
    public List<Subject> getUsersGroupBySubject() {
        return subjectDao.findAllUsersGroupBySubject();
    }

    @Override
    public UserInfo findUserByUuid(String id) {
        return userGroupDao.selectUserByUuid(id);
    }

    @Override
    public String findGroupOfSecretaryByUserUuid(String userUuid) {
        // 根据 User uuid 查询 id
        Integer userId = userGroupDao.selectUserIdByUserUuid(userUuid);
        // 根据 UserId 查询所在的二级部门Id
        Integer subjectId = userGroupDao.selectSubjectIdByUserId(userId);
        // 根据 二级部门Id 查询其 GroupOfUserUuid
        return userGroupDao.selectGroupOfUserUuidBySubjectId(subjectId);
    }

    @Override
    public List<GroupOfResearchDepartment> findGroupOfResearchDepartment(String type) {
        IdentityService identityService = processEngine.getIdentityService();
        List<GroupOfResearchDepartment>  groupOfResearchDepartmentList =  userGroupDao.selectGroupOfResearchDepartmentList(type);
        for(GroupOfResearchDepartment groupOfResearchDepartment : groupOfResearchDepartmentList){
            // 根据GroupId 查询 Group
            groupOfResearchDepartment.setGroup(identityService.createGroupQuery().groupId(groupOfResearchDepartment.getGroupOfUserUuid()).singleResult());
        }

        return groupOfResearchDepartmentList;
    }

    @Override
    public String findGroupOfUserUuid(String type, String projectEntityUuid) {
        return userGroupDao.selectGroupOfUserUuid(type, projectEntityUuid);
    }
}
