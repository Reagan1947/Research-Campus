package com.research_campus.domain;

import java.util.List;

/**
 * 用户信息-职称 pojo
 * @author buwan
 */
public class Competent {
    private Integer id;
    private String competentName;
    private String competentDesc;
    private List<UserInfo> users;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCompetentName() {
        return competentName;
    }

    public void setCompetentName(String competentName) {
        this.competentName = competentName;
    }

    public String getCompetentDesc() {
        return competentDesc;
    }

    public void setCompetentDesc(String competentDesc) {
        this.competentDesc = competentDesc;
    }

    public List<UserInfo> getUsers() {
        return users;
    }

    public void setUsers(List<UserInfo> users) {
        this.users = users;
    }
}
