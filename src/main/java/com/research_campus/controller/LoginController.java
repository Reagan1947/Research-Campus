package com.research_campus.controller;

import com.alibaba.fastjson.JSONObject;
import org.springframework.security.core.userdetails.User;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * @author buwan
 */
@RestController
public class LoginController {

    @RequestMapping("/login.fail")
    @ResponseBody
    public void loginFail(HttpServletResponse response) throws IOException {
        JSONObject json = new JSONObject();
        json.put("code", 400);
        json.put("Msg", "密码错误");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print(json.toJSONString());
    }
}
