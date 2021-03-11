package com.research_campus.service;

import com.research_campus.domain.Account;

import java.util.List;

/**
 * @author buwan
 */
public interface AccountService {

    /**
     * 查询用户信息
     * @return
     */
    public List<Account> findAll();

    /**
     * 存用户信息
     * @return none
     * @param account
     */
    public void saveAccount(Account account);

}
