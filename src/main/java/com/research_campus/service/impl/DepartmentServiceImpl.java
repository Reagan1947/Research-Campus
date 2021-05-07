package com.research_campus.service.impl;

import com.research_campus.dao.IDepartmentDao;
import com.research_campus.domain.Subject;
import com.research_campus.service.IDepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.xml.ws.Action;
import java.util.List;

/**
 * 一二级部门 Service Impl
 * @author buwan
 */
@Service
public class DepartmentServiceImpl implements IDepartmentService {

    IDepartmentDao departmentDao;

    @Autowired
    public void setDepartmentDao(IDepartmentDao departmentDao) {
        this.departmentDao = departmentDao;
    }

    @Override
    public List<Subject> findAllSubject() {
        return departmentDao.selectAllSubject();
    }

    @Override
    public void addGroupOfSecretary(String subject, String groupOfUser) {
        departmentDao.insertGroupOfSecretary(subject, groupOfUser);
    }

    @Override
    public void modifyGroupOfSecretary(String groupOfUserUuid, Integer groupOfSecretaryId) {
        departmentDao.updateGroupOfSecretary(groupOfUserUuid, groupOfSecretaryId);
    }

    @Override
    public void removeGroupOfSecretaryById(String groupOfSecretaryId) {
        departmentDao.deleteGroupOfSecretaryById(groupOfSecretaryId);
    }

    @Override
    public void addGroupOfResearchDepartment(String projectEntity, String groupOfUser, String type) {
        departmentDao.insertGroupOfResearchDepartment(projectEntity, groupOfUser, type);
    }

    @Override
    public void modifyGroupOfResearchDepartment(String groupOfUserUuid, Integer groupOfResearchDepartmentId) {
        departmentDao.updateGroupOfResearchDepartment(groupOfUserUuid, groupOfResearchDepartmentId);
    }

    @Override
    public void removeGroupOfResearchDepartment(String groupOfResearchDepartmentId) {
        departmentDao.deleteGroupOfResearchDepartmentById(groupOfResearchDepartmentId);
    }
}
