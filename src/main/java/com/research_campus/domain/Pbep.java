package com.research_campus.domain;

/**
 * projectEntity businessEntity processDefine Id
 * @author buwan
 */
public class Pbep {
    private String projectEntityUuid;
    private String businessEntityUuid;
    private String processDefineId;

    public String getProjectEntityUuid() {
        return projectEntityUuid;
    }

    public void setProjectEntityUuid(String projectEntityUuid) {
        this.projectEntityUuid = projectEntityUuid;
    }

    public String getBusinessEntityUuid() {
        return businessEntityUuid;
    }

    public void setBusinessEntityUuid(String businessEntityUuid) {
        this.businessEntityUuid = businessEntityUuid;
    }

    public String getProcessDefineId() {
        return processDefineId;
    }

    public void setProcessDefineId(String processDefineId) {
        this.processDefineId = processDefineId;
    }

    @Override
    public String toString() {
        return "Pbep{" +
                "projectEntityUuid='" + projectEntityUuid + '\'' +
                ", businessEntityUuid='" + businessEntityUuid + '\'' +
                ", processDefineId='" + processDefineId + '\'' +
                '}';
    }
}
