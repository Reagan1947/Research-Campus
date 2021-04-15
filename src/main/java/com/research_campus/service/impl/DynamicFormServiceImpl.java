package com.research_campus.service.impl;

import com.research_campus.dao.IDynamicFormDao;
import com.research_campus.domain.DynamicForm;
import com.research_campus.service.IDynamicFormService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 处理表单相关业务
 * @author buwan
 */
@Service
public class DynamicFormServiceImpl implements IDynamicFormService {


    IDynamicFormDao iDynamicFormDao;

    @Autowired
    public DynamicFormServiceImpl(IDynamicFormDao iDynamicFormDao) {
        this.iDynamicFormDao = iDynamicFormDao;
    }


    @Override
    public List<DynamicForm> findAllDynamicFormInf() {
        return iDynamicFormDao.findAllDynamicFormInf();
    }

    @Override
    public void addDynamicFormInf(DynamicForm dynamicForm) {
        iDynamicFormDao.addDynamicFormInf(dynamicForm);
    }

    @Override
    public DynamicForm getDynamicFormJsonByUuid(String dynamicFormUuid) {
        return iDynamicFormDao.getDynamicFormJsonByUuid(dynamicFormUuid);
    }

    @Override
    public void deleteDynamicFormInfByUuid(String dynamicFormUuid) {
        iDynamicFormDao.deleteDynamicFormInfByUuid(dynamicFormUuid);
    }
}
