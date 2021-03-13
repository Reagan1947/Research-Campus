package com.research_campus.dao;

import com.research_campus.domain.UserInfo;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

/**
 * @author buwan
 */

public interface IUserDao {

    /**
     * 通过用户名查询用户
     * @param username
     * @return
     */
    @Select("SELECT * FROM users WHERE username=#{username}")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "email", column = "email"),
            @Result(property = "username", column = "username"),
            @Result(property = "password", column = "password"),
            @Result(property = "phoneNumber", column = "phoneNumber"),
            @Result(property = "status", column = "status"),
            @Result(property = "uuid", column = "uuid"),
            @Result(property = "roles", column = "id", javaType = java.util.List.class, many = @Many(select = "com.research_campus.dao.IRoleDao.findRoleByUserId"))
    })
    UserInfo findUserByUserName(String username);

    /**
     * 通过Email地址查询用户
     * @param email
     * @return
     */
    @Select("SELECT * FROM users WHERE email=#{email}")
    UserInfo findUserByEmail(String email);
}
