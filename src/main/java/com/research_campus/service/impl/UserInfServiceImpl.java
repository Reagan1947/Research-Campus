package com.research_campus.service.impl;

import com.research_campus.dao.IUserDao;
import com.research_campus.domain.UserInfo;
import com.research_campus.service.IUserInfService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author buwan
 */

@Service
public class UserInfServiceImpl implements IUserInfService {

    @Autowired
    IUserDao userDao;

    @Override
    public UserInfo findUserInfByUsername(String username) {
        UserInfo userInfo = null;
        try {
            userInfo = userDao.findUserByUserName(username);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return userInfo;
    }
}
