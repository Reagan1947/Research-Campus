package com.research_campus.controller;

import com.alibaba.fastjson.JSONObject;
import com.research_campus.domain.UserInfo;
import com.research_campus.service.IUserInfService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @author buwan
 */
@Controller
public class LoginController {

    @Value("#{configProperties['region']}")
    private String PRegion;
    @Value("#{configProperties['bucketName']}")
    private String PBucketName;


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

    IUserInfService userInfService;

    @Autowired
    public void setUserInfService(IUserInfService userInfService) {
        this.userInfService = userInfService;
    }

    @RequestMapping("/page.main")
    public String toMainPage(Authentication authentication, HttpServletRequest request) throws Exception {
        UserInfo userInfo = userInfService.findUserInfByUsername(authentication.getName());
        HttpSession session = request.getSession();
        session.setAttribute("username", userInfo.getUserName());
        session.setAttribute("userId", userInfo.getId());
        session.setAttribute("uuid", userInfo.getUuid());
        session.setAttribute("bucketName", PBucketName);
        session.setAttribute("region", PRegion);

        return "redirect:/overviewPage";
    }


}
