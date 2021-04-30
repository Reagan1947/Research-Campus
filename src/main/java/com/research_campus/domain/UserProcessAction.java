package com.research_campus.domain;

/**
 * User Process Action
 * @author buwan
 */
public class UserProcessAction {
    private String businessEntityUuid;
    private String userUuid;
    private String projectEntityUuid;
    private String processDefineId;
    private String processInstanceId;

    public String getBusinessEntityUuid() {
        return businessEntityUuid;
    }

    public void setBusinessEntityUuid(String businessEntityUuid) {
        this.businessEntityUuid = businessEntityUuid;
    }

    public String getUserUuid() {
        return userUuid;
    }

    public void setUserUuid(String userUuid) {
        this.userUuid = userUuid;
    }

    public String getProjectEntityUuid() {
        return projectEntityUuid;
    }

    public void setProjectEntityUuid(String projectEntityUuid) {
        this.projectEntityUuid = projectEntityUuid;
    }

    public String getProcessDefineId() {
        return processDefineId;
    }

    public void setProcessDefineId(String processDefineId) {
        this.processDefineId = processDefineId;
    }

    public String getProcessInstanceId() {
        return processInstanceId;
    }

    public void setProcessInstanceId(String processInstanceId) {
        this.processInstanceId = processInstanceId;
    }

    @Override
    public String toString() {
        return "UserProcessAction{" +
                "businessEntityUuid='" + businessEntityUuid + '\'' +
                ", userUuid='" + userUuid + '\'' +
                ", projectEntityUuid='" + projectEntityUuid + '\'' +
                ", processDefineId='" + processDefineId + '\'' +
                ", processInstanceId='" + processInstanceId + '\'' +
                '}';
    }
}
