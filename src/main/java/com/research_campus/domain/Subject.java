package com.research_campus.domain;

import org.activiti.engine.identity.Group;

import java.util.List;

/**
 * 用户所属部门二级 pojo
 * @author buwan
 */
public class Subject {

    private Integer id;
    private String subjectName;
    private String subjectDesc;
    private List<UserInfo> users;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    public String getSubjectDesc() {
        return subjectDesc;
    }

    public void setSubjectDesc(String subjectDesc) {
        this.subjectDesc = subjectDesc;
    }

    public List<UserInfo> getUsers() {
        return users;
    }

    public void setUsers(List<UserInfo> users) {
        this.users = users;
    }


}
