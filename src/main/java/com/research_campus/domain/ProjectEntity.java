package com.research_campus.domain;

import java.util.Date;

/**
 * @author buwan
 */
public class ProjectEntity {
    private Integer id;
    private String projectEntityName;
    private String projectEntityUuid;
    private String projectEntityDesc;
    private Integer projectEntityCreateBy;
    private Date projectEntityCreateTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getProjectEntityName() {
        return projectEntityName;
    }

    public void setProjectEntityName(String projectEntityName) {
        this.projectEntityName = projectEntityName;
    }

    public String getProjectEntityUuid() {
        return projectEntityUuid;
    }

    public void setProjectEntityUuid(String projectEntityUuid) {
        this.projectEntityUuid = projectEntityUuid;
    }

    public String getProjectEntityDesc() {
        return projectEntityDesc;
    }

    public void setProjectEntityDesc(String projectEntityDesc) {
        this.projectEntityDesc = projectEntityDesc;
    }

    public Integer getProjectEntityCreateBy() {
        return projectEntityCreateBy;
    }

    public void setProjectEntityCreateBy(Integer projectEntityCreateBy) {
        this.projectEntityCreateBy = projectEntityCreateBy;
    }

    public Date getProjectEntityCreateTime() {
        return projectEntityCreateTime;
    }

    public void setProjectEntityCreateTime(Date projectEntityCreateTime) {
        this.projectEntityCreateTime = projectEntityCreateTime;
    }

    @Override
    public String toString() {
        return "ProjectEntity{" +
                "id=" + id +
                ", projectEntityName='" + projectEntityName + '\'' +
                ", projectEntityUuid='" + projectEntityUuid + '\'' +
                ", projectEntityDesc='" + projectEntityDesc + '\'' +
                ", projectEntityCreateBy=" + projectEntityCreateBy +
                ", projectEntityCreateTime=" + projectEntityCreateTime +
                '}';
    }
}
