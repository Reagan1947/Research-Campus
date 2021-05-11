package com.research_campus.service.impl;

import com.research_campus.dao.IPublishDao;
import com.research_campus.domain.Publish;
import com.research_campus.domain.PublishComment;
import com.research_campus.domain.PublishReply;
import com.research_campus.service.IPublishService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author buwan
 */
@Service
public class PublishServiceImpl implements IPublishService {

    IPublishDao publishDao;

    @Autowired
    public void setPublishDao(IPublishDao publishDao) {
        this.publishDao = publishDao;
    }

    @Override
    public void addPublishData(Publish publish) {
        publishDao.addPublishData(publish);
    }

    @Override
    public List<Publish> findAllPublishData(String userUuid) {
        List<Publish> publishList =  publishDao.selectAllPublishData(userUuid);
        for(Publish publish : publishList) {
            Integer isLike = publishDao.selectPublishIsLike(publish.getId(), userUuid);
            publish.setIsLike(isLike);
        }

        return  publishList;
    }

    @Override
    public void addPublishLike(Integer publishId, String publishUserUuid) {
        publishDao.addPublishLike(publishId, publishUserUuid);
    }

    @Override
    public void deletePublishLike(Integer publishId, String publishUserUuid) {
        publishDao.deletePublishLike(publishId, publishUserUuid);
    }

    @Override
    public List<PublishComment> findPublishCommentById(Integer publishId) {
        return publishDao.selectPublishCommentById(publishId);
    }

    @Override
    public void addPublishReply(PublishReply publishReply) {
        publishDao.addPublishReply(publishReply);
    }

    @Override
    public void addPublishComment(PublishComment publishComment) {
        publishDao.addPublishComment(publishComment);
    }
}
