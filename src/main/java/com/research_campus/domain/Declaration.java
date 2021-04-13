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
    private String processInstanceId;
    private String declarationUuid;

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

    public String getProcessInstanceId() {
        return processInstanceId;
    }

    public void setProcessInstanceId(String processInstanceId) {
        this.processInstanceId = processInstanceId;
    }

    public String getDeclarationUuid() {
        return declarationUuid;
    }

    public void setDeclarationUuid(String declarationUuid) {
        this.declarationUuid = declarationUuid;
    }

    @Override
    public String toString() {
        return "Declaration{" +
                "id=" + id +
                ", declarationName='" + declarationName + '\'' +
                ", projectBodyInformationUrl='" + projectBodyInformationUrl + '\'' +
                ", declarationAnnouncement='" + declarationAnnouncement + '\'' +
                ", declarationOverview='" + declarationOverview + '\'' +
                ", processInstanceId='" + processInstanceId + '\'' +
                ", declarationUuid='" + declarationUuid + '\'' +
                '}';
    }
}
