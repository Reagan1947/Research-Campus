package com.research_campus.dao;

import com.research_campus.domain.GroupOfResearchDepartment;
import com.research_campus.domain.GroupOfSecretary;
import com.research_campus.domain.Subject;
import com.research_campus.domain.UserInfo;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @author buwan
 */
public interface IUserGroupDao {

    /**
     * 查询用户群组与科研秘书关系结果
     * @return List GroupOfSecretary
     */
    @Select("SELECT * FROM group_subject")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(column = "subjectId", property = "subjectId"),
            @Result(column = "groupOfUserUuid", property = "groupOfUserUuid"),
            @Result(property = "subject", column = "subjectId", javaType = com.research_campus.domain.Subject.class, one = @One(select = "com.research_campus.dao.IDepartmentDao.selectSubjectById")),
    })
    List<GroupOfSecretary> selectGroupOfSecretaryList();

    /**
     * 根据 Uuid 查询用户
     * @param id userUuid
     * @return UserInfo pojo
     */
    @Select("SELECT id, email, username, phoneNumber, uuid, chineseName, explanatory FROM users WHERE uuid=#{id}")
    UserInfo selectUserByUuid(@Param("id") String id);

    /**
     * 根据 UserUuid 查询 UserId
     * @param userUuid String UserUuid
     * @return Integer UserId
     */
    @Select("SELECT id FROM users WHERE uuid=#{userUuid}")
    Integer selectUserIdByUserUuid(@Param("userUuid") String userUuid);

    /**
     * 根据 UserId 查询其所在二级部门 Id
     * @param userId Integer UserId
     * @return Integer SubjectId
     */
    @Select("SELECT subjectId FROM user_subject WHERE userId=#{userId}")
    Integer selectSubjectIdByUserId(@Param("userId") Integer userId);

    /**
     * 根据 subjectId 查询所在对应组的 Uuid
     * @param subjectId Integer SubjectId
     * @return String groupOfUserUuid
     */
    @Select("SELECT groupOfUserUuid FROM group_subject WHERE subjectId=#{subjectId}")
    String selectGroupOfUserUuidBySubjectId(@Param("subjectId") Integer subjectId);

    /**
     * 查询用户群组与科研处关系结果
     * @return List GroupOfResearchDepartment Pojo
     * @param type type
     */
    @Select("SELECT * FROM group_projectentity WHERE type=#{type}")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(column = "projectEntityUuid", property = "projectEntityUuid"),
            @Result(column = "groupOfUserUuid", property = "groupOfUserUuid"),
            @Result(property = "projectEntity", column = "projectEntityUuid", javaType = com.research_campus.domain.ProjectEntity.class, one = @One(select = "com.research_campus.dao.IEntityDao.selectProjectEntityByUuid")),
    })
    List<GroupOfResearchDepartment> selectGroupOfResearchDepartmentList(@Param("type") String type);
}
