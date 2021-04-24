package com.research_campus.domain;

/**
 * 可申报项目公告等 pojo
 * @author buwan
 */
public class Declaration {
    private Integer id;
    private String declarationName;
    private String projectBodyInformationUrl;
    private String declarationAnnouncement;
    private String declarationOverview;
    private String processDefineId;
    private String declarationUuid;
    private String projectEntityUuid;
    private String businessEntityUuid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDeclarationName() {
        return declarationName;
    }

    public void setDeclarationName(String declarationName) {
        this.declarationName = declarationName;
    }

    public String getProjectBodyInformationUrl() {
        return projectBodyInformationUrl;
    }

    public void setProjectBodyInformationUrl(String projectBodyInformationUrl) {
        this.projectBodyInformationUrl = projectBodyInformationUrl;
    }

    public String getDeclarationAnnouncement() {
        return declarationAnnouncement;
    }

    public void setDeclarationAnnouncement(String declarationAnnouncement) {
        this.declarationAnnouncement = declarationAnnouncement;
    }

    public String getDeclarationOverview() {
        return declarationOverview;
    }

    public void setDeclarationOverview(String declarationOverview) {
        this.declarationOverview = declarationOverview;
    }

    public String getProcessDefineId() {
        return processDefineId;
    }

    public void setProcessDefineId(String processDefineId) {
        this.processDefineId = processDefineId;
    }

    public String getDeclarationUuid() {
        return declarationUuid;
    }

    public void setDeclarationUuid(String declarationUuid) {
        this.declarationUuid = declarationUuid;
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

    @Override
    public String toString() {
        return "Declaration{" +
                "id=" + id +
                ", declarationName='" + declarationName + '\'' +
                ", projectBodyInformationUrl='" + projectBodyInformationUrl + '\'' +
                ", declarationAnnouncement='" + declarationAnnouncement + '\'' +
                ", declarationOverview='" + declarationOverview + '\'' +
                ", processDefineId='" + processDefineId + '\'' +
                ", declarationUuid='" + declarationUuid + '\'' +
                ", projectEntityUuid='" + projectEntityUuid + '\'' +
                ", businessEntityUuid='" + businessEntityUuid + '\'' +
                '}';
    }
}
