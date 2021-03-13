package com.research_campus.service;

import com.research_campus.domain.UserInfo;
import org.springframework.stereotype.Service;

/**
 * @author buwan
 */

public interface IUserInfService {

    /**
     * 通过用户名查询用户信息
     * @return UserInfo 对象
     * @param username 用户名
     */
    public UserInfo findUserInfByUsername(String username);
}
