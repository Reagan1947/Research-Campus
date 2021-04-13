package com.research_campus.service.impl;

import com.research_campus.dao.DeclarationDao;
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

    DeclarationDao declarationDao;

    @Autowired
    public DeclarationServiceImpl(DeclarationDao declarationDao) {
        this.declarationDao = declarationDao;
    }

    @Override
    public List<Declaration> getAllDeclaration() {
        return declarationDao.getAllDeclaration();
    }
}
