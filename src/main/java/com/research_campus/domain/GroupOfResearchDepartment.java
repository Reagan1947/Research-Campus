package com.research_campus.domain;

import org.activiti.engine.identity.Group;

/**
 * @author buwan
 */
public class GroupOfResearchDepartment {

    private Integer id;
    private String type;
    private ProjectEntity projectEntity;
    private Group group;
    private String projectEntityUuid;
    private String groupOfUserUuid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public ProjectEntity getProjectEntity() {
        return projectEntity;
    }

    public void setProjectEntity(ProjectEntity projectEntity) {
        this.projectEntity = projectEntity;
    }

    public Group getGroup() {
        return group;
    }

    public void setGroup(Group group) {
        this.group = group;
    }

    public String getProjectEntityUuid() {
        return projectEntityUuid;
    }

    public void setProjectEntityUuid(String projectEntityUuid) {
        this.projectEntityUuid = projectEntityUuid;
    }

    public String getGroupOfUserUuid() {
        return groupOfUserUuid;
    }

    public void setGroupOfUserUuid(String groupOfUserUuid) {
        this.groupOfUserUuid = groupOfUserUuid;
    }

    @Override
    public String toString() {
        return "GroupOfResearchDepartment{" +
                "id=" + id +
                ", type='" + type + '\'' +
                ", projectEntity=" + projectEntity +
                ", group=" + group +
                ", projectEntityUuid='" + projectEntityUuid + '\'' +
                ", groupOfUserUuid='" + groupOfUserUuid + '\'' +
                '}';
    }
}
