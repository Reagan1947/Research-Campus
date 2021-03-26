package com.research_campus.service.impl;

import com.research_campus.dao.IUserDao;
import com.research_campus.domain.Role;
import com.research_campus.domain.UserInfo;
import com.research_campus.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * @author buwan
 */

@Service("userService")
@Transactional
public class UserServiceImpl implements IUserService {

    @Autowired
    private IUserDao userDao;


    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserInfo userInfo = null;
        try {
            userInfo = userDao.findUserByUserName(username);
            // debug for
            // System.out.println("---------------------------------------------------------------");
            // System.out.println(userInfo);
            //  System.out.println("---------------------------------------------------------------");

        } catch (Exception e) {
            e.printStackTrace();
        }
        User user = new User(userInfo.getUserName(), "{noop}" + userInfo.getPassword(), getAuthority(userInfo.getRoles()));

        return user;
    }

    /**
     * 返回一个List集合，集合中装入角色描述
     *
     * @param roles
     */
    public List<SimpleGrantedAuthority> getAuthority(List<Role> roles) {
        List<SimpleGrantedAuthority> list = new ArrayList<>();
        for (Role role : roles) {
            list.add((new SimpleGrantedAuthority("ROLE_" + role.getRoleName())));
        }

        return list;
    }

}
