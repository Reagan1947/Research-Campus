package com.research_campus.service.impl;

import com.research_campus.dao.IEntityDao;
import com.research_campus.domain.*;
import com.research_campus.service.IEntityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Entity Service 实现类
 * @author buwan
 */
@Service
public class EntityServiceImpl implements IEntityService {

    IEntityDao entityDao;

    @Autowired
    public void setEntityDao(IEntityDao entityDao) {
        this.entityDao = entityDao;
    }

    @Override
    public List<ProjectEntity> getAllProjectEntity() {
        return entityDao.selectAllProjectEntity();
    }

    @Override
    public void addProjectEntity(ProjectEntity projectEntity) {
        entityDao.insertProjectEntity(projectEntity);
    }

    @Override
    public void deleteProjectEntityByUuid(String projectEntityUuid) {
        entityDao.deleteProjectEntityByUuid(projectEntityUuid);
    }

    @Override
    public BusinessEntity getBusinessEntityByUuid(String businessEntityUuid) {
        return entityDao.selectBusinessEntityByUuid(businessEntityUuid);
    }

    @Override
    public List<PbpInformation> getPbpInformationByBeUuid(String businessEntityUuid) {
        return entityDao.getPbpInformation(businessEntityUuid);
    }

    @Override
    public ProjectEntity getProjectEntityByUuid(String projectEntityUuid) {
        return entityDao.getProjectEntityByUuid(projectEntityUuid);
    }

    @Override
    public void modifyProjectEntityInf(ProjectEntity projectEntity) {
        entityDao.modifyProjectEntityInf(projectEntity);
    }

    @Override
    public Declaration getDeclarationDetail(String businessEntityUuid, String projectEntityUuid) {
        return entityDao.getDeclarationDetail(businessEntityUuid, projectEntityUuid);
    }

    @Override
    public void addPBEDetail(Pbep pbep) {
        entityDao.addPBEDetail(pbep);
    }


}
