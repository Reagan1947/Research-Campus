package com.research_campus.domain;

import java.util.Date;
import java.util.List;

/**
 * @author buwan
 */
public class PublishComment {

    private Integer id;
    private String commentContent;
    private String fromUserUuid;
    private Date commentDate;
    private Integer publishId;
    private List<PublishReply> publishReplyList;
    private UserInfo userInfo;

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

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    public String getFromUserUuid() {
        return fromUserUuid;
    }

    public void setFromUserUuid(String fromUserUuid) {
        this.fromUserUuid = fromUserUuid;
    }

    public Date getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(Date commentDate) {
        this.commentDate = commentDate;
    }

    public Integer getPublishId() {
        return publishId;
    }

    public void setPublishId(Integer publishId) {
        this.publishId = publishId;
    }

    public List<PublishReply> getPublishReplyList() {
        return publishReplyList;
    }

    public void setPublishReplyList(List<PublishReply> publishReplyList) {
        this.publishReplyList = publishReplyList;
    }

    @Override
    public String toString() {
        return "PublishComment{" +
                "id=" + id +
                ", commentContent='" + commentContent + '\'' +
                ", fromUserUuid='" + fromUserUuid + '\'' +
                ", commentDate=" + commentDate +
                ", publishId=" + publishId +
                ", publishReplyList=" + publishReplyList +
                ", userInfo=" + userInfo +
                '}';
    }
}
