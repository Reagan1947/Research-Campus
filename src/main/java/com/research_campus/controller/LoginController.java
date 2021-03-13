package com.research_campus.controller;

import com.alibaba.fastjson.JSONObject;
import com.research_campus.domain.UserInfo;
import com.research_campus.service.IUserInfService;
import com.research_campus.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.security.Principal;

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


    @Autowired
    IUserInfService userInfService;

    @RequestMapping("/page.main")
    public String toMainPage(Authentication authentication, HttpServletRequest request) throws Exception {
        UserInfo userInfo = userInfService.findUserInfByUsername(authentication.getName());
        HttpSession session = request.getSession();
        session.setAttribute("username", userInfo.getUserName());
        session.setAttribute("uuid", userInfo.getUuid());

        return "../../pages/test";
    }
}
