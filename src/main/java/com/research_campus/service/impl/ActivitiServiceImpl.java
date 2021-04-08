package com.research_campus.service.impl;

import com.research_campus.dao.IBpmnListDao;
import com.research_campus.domain.BpmnList;
import com.research_campus.service.IActivitiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

/**
 * @author buwan
 */
@Service
public class ActivitiServiceImpl implements IActivitiService {

    IBpmnListDao bpmnListDao;

    @Autowired
    public ActivitiServiceImpl(IBpmnListDao bpmnListDao) {
        this.bpmnListDao = bpmnListDao;
    }

    @Override
    public void bpmnListAddData(BpmnList bpmnList) {
        // 0 表示未部署 1 表示已部署

        bpmnListDao.bpmnListAddData(bpmnList);
    }

    @Override
    public List<BpmnList> getBpmnList() {
        return  bpmnListDao.getBpmnList();
    }

    @Override
    public BpmnList getBpmnListByUuid(String uuid) {
        return bpmnListDao.getBpmnListByUuid(uuid);
    }

    @Override
    public void deleteBpmnByUuid(String bpmnUuid) {
        bpmnListDao.deleteBpmn(bpmnUuid);
    }

    @Override
    public void changeBpmnByUuid(BpmnList bpmnList) {
        bpmnListDao.changeBpmnInfByUuid(bpmnList);
    }

}
