package com.research_campus.controller;

import com.alibaba.fastjson.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author buwan
 */
@Controller
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

    @RequestMapping("/login.success")
    @ResponseBody
    public void loginSuccess(HttpServletResponse response) throws IOException {
        JSONObject json = new JSONObject();
        json.put("code", 200);
        json.put("Msg", "登录成功");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print(json.toJSONString());
    }
}
