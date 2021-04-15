package com.research_campus.service.impl;

import com.research_campus.dao.IDeclarationDao;
import com.research_campus.domain.Declaration;
import com.research_campus.service.IDeclarationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

    @Override
    public List<Declaration> getAllDeclaration() {
        return declarationDao.getAllDeclaration();
    }
}