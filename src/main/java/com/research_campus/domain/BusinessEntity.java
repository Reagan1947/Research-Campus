package com.research_campus.domain;

/**
 * 业务主体pojo
 * @author buwan
 */
public class BusinessEntity {
    private String businessEntityName;
    private String businessEntityUuid;
    private String businessEntityDesc;

    public String getBusinessEntityName() {
        return businessEntityName;
    }

    public void setBusinessEntityName(String businessEntityName) {
        this.businessEntityName = businessEntityName;
    }

    public String getBusinessEntityUuid() {
        return businessEntityUuid;
    }

    public void setBusinessEntityUuid(String businessEntityUuid) {
        this.businessEntityUuid = businessEntityUuid;
    }

    public String getBusinessEntityDesc() {
        return businessEntityDesc;
    }

    public void setBusinessEntityDesc(String businessEntityDesc) {
        this.businessEntityDesc = businessEntityDesc;
    }

    @Override
    public String toString() {
        return "BusinessEntity{" +
                "businessEntityName='" + businessEntityName + '\'' +
                ", businessEntityUuid='" + businessEntityUuid + '\'' +
                ", businessEntityDesc='" + businessEntityDesc + '\'' +
                '}';
    }
}
