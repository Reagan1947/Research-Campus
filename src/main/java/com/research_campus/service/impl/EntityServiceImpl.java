package com.research_campus.service.impl;

import com.research_campus.dao.IDeclarationDao;
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

    IDeclarationDao declarationDao;

    @Autowired
    public void setDeclarationDao(IDeclarationDao declarationDao) {
        this.declarationDao = declarationDao;
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
    public List<ProBusDetail> findProBusDetailByBusinessEntityUuid(String businessEntityUuid) {
        return entityDao.selectProBusDetailByBusinessEntityUuid(businessEntityUuid);
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
    public void addProBus(ProBus proBus) {
        entityDao.addProBus(proBus);
    }

    @Override
    public void delete(Integer id) {

    }

    @Override
    public void modifyProBus(ProBus proBus) {
        entityDao.modifyProBus(proBus);
    }

    @Override
    public void projectDeclarationForm(ProBus proBus) {
        entityDao.projectDeclarationForm(proBus);
    }

    @Override
    public void removeProBusByProBusUuid(String proBusUuid) {
        entityDao.deleteProBusByProBusUuid(proBusUuid);
    }

    @Override
    public String findDeclarationUuidByProBusUuid(String proBusUuid) {
        return declarationDao.selectDeclarationUuidByProBusUuid(proBusUuid);
    }

    @Override
    public String findProjectBodyInformationUrlByDeclarationUuid(String declarationUuid) {
        return declarationDao.selectProjectBodyInformationUrlByDeclarationUuid(declarationUuid);
    }

    @Override
    public void removeDeclarationByDeclarationUuid(String declarationUuid) {
        declarationDao.deleteDeclarationByDeclarationUuid(declarationUuid);
    }

    @Override
    public void removeDeclarationProBusConnect(String proBusUuid) {
        declarationDao.deleteDeclarationProBusConnect(proBusUuid);
    }

    @Override
    public ProBus selectProBusByProBusUuid(String proBusUuid) {
        return entityDao.selectProBusByProBusUuid(proBusUuid);
    }
}
