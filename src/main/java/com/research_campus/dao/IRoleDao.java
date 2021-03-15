package com.research_campus.dao;

import com.research_campus.domain.Role;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author buwan
 */
public interface IRoleDao {

    /**
     * 根据用户Id查询出所有对应角色
     * @param userId
     * @return
     * @throws Exception
     */

    @Select("SELECT * FROM role WHERE id IN (SELECT roleId FROM user_role WHERE userId=#{userId})")
    List<Role> findRoleByUserId(String userId) throws Exception;

}
