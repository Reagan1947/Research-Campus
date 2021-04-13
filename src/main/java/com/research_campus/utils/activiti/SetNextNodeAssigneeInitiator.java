package com.research_campus.utils.activiti;

import org.activiti.engine.delegate.DelegateExecution;
import org.activiti.engine.delegate.DelegateTask;
import org.activiti.engine.delegate.ExecutionListener;
import org.activiti.engine.delegate.TaskListener;
import org.springframework.stereotype.Component;

/**
 * Activiti 监听器类， 用于设置下一个节点审批人为项目发起人
 * @author buwan
 */

@Component("setNextNodeAssigneeInitiator")
public class SetNextNodeAssigneeInitiator implements TaskListener, ExecutionListener {

    private static final long serialVersionUID = 7085860084122165729L;

    @Override
    public void notify(DelegateExecution execution) throws Exception {

    }

    @Override
    public void notify(DelegateTask delegateTask) {

    }
}
