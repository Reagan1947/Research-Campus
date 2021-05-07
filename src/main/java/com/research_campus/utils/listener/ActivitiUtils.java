package com.research_campus.utils.listener;
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


    public String setAssign(String userUuid) {
        return userUuid;
    }

    public String setGroupOfSecretary(String userUuid) {

        // 根据用户uuid查询对应二级部门秘书组
        return userGroupService.findGroupOfSecretaryByUserUuid(userUuid);
    }
}

