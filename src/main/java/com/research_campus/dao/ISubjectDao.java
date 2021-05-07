package com.research_campus.dao;

import com.research_campus.domain.Role;
import com.research_campus.domain.Subject;
import com.research_campus.domain.UserInfo;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @author buwan
 */
public interface ISubjectDao {

    /**
     * 根据用户id查询用户 所属二级科目
     * @param userId
     * @return
     * @throws Exception
     */
    @Select("SELECT * FROM subject WHERE id IN (SELECT subjectId FROM user_subject WHERE userId=#{userId})")
    List<Subject> findSubjectByUserId(String userId) throws Exception;

    /**
     * 查询所有用户-二级部门信息 以二级部门组织
     * @return Subject List
     */
    @Select("SELECT * FROM subject")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(column = "subjectDesc", property = "subjectDesc"),
            @Result(property = "users", column = "id", javaType = java.util.List.class, many = @Many(select = "com.research_campus.dao.ISubjectDao.findUserListBySubjectId"))
    })    List<Subject> findAllUsersGroupBySubject();

    /**
     * 根据部门组织用户
     * @param subjectId 二级部门 id
     * @return 用户
     */
    @Select("SELECT id, email, username, phoneNumber, uuid, chineseName, explanatory FROM users WHERE id IN (SELECT userId FROM user_subject WHERE subjectId=#{subjectId})")
    List<UserInfo> findUserListBySubjectId(Integer subjectId);
}
