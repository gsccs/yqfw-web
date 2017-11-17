package com.gsccs.yqfw.corp.model;

/**
 * 预警规则
 * @author x.d zhang
 *
 */
public class WarnRule {
	
    private String id;
    private String typeId;
    private String rule;
    private Double threshold;
    private String remark;
    private String state;
    //指标名称
    private String typename;
    //指标单位
    private String unit;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getTypeId() {
        return typeId;
    }

    public void setTypeId(String typeId) {
        this.typeId = typeId == null ? null : typeId.trim();
    }

    
    public String getRule() {
        return rule;
    }

    
    public void setRule(String rule) {
        this.rule = rule == null ? null : rule.trim();
    }

    
    public Double getThreshold() {
        return threshold;
    }

    public void setThreshold(Double threshold) {
        this.threshold = threshold;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

	public String getTypename() {
		return typename;
	}

	public void setTypename(String typename) {
		this.typename = typename;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
}