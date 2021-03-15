package com.research_campus.dao;

import com.research_campus.domain.Department;
import com.research_campus.domain.Role;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author buwan
 */
public interface IDepartmentDao {
    /**
     * 根据用户id查询用户所属一级部门
     * @param userId 用户id
     * @return 用户所属一级部门信息
     * @throws Exception
     */
    @Select("SELECT * FROM department WHERE id IN (SELECT departmentId FROM user_department WHERE userId=#{userId})")
    List<Department> findDepartmentByUserId(String userId) throws Exception;
}
