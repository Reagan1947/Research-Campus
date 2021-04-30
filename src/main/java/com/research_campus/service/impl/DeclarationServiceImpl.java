package com.research_campus.service.impl;

import com.research_campus.dao.IDeclarationDao;
import com.research_campus.dao.IEntityDao;
import com.research_campus.domain.Declaration;
import com.research_campus.domain.ProBus;
import com.research_campus.domain.UserProcessAction;
import com.research_campus.service.IDeclarationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Declaration service impl
 * @author buwan
 */
@Service
public class DeclarationServiceImpl implements IDeclarationService {

    IDeclarationDao declarationDao;

    @Autowired
    public DeclarationServiceImpl(IDeclarationDao declarationDao) {
        this.declarationDao = declarationDao;
    }

    IEntityDao entityDao;

    @Autowired
    public void setEntityDao(IEntityDao entityDao) {
        this.entityDao = entityDao;
    }

    @Override
    public List<Declaration> getAllDeclaration() {
        return declarationDao.getAllDeclaration();
    }

    @Override
    public void addDeclaration(Declaration declaration) {
        declarationDao.addDeclaration(declaration);
    }

    @Override
    public void modifyDeclaration(Declaration declaration) {
        declarationDao.modifyDeclaration(declaration);
    }

    @Override
    public void addDeclarationUrlByDeclarationUuid(String uuid, String declarationUuid) {
        declarationDao.addDeclarationUrlByDeclarationUuid(uuid, declarationUuid);
    }

    @Override
    public List<Declaration> getDeclarationByBusinessEntityUuid(String businessEntityUuid) {
        return declarationDao.getDeclarationByBusinessEntityUuid(businessEntityUuid);
    }

    @Override
    public Declaration getDeclarationByUuid(String declarationUuid) {
        return declarationDao.findDeclarationByDeclarationUuid(declarationUuid);
    }

    @Override
    public Declaration getDeclarationByProBusUuid(String proBusUuid) {
        Declaration declaration;
        String declarationUuid = declarationDao.selectDeclarationUuidByProBusUuid(proBusUuid);
        if(declarationUuid == null ){
            declaration = null;
        } else {
            declaration = declarationDao.findDeclarationByDeclarationUuid(declarationUuid);
        }

        return declaration;
    }

    @Override
    public void addProBusDeclaration(String uuid, String proBusUuid) {
        declarationDao.addProBusDeclaration(uuid, proBusUuid);
    }

    @Override
    public List<Declaration> findDeclarationListByBusinessEntityUuid(String businessEntityUuid) {
        // 查询 List<ProBus>
        List<ProBus> proBusList = declarationDao.selectProBusListByBusinessEntityUuid(businessEntityUuid);
        List<Declaration> declarationList = new ArrayList<>();
        for (ProBus proBus : proBusList) {
            String proBusUuid = proBus.getProBusUuid();

            // 在关系表中查询
            String declarationUuid = declarationDao.selectDeclarationUuidByProBusUuid(proBusUuid);

            // 根据 declarationUuid 查找 declaration
            Declaration declaration = declarationDao.findDeclarationByDeclarationUuid(declarationUuid);
            declarationList.add(declaration);
        }

        return declarationList;
    }

    @Override
    public ProBus findProBusByDeclarationUuid(String declarationUuid) {
        // 在关系表中根据declarationUuid查询proBusUuid
        String proBusUuid = declarationDao.selectProBusUuidByDeclarationUuid(declarationUuid);

        // 根据 proBusUuid 查询 ProBus
        return entityDao.selectProBusByProBusUuid(proBusUuid);
    }

    @Override
    public void addUserProcessAction(UserProcessAction userProcessAction) {
        declarationDao.insertUserProcessAction(userProcessAction);
    }
}
