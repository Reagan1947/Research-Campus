package com.research_campus.domain;

/**
 * projectEntity businessEntity processDefine Id
 * @author buwan
 */
public class ProBus {
    private String projectEntityUuid;
    private String businessEntityUuid;
    private String processDefineId;
    private String proBusUuid;

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

    public String getProBusUuid() {
        return proBusUuid;
    }

    public void setProBusUuid(String proBusUuid) {
        this.proBusUuid = proBusUuid;
    }

    @Override
    public String toString() {
        return "ProBus{" +
                "projectEntityUuid='" + projectEntityUuid + '\'' +
                ", businessEntityUuid='" + businessEntityUuid + '\'' +
                ", processDefineId='" + processDefineId + '\'' +
                ", proBusUuid='" + proBusUuid + '\'' +
                '}';
    }
}
