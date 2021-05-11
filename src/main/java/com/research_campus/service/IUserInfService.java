package com.research_campus.service;

import com.research_campus.domain.Subject;
import com.research_campus.domain.UserInfo;

import java.util.List;

/**
 * @author buwan
 */

public interface IUserInfService {

    /**
     * 通过用户名查询用户信息
     * @return UserInfo 对象
     * @param username 用户名
     */
    UserInfo findUserInfByUsername(String username);

    /**
     * 根据用户名查询用户基础信息
     * @param username 用户名
     * @return 用户UserInfo对象
     */
    UserInfo findUserInfByUsernameBase(String username);

    /**
     * 查询所有用户信息
     * @return 用户信息 List
     */
    List<UserInfo> findAllUserInfo();

    /**
     *
     * @param id
     * @return
     */
    List<Subject> findUserSubjectByUserId(Integer id);
}
