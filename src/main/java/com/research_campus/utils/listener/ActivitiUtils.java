package com.research_campus.utils.listener;
import com.research_campus.domain.ProBus;
import com.research_campus.domain.ProjectEntity;
import com.research_campus.service.IEntityService;
import com.research_campus.service.IUserGroupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * @author buwan
 */
@Component
public class ActivitiUtils {

    IUserGroupService userGroupService;

    @Autowired
    public void setUserGroupService(IUserGroupService userGroupService) {
        this.userGroupService = userGroupService;
    }

    IEntityService entityService;

    @Autowired
    public void setEntityService(IEntityService entityService) {
        this.entityService = entityService;
    }

    public String setAssign(String userUuid) {
        return userUuid;
    }

    public String setGroupOfSecretary(String userUuid) {

        // 根据用户uuid查询对应二级部门秘书组
        return userGroupService.findGroupOfSecretaryByUserUuid(userUuid);
    }

    public String setGroupOfProfessor(String proBusUuid) {
        String groupOfUserUuid;

        // 查找对应的ProjectEntityUuid
        ProBus proBus = entityService.selectProBusByProBusUuid(proBusUuid);
        ProjectEntity projectEntity = entityService.getProjectEntityByUuid(proBus.getProjectEntityUuid());
        String type = "professor";

        // 在 group_projectEntity 表中查询 Group 且 type = professor
        groupOfUserUuid = userGroupService.findGroupOfUserUuid(type, projectEntity.getProjectEntityUuid());

        // 如果没有则查找 projectEntityUuid = generate
        if (groupOfUserUuid == null) {
            groupOfUserUuid = userGroupService.findGroupOfUserUuid(type, "generate");
        }

        return groupOfUserUuid;
    }

    public String setGroupOfResearchDepartment(String proBusUuid) {
        String groupOfUserUuid;

        // 查找对应的ProjectEntityUuid
        ProBus proBus = entityService.selectProBusByProBusUuid(proBusUuid);
        ProjectEntity projectEntity = entityService.getProjectEntityByUuid(proBus.getProjectEntityUuid());
        String type = "researchDepartment";

        // 在 group_projectEntity 表中查询 Group 且 type = researchDepartment
        groupOfUserUuid = userGroupService.findGroupOfUserUuid(type, projectEntity.getProjectEntityUuid());

        // 如果没有则查找 projectEntityUuid = generate
        if (groupOfUserUuid == null) {
            groupOfUserUuid = userGroupService.findGroupOfUserUuid(type, "generate");
        }

        return groupOfUserUuid;
    }
}

