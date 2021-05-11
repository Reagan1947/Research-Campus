package com.research_campus.dao;

import com.research_campus.domain.Subject;
import com.research_campus.domain.UserInfo;
import org.apache.ibatis.annotations.*;

import java.util.List;

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

    /**
     * 查询所有用户信息
     * @return userInf List
     */
    @Select("SELECT * FROM users")
    List<UserInfo> selectAllUserInfo();

    /**
     * 根据 UserId 查询所在二级部门
     * @param id UserId
     * @return List Subject 用户可能在多个部门
     */
    @Select("SELECT id, subjectName, subjectDesc FROM (SELECT * FROM " +
            " user_subject LEFT JOIN subject " +
            " ON user_subject.subjectId = subject.id WHERE userId = #{id}) subject_user_result ")
    List<Subject> selectSubjectByUserId(@Param("id") Integer id);
}
