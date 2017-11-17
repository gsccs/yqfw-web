package com.gsccs.yqfw.corp.model;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 企业监测数据
 * @author x.d zhang
 *
 */
public class MonitorVal {

	private String id;
	private String typeId;
	private String corpId;
	private Double monitval;
	private Date addtime;
	private String remark;
	private String addtimestr;
	// 企业名称
	private String corpname;
	// 指标名称
	private String typename;
	// 是否超标
	private String isover;
	//单位名称
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

	public String getCorpId() {
		return corpId;
	}

	public void setCorpId(String corpId) {
		this.corpId = corpId == null ? null : corpId.trim();
	}

	public Double getMonitval() {
		return monitval;
	}

	public void setMonitval(Double monitval) {
		this.monitval = monitval;
	}

	public Date getAddtime() {
		return addtime;
	}

	public void setAddtime(Date addtime) {
		this.addtime = addtime;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark == null ? null : remark.trim();
	}

	public String getCorpname() {
		return corpname;
	}

	public void setCorpname(String corpname) {
		this.corpname = corpname;
	}

	public String getTypename() {
		return typename;
	}

	public void setTypename(String typename) {
		this.typename = typename;
	}

	public String getAddtimestr() {
		if(null != getAddtime()){
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			addtimestr = df.format(getAddtime());
		}
		return addtimestr;
	}

	public void setAddtimestr(String addtimestr) {
		this.addtimestr = addtimestr;
	}

	public String getIsover() {
		return isover;
	}
	
	public void setIsover(String isover) {
		this.isover = isover;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	
	
}