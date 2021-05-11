package com.research_campus.domain;

import java.util.Date;
import java.util.List;

/**
 * @author buwan
 */
public class PublishReply {

    private Integer id;
    private Integer replyId;
    private String content;
    private String fromUuid;
    private String toUuid;
    private Date replyDate;
    private String replyType;
    private List<PublishReply> publishReplyList;
    private UserInfo fromUserInfo;
    private UserInfo toUserInfo;

    public UserInfo getFromUserInfo() {
        return fromUserInfo;
    }

    public void setFromUserInfo(UserInfo fromUserInfo) {
        this.fromUserInfo = fromUserInfo;
    }

    public UserInfo getToUserInfo() {
        return toUserInfo;
    }

    public void setToUserInfo(UserInfo toUserInfo) {
        this.toUserInfo = toUserInfo;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getReplyId() {
        return replyId;
    }

    public void setReplyId(Integer replyId) {
        this.replyId = replyId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getFromUuid() {
        return fromUuid;
    }

    public void setFromUuid(String fromUuid) {
        this.fromUuid = fromUuid;
    }

    public String getToUuid() {
        return toUuid;
    }

    public void setToUuid(String toUuid) {
        this.toUuid = toUuid;
    }

    public Date getReplyDate() {
        return replyDate;
    }

    public void setReplyDate(Date replyDate) {
        this.replyDate = replyDate;
    }

    public String getReplyType() {
        return replyType;
    }

    public void setReplyType(String replyType) {
        this.replyType = replyType;
    }

    public List<PublishReply> getPublishReplyList() {
        return publishReplyList;
    }

    public void setPublishReplyList(List<PublishReply> publishReplyList) {
        this.publishReplyList = publishReplyList;
    }

    @Override
    public String toString() {
        return "PublishReply{" +
                "id=" + id +
                ", replyId=" + replyId +
                ", content='" + content + '\'' +
                ", fromUuid='" + fromUuid + '\'' +
                ", toUuid='" + toUuid + '\'' +
                ", replyDate=" + replyDate +
                ", replyType='" + replyType + '\'' +
                ", publishReplyList=" + publishReplyList +
                ", fromUserInfo=" + fromUserInfo +
                ", toUserInfo=" + toUserInfo +
                '}';
    }
}
