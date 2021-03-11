package com.research_campus.dao;
import com.research_campus.domain.Account;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author buwan
 */
public interface AccountDao {

    /**
     * 查询用户信息
     * @return
     */
    @Select("select * from account")
    public List<Account> findAll();

    /**
     * 存用户信息
     * @return none
     * @param account
     */
    @Insert("insert into account(UID， MONEY) value(#{UID}, #{MONEY})")
    public void saveAccount(Account account);
}
