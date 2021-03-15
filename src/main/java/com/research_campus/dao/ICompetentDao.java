package com.research_campus.dao;

import com.research_campus.domain.Competent;
import com.research_campus.domain.Role;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author buwan
 */
public interface ICompetentDao {

    /**
     * 根据用户id查询用户职称
     * @param userId 用户id
     * @return 用户职称信息
     * @throws Exception
     */
    @Select("SELECT * FROM competent WHERE id IN (SELECT competentId FROM user_competent WHERE userId=#{userId})")
    Competent findCompetentByUserId(String userId) throws Exception;
}
