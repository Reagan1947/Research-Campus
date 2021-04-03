package com.research_campus.utils.activiti;

import java.util.UUID;

/**
 * uuid 生成相关
 * @author buwan
 */
public class IDGenerator {
    /**
     * 随机生成UUID
     * @return uuid
     */
    public static synchronized String getUuid(){
        UUID uuid=UUID.randomUUID();
        String str = uuid.toString();
        return str.replace("-", "");
    }
    /**
     * 根据字符串生成固定UUID
     * @param name 根据字符串
     * @return uuid
     */
    public static synchronized String getUuid(String name){
        UUID uuid=UUID.nameUUIDFromBytes(name.getBytes());
        String str = uuid.toString();
        return str.replace("-", "");
    }
}
