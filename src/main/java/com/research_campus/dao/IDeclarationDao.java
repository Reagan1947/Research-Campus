package com.research_campus.dao;

import com.research_campus.domain.Declaration;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 可申报项目dao
 * @author buwan
 */
public interface IDeclarationDao {

    /**
     * 查询所有Declaration
     * @return list Declaration
     */
    @Select("SELECT * FROM projectdeclarationform")
    List<Declaration> getAllDeclaration();
}
