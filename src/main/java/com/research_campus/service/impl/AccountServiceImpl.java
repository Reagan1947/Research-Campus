package com.research_campus.service.impl;

import com.research_campus.domain.Account;
import com.research_campus.service.AccountService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author buwan
 */
@Service("accountService")
public class AccountServiceImpl implements AccountService {
    @Override
    public List<Account> findAll() {
        System.out.println("业务层查询所有账户");
        return null;
    }

    @Override
    public void saveAccount(Account account) {
        System.out.println("业务层保存所有用户");
    }
}
