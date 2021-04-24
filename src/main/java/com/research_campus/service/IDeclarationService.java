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

    /**
     * 增加Declaration 信息
     * @param declaration declaration pojo 实体
     */
    void addDeclaration(Declaration declaration);

    /**
     * 更改Declaration 信息
     * @param declaration declaration pojo 实体
     */
    void modifyDeclaration(Declaration declaration);
}
