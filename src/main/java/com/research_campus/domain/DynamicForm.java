package com.research_campus.domain;

import java.util.Date;

/**
 * 创建的Dynamic表单信息Pojo
 * @author buwan
 */
public class DynamicForm {
    private Integer id;
    private String formName;
    private String formJson;
    private Integer createBy;
    private Date createTime;
    private Integer updateBy;
    private Date updateTime;
    private String uuid;
    private String formUrl;
    private String formDesc;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFormName() {
        return formName;
    }

    public void setFormName(String formName) {
        this.formName = formName;
    }

    public String getFormJson() {
        return formJson;
    }

    public void setFormJson(String formJson) {
        this.formJson = formJson;
    }

    public Integer getCreateBy() {
        return createBy;
    }

    public void setCreateBy(Integer createBy) {
        this.createBy = createBy;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(Integer updateBy) {
        this.updateBy = updateBy;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }


    public String getFormUrl() {
        return formUrl;
    }

    public void setFormUrl(String formUrl) {
        this.formUrl = formUrl;
    }

    public String getFormDesc() {
        return formDesc;
    }

    public void setFormDesc(String formDesc) {
        this.formDesc = formDesc;
    }

    @Override
    public String toString() {
        return "DynamicForm{" +
                "id=" + id +
                ", formName='" + formName + '\'' +
                ", formJson='" + formJson + '\'' +
                ", createBy=" + createBy +
                ", createTime=" + createTime +
                ", updateBy=" + updateBy +
                ", updateTime=" + updateTime +
                ", uuid='" + uuid + '\'' +
                ", formUrl='" + formUrl + '\'' +
                ", formDesc='" + formDesc + '\'' +
                '}';
    }
}
