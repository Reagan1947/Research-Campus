package com.research_campus.service.impl;

import com.research_campus.dao.IUserDao;
import com.research_campus.domain.Subject;
import com.research_campus.domain.UserInfo;
import com.research_campus.service.IUserInfService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author buwan
 */

@Service
public class UserInfServiceImpl implements IUserInfService {

    IUserDao userDao;

    @Autowired
    public UserInfServiceImpl(IUserDao userDao) {
        this.userDao = userDao;
    }

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

    @Override
    public UserInfo findUserInfByUsernameBase(String username) {
        UserInfo userInfo = null;
        try {
            userInfo = userDao.findUserByUserNameBase(username);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return userInfo;
    }

    @Override
    public List<UserInfo> findAllUserInfo() {
        return userDao.selectAllUserInfo();
    }

    @Override
    public List<Subject> findUserSubjectByUserId(Integer id) {
        return userDao.selectSubjectByUserId(id);
    }
}
