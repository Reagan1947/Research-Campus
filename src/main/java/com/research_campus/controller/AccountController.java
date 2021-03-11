package com.research_campus.controller;

import com.research_campus.service.AccountService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author buwan
 */

@Controller
@RequestMapping("/account")
public class AccountController {

    private final AccountService accountService;

    public AccountController(AccountService accountService) {
        this.accountService = accountService;
    }

    @RequestMapping("/findAll")
    public String findAll(){
        System.out.println("表现层查询账户");
        // 调用业务层方法
        accountService.findAll();
        return "list";
    }
}
