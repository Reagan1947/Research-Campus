package com.research_campus.service;

import com.research_campus.domain.Declaration;

import java.util.List;

/**
 * 可申报项目 service
 * @author buwan
 */
public interface IDeclarationService {

    /**
     * 查询所有的 可申报项目
     * @return 可申报项目list
     */
    List<Declaration> getAllDeclaration();
}
