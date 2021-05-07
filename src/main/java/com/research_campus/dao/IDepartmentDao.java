package com.research_campus.dao;

import com.research_campus.domain.Department;
import com.research_campus.domain.Role;
import com.research_campus.domain.Subject;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @author buwan
 */
public interface IDepartmentDao {
    /**
     * 根据用户id查询用户所属一级部门
     * @param userId 用户id
     * @return 用户所属一级部门信息
     * @throws Exception Exception
     */
    @Select("SELECT * FROM department WHERE id IN (SELECT departmentId FROM user_department WHERE userId=#{userId})")
    List<Department> findDepartmentByUserId(String userId) throws Exception;

    /**
     * 查找所有的 Subject
     * @return List Subject
     */
    @Select("SELECT * FROM subject")
    List<Subject> selectAllSubject();


    /**
     * 根据 subjectId 查询 subject
     * @param subjectId subjectID
     * @return subject pojo
     */
    @Select("SELECT * FROM subject WHERE id=#{subjectId}")
    Subject selectSubjectById(@Param("subjectId") String subjectId);

    /**
     * 添加二级部门-科研秘书(用户群组)信息
     * @param subject 二级部门ID
     * @param groupOfUser 科研秘书(用户群组ID)
     */
    @Insert("INSERT INTO group_subject (subjectId, groupOfUserUuid)" +
            "values (#{subject}, #{groupOfUser})")
    void insertGroupOfSecretary(@Param("subject") String subject, @Param("groupOfUser") String groupOfUser);

    /**
     * 更改部门-科研秘书信息
     * @param groupOfUserUuid 用户群组 Id
     * @param groupOfSecretaryId 部门-科研秘书 Id
     */
    @Update("UPDATE group_subject SET groupOfUserUuid=#{groupOfUserUuid} WHERE id=#{groupOfSecretaryId}")
    void updateGroupOfSecretary(@Param("groupOfUserUuid") String groupOfUserUuid, @Param("groupOfSecretaryId") Integer groupOfSecretaryId);

    /**
     * 删除 部门-科研秘书 信息
     * @param groupOfSecretaryId 部门-科研秘书 用户群组 Id
     */
    @Delete("DELETE FROM group_subject WHERE id='${groupOfSecretaryId}'")
    void deleteGroupOfSecretaryById(@Param("groupOfSecretaryId") String groupOfSecretaryId);

    /**
     * 添加项目主体-科研处用户群组 信息
     * @param projectEntity 项目主体uuid
     * @param groupOfUser 用户群组uuid
     * @param type 群组-项目主体类型(professor: 专家群组，research Department：科研处群组)
     */
    @Insert("INSERT INTO group_projectEntity (type, projectEntityUuid, groupOfUserUuid)" +
            "VALUES (#{type}, #{projectEntity}, #{groupOfUser})")
    void insertGroupOfResearchDepartment(@Param("projectEntity") String projectEntity, @Param("groupOfUser") String groupOfUser, @Param("type") String type);

    /**
     * 更改科研项目主体-科研处信息
     * @param groupOfUserUuid 科研群组uuid
     * @param groupOfResearchDepartmentId 科研处用户群组id
     */
    @Update("UPDATE group_projectEntity SET groupOfUserUuid=#{groupOfUserUuid} WHERE id=#{groupOfResearchDepartmentId}")
    void updateGroupOfResearchDepartment(@Param("groupOfUserUuid") String groupOfUserUuid, @Param("groupOfResearchDepartmentId") Integer groupOfResearchDepartmentId);

    /**
     * 删除 科研项目主体-科研处 信息
     * @param groupOfResearchDepartmentId groupOfResearchDepartmentId
     */
    @Delete("DELETE FROM group_projectEntity WHERE id='${groupOfResearchDepartmentId}'")
    void deleteGroupOfResearchDepartmentById(@Param("groupOfResearchDepartmentId") String groupOfResearchDepartmentId);
}
