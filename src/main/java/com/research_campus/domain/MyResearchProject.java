package com.research_campus.domain;

import org.activiti.engine.task.Task;

import java.util.Date;
import java.util.Map;

/**
 * @author buwan
 */
public class MyResearchProject {
    private Integer id;
    private ProjectEntity projectEntity;
    private String projectEntityUuid;
    private BusinessEntity businessEntity;
    private String businessEntityUuid;
    private String processInstanceId;
    private String processDefineId;
    private String userUuid;
    private Map<String, Object> nowTask;
    private String instanceStatus;
    private Date createDate;

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public ProjectEntity getProjectEntity() {
        return projectEntity;
    }

    public void setProjectEntity(ProjectEntity projectEntity) {
        this.projectEntity = projectEntity;
    }

    public String getProjectEntityUuid() {
        return projectEntityUuid;
    }

    public void setProjectEntityUuid(String projectEntityUuid) {
        this.projectEntityUuid = projectEntityUuid;
    }

    public BusinessEntity getBusinessEntity() {
        return businessEntity;
    }

    public void setBusinessEntity(BusinessEntity businessEntity) {
        this.businessEntity = businessEntity;
    }

    public String getBusinessEntityUuid() {
        return businessEntityUuid;
    }

    public void setBusinessEntityUuid(String businessEntityUuid) {
        this.businessEntityUuid = businessEntityUuid;
    }

    public String getProcessInstanceId() {
        return processInstanceId;
    }

    public void setProcessInstanceId(String processInstanceId) {
        this.processInstanceId = processInstanceId;
    }

    public String getProcessDefineId() {
        return processDefineId;
    }

    public void setProcessDefineId(String processDefineId) {
        this.processDefineId = processDefineId;
    }

    public String getUserUuid() {
        return userUuid;
    }

    public void setUserUuid(String userUuid) {
        this.userUuid = userUuid;
    }

    public Map<String, Object> getNowTask() {
        return nowTask;
    }

    public void setNowTask(Map<String, Object> nowTask) {
        this.nowTask = nowTask;
    }

    public String getInstanceStatus() {
        return instanceStatus;
    }

    public void setInstanceStatus(String instanceStatus) {
        this.instanceStatus = instanceStatus;
    }

    @Override
    public String toString() {
        return "MyResearchProject{" +
                "id=" + id +
                ", projectEntity=" + projectEntity +
                ", projectEntityUuid='" + projectEntityUuid + '\'' +
                ", businessEntity=" + businessEntity +
                ", businessEntityUuid='" + businessEntityUuid + '\'' +
                ", processInstanceId='" + processInstanceId + '\'' +
                ", processDefineId='" + processDefineId + '\'' +
                ", userUuid='" + userUuid + '\'' +
                ", nowTask=" + nowTask +
                ", instanceStatus='" + instanceStatus + '\'' +
                ", createDate=" + createDate +
                '}';
    }
}
