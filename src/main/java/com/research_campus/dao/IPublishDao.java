package com.research_campus.dao;

import com.research_campus.domain.Publish;
import com.research_campus.domain.PublishComment;
import com.research_campus.domain.PublishReply;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @author buwan
 */
public interface IPublishDao {

    /**
     * 增加 Publish
     * @param publish publish Pojo
     */
    @Insert("INSERT INTO publish (publishAccess, publishContent, publishDate, publishUserUuid) VALUES (#{publishAccess}, #{publishContent}, now(), #{publishUserUuid})")
    void addPublishData(Publish publish);


    /**
     * 根据权限id 查询 权限描述
     * @param publishAccessId 权限id
     * @return 权限描述 String
     */
    @Select("SELECT publishAccessDesc FROM publish_access WHERE id=#{publishAccessId}")
    String findPublishDescById(@Param("publishAccessId") String publishAccessId);


    /**
     * 根据用户id 查询所有可见 科研动态信息
     * @param userUuid 用于判断是否为好友的 UserUuid
     * @return Publish List Pojo
     */
    @Select("SELECT * FROM publish WHERE publishAccess IN (1, 2)")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(column = "publishAccess", property = "publishAccess"),
            @Result(column = "publishContent", property = "publishContent"),
            @Result(column = "publishDate", property = "publishDate"),
            @Result(column = "publishUserUuid", property = "publishUserUuid"),
            @Result(property = "userInfo", column = "publishUserUuid", javaType = com.research_campus.domain.UserInfo.class, one = @One(select = "com.research_campus.dao.IUserGroupDao.selectUserByUuid")),
            @Result(property = "publishAccessDesc", column = "publishAccess", javaType =  java.lang.String.class, one = @One(select = "com.research_campus.dao.IPublishDao.findPublishDescById")),
            @Result(property = "likeCount", column = "id", javaType =  java.lang.Integer.class, one = @One(select = "com.research_campus.dao.IPublishDao.selectCountOfLike")),
//            @Result(property = "isLike", column = "{publishId = id, fromUserUuid = #{userUuid}}", javaType =  java.lang.Integer.class, one = @One(select = "com.research_campus.dao.IPublishDao.selectPublishIsLike")),

    })
    List<Publish> selectAllPublishData(@Param("userUuid") String userUuid);

    /**
     * 增加一个like记录
     * @param publishId like 主体 id
     * @param publishUserUuid like userUuid
     */
    @Insert("INSERT INTO publish_like (from_user_uuid, publish_id, like_date) VALUES (#{publishUserUuid}, #{publishId}, now())")
    void addPublishLike(@Param("publishId") Integer publishId, @Param("publishUserUuid") String publishUserUuid);

    /**
     * 减少一个like记录
     * @param publishId like 主体 id
     * @param publishUserUuid like userUuid
     */
    @Delete("DELETE FROM publish_like WHERE publish_id = #{publishId} AND from_user_uuid = #{publishUserUuid}")
    void deletePublishLike(@Param("publishId") Integer publishId, @Param("publishUserUuid") String publishUserUuid);

    /**
     * 查询该动态的点赞总人数
     * @param publishId 科研动态条目 id
     * @return 总点赞人数
     */
    @Select("SELECT COUNT(*) FROM publish_like WHERE publish_id = #{publishId}")
    Integer selectCountOfLike(@Param("publishId") Integer publishId);

    /**
     * 查询是否喜欢
     * @param publishId like 主体 id
     * @param fromUserUuid like userUuid
     * @return  1-喜欢 0-不喜欢
     */
    @Select("SELECT (SELECT COUNT(id) FROM publish_like WHERE publish_id = #{publishId} AND from_user_uuid = #{fromUserUuid}) > 0")
    Integer selectPublishIsLike(@Param("publishId") Integer publishId, @Param("fromUserUuid") String fromUserUuid);

    /**
     * 根据 publishId 获得其评论
     * @param publishId 科研动态 id
     * @return List Publish Comment Pojo
     */
    @Select("SELECT * FROM comment WHERE publishId = #{publishId}")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(column = "commentContent", property = "commentContent"),
            @Result(column = "fromUserUuid", property = "fromUserUuid"),
            @Result(column = "commentDate", property = "commentDate"),
            @Result(column = "publishId", property = "publishId"),
            @Result(property = "userInfo", column = "fromUserUuid", javaType = com.research_campus.domain.UserInfo.class, one = @One(select = "com.research_campus.dao.IUserGroupDao.selectUserByUuid")),
            @Result(property = "publishReplyList", column = "id", javaType =  java.util.List.class, many = @Many(select = "com.research_campus.dao.IPublishDao.findPublishReplyList")),
    })
    List<PublishComment> selectPublishCommentById(@Param("publishId") Integer publishId);

    /**
     * 根据 publish Id 获得其下面的二级 Reply
     * @param commentId comment Id
     * @return List Publish Reply
     */
    @Select("SELECT * FROM reply WHERE replyId = #{commentId} AND replyType='forComment'")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(column = "replyId", property = "replyId"),
            @Result(column = "fromUuid", property = "fromUuid"),
            @Result(column = "toUuid", property = "toUuid"),
            @Result(column = "replyDate", property = "replyDate"),
            @Result(column = "replyType", property = "replyType"),
            @Result(property = "fromUserInfo", column = "fromUuid", javaType = com.research_campus.domain.UserInfo.class, one = @One(select = "com.research_campus.dao.IUserGroupDao.selectUserByUuid")),
            @Result(property = "toUserInfo", column = "toUuid", javaType = com.research_campus.domain.UserInfo.class, one = @One(select = "com.research_campus.dao.IUserGroupDao.selectUserByUuid")),
            @Result(property = "publishReplyList", column = "id", javaType =  java.util.List.class, many = @Many(select = "com.research_campus.dao.IPublishDao.findPublishReplyListSecond")),
    })
    List<PublishReply> findPublishReplyList(@Param("commentId") Integer commentId);

    /**
     * 根据 publish Id 获得其下面的三级 Reply
     * @param replyId reply Id
     * @return List Publish Reply
     */
    @Select("SELECT * FROM reply WHERE replyId = #{replyId} AND replyType='forReply'")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(column = "replyId", property = "replyId"),
            @Result(column = "fromUuid", property = "fromUuid"),
            @Result(column = "toUuid", property = "toUuid"),
            @Result(column = "replyDate", property = "replyDate"),
            @Result(column = "replyType", property = "replyType"),
            @Result(property = "fromUserInfo", column = "fromUuid", javaType = com.research_campus.domain.UserInfo.class, one = @One(select = "com.research_campus.dao.IUserGroupDao.selectUserByUuid")),
            @Result(property = "toUserInfo", column = "toUuid", javaType = com.research_campus.domain.UserInfo.class, one = @One(select = "com.research_campus.dao.IUserGroupDao.selectUserByUuid")),
            @Result(property = "publishReplyList", column = "id", javaType =  java.util.List.class, many = @Many(select = "com.research_campus.dao.IPublishDao.findPublishReplyListSecond")),
    })
    List<PublishReply> findPublishReplyListSecond(@Param("replyId") Integer replyId);

    /**
     * 增加 publish Reply
     * @param publishReply publishReply Pojo
     */
    @Insert("INSERT INTO reply (replyId, content, fromUuid, toUuid, replyDate, replyType) VALUES (#{replyId}, #{content}, #{fromUuid}, #{toUuid}, now(), #{replyType})")
    void addPublishReply(PublishReply publishReply);

    /**
     * 增加 publish Comment
     * @param publishComment publish Comment Pojo
     */
    @Insert("INSERT INTO comment (commentContent, fromUserUuid, commentDate, publishId) VALUES (#{commentContent}, #{fromUserUuid}, now(), #{publishId})")
    void addPublishComment(PublishComment publishComment);
}
