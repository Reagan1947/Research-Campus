package com.research_campus.domain;

/**
 * Project Business ProcessInstance
 * PBP pojo类型
 * @author buwan
 */
public class ProBusDetail {
    private Integer id;
    private String projectEntityUuid;
    private String businessEntityUuid;
    private ProjectEntity projectEntity;
    private BusinessEntity businessEntity;
    private String processDefineId;
    private String processDefineName;
    private String proBusUuid;


    public ProjectEntity getProjectEntity() {
        return projectEntity;
    }

    public void setProjectEntity(ProjectEntity projectEntity) {
        this.projectEntity = projectEntity;
    }

    public BusinessEntity getBusinessEntity() {
        return businessEntity;
    }

    public void setBusinessEntity(BusinessEntity businessEntity) {
        this.businessEntity = businessEntity;
    }

    public String getProcessDefineId() {
        return processDefineId;
    }

    public void setProcessDefineId(String processDefineId) {
        this.processDefineId = processDefineId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

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

    public String getProcessDefineName() {
        return processDefineName;
    }

    public void setProcessDefineName(String processDefineName) {
        this.processDefineName = processDefineName;
    }

    public String getProBusUuid() {
        return proBusUuid;
    }

    public void setProBusUuid(String proBusUuid) {
        this.proBusUuid = proBusUuid;
    }

    @Override
    public String toString() {
        return "ProBusDetail{" +
                "id=" + id +
                ", projectEntityUuid='" + projectEntityUuid + '\'' +
                ", businessEntityUuid='" + businessEntityUuid + '\'' +
                ", projectEntity=" + projectEntity +
                ", businessEntity=" + businessEntity +
                ", processDefineId='" + processDefineId + '\'' +
                ", processDefineName='" + processDefineName + '\'' +
                ", proBusUuid='" + proBusUuid + '\'' +
                '}';
    }
}
