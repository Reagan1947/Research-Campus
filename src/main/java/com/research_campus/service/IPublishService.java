package com.research_campus.service;

import com.research_campus.domain.Publish;
import com.research_campus.domain.PublishComment;
import com.research_campus.domain.PublishReply;

import java.util.List;

/**
 * @author buwan
 */
public interface IPublishService {

    /**
     * 增加 Publish
     * @param publish publish Pojo
     */
    void addPublishData(Publish publish);

    /**
     * 根据用户id 查询所有可见 科研动态信息
     * @param userUuid 用于判断是否为好友的 UserUuid
     * @return Publish List Pojo
     */
    List<Publish> findAllPublishData(String userUuid);

    /**
     * 增加一个like记录
     * @param publishId like 主体 id
     * @param publishUserUuid like userUuid
     */
    void addPublishLike(Integer publishId, String publishUserUuid);

    /**
     * 减少一个like记录
     * @param publishId like 主体 id
     * @param publishUserUuid like userUuid
     */
    void deletePublishLike(Integer publishId, String publishUserUuid);

    /**
     * 根据 publishId 获得其评论
     * @param publishId 科研动态 id
     * @return List Publish Comment Pojo
     */
    List<PublishComment> findPublishCommentById(Integer publishId);

    /**
     * 增加 publish Reply
     * @param publishReply publishReply Pojo
     */
    void addPublishReply(PublishReply publishReply);

    /**
     * 增加 publish Comment
     * @param publishComment publish Comment Pojo
     */
    void addPublishComment(PublishComment publishComment);
}
