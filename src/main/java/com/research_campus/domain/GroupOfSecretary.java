package com.research_campus.domain;

import org.activiti.engine.identity.Group;

/**
 * @author buwan
 */
public class GroupOfSecretary {

    private Integer id;
    private Integer subjectId;
    private String groupOfUserUuid;
    private Subject subject;
    private Group group;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(Integer subjectId) {
        this.subjectId = subjectId;
    }

    public String getGroupOfUserUuid() {
        return groupOfUserUuid;
    }

    public void setGroupOfUserUuid(String groupOfUserUuid) {
        this.groupOfUserUuid = groupOfUserUuid;
    }

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }

    public Group getGroup() {
        return group;
    }

    public void setGroup(Group group) {
        this.group = group;
    }
}
