package com.research_campus.controller;

import com.research_campus.domain.Subject;
import com.research_campus.domain.UserInfo;
import com.research_campus.service.IUserInfService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author buwan
 */
@Controller
public class SideBarController {

    IUserInfService userInfService;

    @Autowired
    public void setUserInfService(IUserInfService userInfService) {
        this.userInfService = userInfService;
    }

    @RequestMapping("/profile.detail")
    public ModelAndView directToProfileDetail(Authentication authentication, Model model, HttpServletRequest request) throws Exception{

        UserInfo userInfo = userInfService.findUserInfByUsernameBase(authentication.getName());

        // 查询部门信息
        List<Subject> subjectList = userInfService.findUserSubjectByUserId(userInfo.getId());
        userInfo.setSubject(subjectList);
        ModelAndView modelandview = new ModelAndView();
        modelandview.addObject("userInfo", userInfo);
        modelandview.setViewName("page_profile");

        return modelandview;
    }

    @RequestMapping("/buildBPMN")
    public String directToBuildBPMN(HttpServletRequest request) throws Exception{

        // 定位到buildBPMN界面

        return "page_buildBPMN";
    }

    @RequestMapping("/deploymentBPMN")
    public String directToDeployment(HttpServletRequest request) throws Exception{

        // 定位到deploymentBPMN界面

        return "page_deploymentBPM";
    }

    @RequestMapping("/formManager")
    public String directToFormManager(HttpServletRequest request) throws Exception{

        // 定位到FormManager界面

        return "page_formManager";
    }

    @RequestMapping("/bpmnList")
    public String directToBpmnList(HttpServletRequest request) throws Exception{

        // 定位到BpmnList界面

        return "page_bpmnList";
    }

    @RequestMapping("/overviewPage")
    public String directToOverviewPage(HttpServletRequest request) throws Exception{

        // 重定向
        return "page_main";
    }

}
