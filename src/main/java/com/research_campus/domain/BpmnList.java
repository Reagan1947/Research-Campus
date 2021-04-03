package com.research_campus.domain;

import java.util.Date;

/**
 * bpmn list pojo
 * @author buwan
 */
public class BpmnList {
    private Integer id;
    private String bpmnName;
    private String bpmnDesc;
    private Date uploadDate;
    private Integer uploadUserId;
    private Integer bpmnStatus;
    private String bpmnUUID;
    private String bpmnFileName;
    private String svgFileName;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getBpmnName() {
        return bpmnName;
    }

    public void setBpmnName(String bpmnName) {
        this.bpmnName = bpmnName;
    }

    public String getBpmnDesc() {
        return bpmnDesc;
    }

    public void setBpmnDesc(String bpmnDesc) {
        this.bpmnDesc = bpmnDesc;
    }

    public Date getUploadDate() {
        return uploadDate;
    }

    public void setUploadDate(Date uploadDate) {
        this.uploadDate = uploadDate;
    }

    public Integer getUploadUserId() {
        return uploadUserId;
    }

    public void setUploadUserId(Integer uploadUserId) {
        this.uploadUserId = uploadUserId;
    }

    public Integer getBpmnStatus() {
        return bpmnStatus;
    }

    public void setBpmnStatus(Integer bpmnStatus) {
        this.bpmnStatus = bpmnStatus;
    }

    public String getBpmnUUID() {
        return bpmnUUID;
    }

    public void setBpmnUUID(String bpmnUUID) {
        this.bpmnUUID = bpmnUUID;
    }

    public String getBpmnFileName() {
        return bpmnFileName;
    }

    public void setBpmnFileName(String bpmnFileName) {
        this.bpmnFileName = bpmnFileName;
    }

    public String getSvgFileName() {
        return svgFileName;
    }

    public void setSvgFileName(String svgFileName) {
        this.svgFileName = svgFileName;
    }

    @Override
    public String toString() {
        return "BpmnList{" +
                "id=" + id +
                ", bpmnName='" + bpmnName + '\'' +
                ", bpmnDesc='" + bpmnDesc + '\'' +
                ", uploadDate=" + uploadDate +
                ", uploadUserId=" + uploadUserId +
                ", bpmnStatus=" + bpmnStatus +
                ", bpmnUUID='" + bpmnUUID + '\'' +
                ", bpmnFileName='" + bpmnFileName + '\'' +
                ", svgFileName='" + svgFileName + '\'' +
                '}';
    }
}
