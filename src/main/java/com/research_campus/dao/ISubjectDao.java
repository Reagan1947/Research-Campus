package com.research_campus.dao;

import com.research_campus.domain.Role;
import com.research_campus.domain.Subject;
import org.apache.ibatis.annotations.Select;

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
}
