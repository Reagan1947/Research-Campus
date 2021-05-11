package com.research_campus.domain;

import java.util.Date;

/**
 * @author buwan
 */
public class Publish {

    private Integer id;
    private Integer publishAccess;
    private String publishContent;
    private Date publishDate;
    private String publishUserUuid;
    private UserInfo userInfo;
    private String publishAccessDesc;
    private Integer likeCount;
    private Integer isLike;

    public Integer getIsLike() {
        return isLike;
    }

    public void setIsLike(Integer isLike) {
        this.isLike = isLike;
    }

    public Integer getLikeCount() {
        return likeCount;
    }

    public void setLikeCount(Integer likeCount) {
        this.likeCount = likeCount;
    }

    public String getPublishAccessDesc() {
        return publishAccessDesc;
    }

    public void setPublishAccessDesc(String publishAccessDesc) {
        this.publishAccessDesc = publishAccessDesc;
    }

    public UserInfo getUserInfo() {
        return userInfo;
    }

    public void setUserInfo(UserInfo userInfo) {
        this.userInfo = userInfo;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPublishAccess() {
        return publishAccess;
    }

    public void setPublishAccess(Integer publishAccess) {
        this.publishAccess = publishAccess;
    }

    public String getPublishContent() {
        return publishContent;
    }

    public void setPublishContent(String publishContent) {
        this.publishContent = publishContent;
    }

    public Date getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(Date publishDate) {
        this.publishDate = publishDate;
    }

    public String getPublishUserUuid() {
        return publishUserUuid;
    }

    public void setPublishUserUuid(String publishUserUuid) {
        this.publishUserUuid = publishUserUuid;
    }

    @Override
    public String toString() {
        return "Publish{" +
                "id=" + id +
                ", publishAccess=" + publishAccess +
                ", publishContent='" + publishContent + '\'' +
                ", publishDate=" + publishDate +
                ", publishUserUuid='" + publishUserUuid + '\'' +
                ", userInfo=" + userInfo +
                ", publishAccessDesc='" + publishAccessDesc + '\'' +
                ", likeCount=" + likeCount +
                ", isLike=" + isLike +
                '}';
    }
}
