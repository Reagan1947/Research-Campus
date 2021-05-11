package com.research_campus.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.research_campus.domain.Publish;
import com.research_campus.domain.PublishComment;
import com.research_campus.domain.PublishReply;
import com.research_campus.service.IPublishService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * @author buwan
 */
@Controller
public class PublishController {

    IPublishService publishService;

    @Autowired
    public void setPublishService(IPublishService publishService) {
        this.publishService = publishService;
    }

    @RequestMapping(value = "/publishData", method = RequestMethod.POST)
    @ResponseBody
    public void deleteBpmn(@RequestBody HashMap<String, String> map, HttpServletResponse response, HttpServletRequest request) throws Exception {
        // 删除数据库中的UUID
        String publishContent = map.get("publishContent");
        Integer publishAccess = Integer.parseInt(map.get("publishAccess"));
        JSONObject json = new JSONObject();
        HttpSession session = request.getSession();
        String publishUserUuid = (String) session.getAttribute("uuid");
        Publish publish = new Publish();
        publish.setPublishAccess(publishAccess);
        publish.setPublishContent(publishContent);
        publish.setPublishUserUuid(publishUserUuid);

        int code = 200;
        String msg = "科研动态添加成功";

        try {
            publishService.addPublishData(publish);

        } catch (Exception e) {
            code = 400;
            msg = "科研动态添加失败";
            e.printStackTrace();
        }
        json.put("code", code);
        json.put("Msg", msg);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print(json.toJSONString());
    }

    @RequestMapping(value = "/getPublishData", method = RequestMethod.POST)
    @ResponseBody
    public void getPublishData(HttpServletResponse response, HttpServletRequest request) throws Exception {
        // 删除数据库中的UUID
        JSONObject json = new JSONObject();
        HttpSession session = request.getSession();
        String userUuid = (String) session.getAttribute("uuid");
        List<Publish> publishList = new ArrayList<>();

        int code = 200;

        try {
           publishList =  publishService.findAllPublishData(userUuid);

        } catch (Exception e) {
            code = 400;
            e.printStackTrace();
        }
        json.put("code", code);
        json.put("publishData", publishList);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print(JSON.toJSONString(json, SerializerFeature.DisableCircularReferenceDetect));
    }

    @RequestMapping(value = "/changeLikeCount", method = RequestMethod.POST)
    @ResponseBody
    public void changeLikeCount(@RequestBody HashMap<String, String> map, HttpServletResponse response, HttpServletRequest request) throws Exception {
        String tag = map.get("tag");
        Integer publishId = Integer.parseInt(map.get("publishId"));
        JSONObject json = new JSONObject();
        HttpSession session = request.getSession();
        String publishUserUuid = (String) session.getAttribute("uuid");
        String[]  switchTag = {"increase", "decrease"};

        int code = 200;
        String msg = "点赞信息更改成功";

        try {
            if(tag.equals(switchTag[0])) {
                // 如果tag是增加，则增加一条记录
                publishService.addPublishLike(publishId, publishUserUuid);
            } else if(tag.equals(switchTag[1])) {
                // 如果tag是减少，则删除已有记录
                publishService.deletePublishLike(publishId, publishUserUuid);
            }

        } catch (Exception e) {
            code = 400;
            msg = "科研动态添加失败";
            e.printStackTrace();
        }
        json.put("code", code);
        json.put("Msg", msg);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print(json.toJSONString());
    }

    @RequestMapping(value = "/getPublishComment", method = RequestMethod.POST)
    @ResponseBody
    public void getPublishComment(@RequestBody HashMap<String, String> map, HttpServletResponse response, HttpServletRequest request) throws Exception {
        Integer publishId = Integer.parseInt(map.get("publishId"));
        JSONObject json = new JSONObject();
        List<PublishComment> commentList = new ArrayList<>();

        int code = 200;

        try {
            commentList = publishService.findPublishCommentById(publishId);

        } catch (Exception e) {
            code = 400;
            e.printStackTrace();
        }
        json.put("code", code);
        json.put("commentList", commentList);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print(JSON.toJSONString(json, SerializerFeature.DisableCircularReferenceDetect));
    }

    @RequestMapping(value = "/createComment", method = RequestMethod.POST)
    @ResponseBody
    public void createComment(@RequestBody HashMap<String, String> map, HttpServletResponse response, HttpServletRequest request) throws Exception {
        String type = map.get("type");
        String[] typeList = {"comment", "reply"};
        HttpSession session = request.getSession();
        String fromUserUuid = (String) session.getAttribute("uuid");
        PublishReply publishReply = new PublishReply();
        PublishComment publishComment = new PublishComment();
        if(typeList[1].equals(type)) {
            publishReply.setContent(map.get("content"));
            publishReply.setToUuid(map.get("toUuid"));
            publishReply.setReplyType(map.get("replyType"));
            publishReply.setReplyId(Integer.parseInt(map.get("aimId")));
            publishReply.setFromUuid(fromUserUuid);
        } else if(typeList[0].equals(type)){
            publishComment.setCommentContent(map.get("content"));
            publishComment.setPublishId(Integer.parseInt(map.get("aimId")));
            publishComment.setFromUserUuid(fromUserUuid);
        }

        JSONObject json = new JSONObject();
        int code = 200;
        String msg = "评论发表成功";

        try {
            if(typeList[1].equals(type)) {
                // reply
                publishService.addPublishReply(publishReply);

            }else if(typeList[0].equals(type)) {
                // comment
                publishService.addPublishComment(publishComment);
            }

        } catch (Exception e) {
            code = 400;
            msg = "评论发表失败";
            e.printStackTrace();
        }
        json.put("code", code);
        json.put("Msg", msg);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print(json.toJSONString());
    }
}
