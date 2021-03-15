package com.research_campus.dao;

import com.research_campus.domain.UserInfo;
import org.apache.ibatis.annotations.*;

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
     * 通过username查询用户基础信息(不包括密码等敏感信息)
     * @param username 用户名
     * @return 返回UserInfo对象
     */
    @Select("SELECT * FROM users WHERE username=#{username}")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "email", column = "email"),
            @Result(property = "username", column = "username"),
            @Result(property = "phoneNumber", column = "phoneNumber"),
            @Result(property = "chineseName", column = "chineseName"),
            @Result(property = "explanatory", column = "explanatory"),

            @Result(property = "competent", column = "id", javaType = java.lang.String.class, one = @One(select = "com.research_campus.dao.ICompetentDao.findCompetentByUserId")),  // 一对一
            @Result(property = "department", column = "id", javaType = java.util.List.class, many = @Many(select = "com.research_campus.dao.IDepartmentDao.findDepartmentByUserId")),  // 一对多
            @Result(property = "subject", column = "id", javaType = java.util.List.class, many = @Many(select = "com.research_campus.dao.ISubjectDao.findSubjectByUserId")), // 一对多
            @Result(property = "roles", column = "id", javaType = java.util.List.class, many = @Many(select = "com.research_campus.dao.IRoleDao.findRoleByUserId"))
    })
    UserInfo findUserByUserNameBase(String username);
}
