package com.research_campus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author buwan
 */

@Controller
public class SideBarController {

    @RequestMapping("/profile.detail")
    public String directToProfileDetail() {
        return "../../pages/profile";
    }

}
