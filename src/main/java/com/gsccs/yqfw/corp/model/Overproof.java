package com.gsccs.yqfw.corp.model;

public class Overproof {
    private Long id;

    private Long companyid;

    private String name;

    private String overproofvalue;

    private String standardvalue;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getCompanyid() {
        return companyid;
    }

    public void setCompanyid(Long companyid) {
        this.companyid = companyid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getOverproofvalue() {
        return overproofvalue;
    }

    public void setOverproofvalue(String overproofvalue) {
        this.overproofvalue = overproofvalue == null ? null : overproofvalue.trim();
    }

    public String getStandardvalue() {
        return standardvalue;
    }

    public void setStandardvalue(String standardvalue) {
        this.standardvalue = standardvalue == null ? null : standardvalue.trim();
    }
}