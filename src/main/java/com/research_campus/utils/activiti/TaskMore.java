package com.research_campus.utils.activiti;

import com.research_campus.domain.ProBus;
import com.research_campus.domain.ProjectEntity;
import org.activiti.engine.task.Task;

/**
 * Task 扩展
 * @author buwan
 */
public class TaskMore {
    private Task task;
    private ProBus proBus;
    private ProjectEntity projectEntity;

    public Task getTask() {
        return task;
    }

    public void setTask(Task task) {
        this.task = task;
    }

    public ProBus getProBus() {
        return proBus;
    }

    public void setProBus(ProBus proBus) {
        this.proBus = proBus;
    }

    public ProjectEntity getProjectEntity() {
        return projectEntity;
    }

    public void setProjectEntity(ProjectEntity projectEntity) {
        this.projectEntity = projectEntity;
    }
}
