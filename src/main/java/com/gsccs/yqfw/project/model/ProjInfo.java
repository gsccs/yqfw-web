package com.gsccs.yqfw.project.model;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * x.d zhang
 * @author x.d zhang
 *
 */
public class ProjInfo {

	private String id;
	private String title;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")  
	private Date pstartday;
	@DateTimeFormat(pattern="yyyy-MM-dd")  
	private Date pendday;
	@DateTimeFormat(pattern="yyyy-MM-dd")  
	private Date endday;
	//项目负责人
	private String leader;
	//联系电话
	private String linktel;
	
	private String remark;
	private Integer ordernum;
	private String state;
	private String corpid;
	private String landid;
	
	private String pstartdaystr;
	private String penddaystr;
	private String enddaystr;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id == null ? null : id.trim();
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title == null ? null : title.trim();
	}

	public Date getPstartday() {
		return pstartday;
	}

	public void setPstartday(Date pstartday) {
		this.pstartday = pstartday;
	}

	public Date getPendday() {
		return pendday;
	}

	public void setPendday(Date pendday) {
		this.pendday = pendday;
	}

	public Date getEndday() {
		return endday;
	}

	public void setEndday(Date endday) {
		this.endday = endday;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark == null ? null : remark.trim();
	}

	public Integer getOrdernum() {
		return ordernum;
	}

	public void setOrdernum(Integer ordernum) {
		this.ordernum = ordernum;
	}

	public String getPstartdaystr() {
		if (null != getPstartday()){
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			pstartdaystr = df.format(getPstartday());
		}
		return pstartdaystr;
	}

	
	public String getPenddaystr() {
		if (null != getPendday()){
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			penddaystr = df.format(getPendday());
		}
		return penddaystr;
	}

	public String getEnddaystr() {
		return enddaystr;
	}


	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCorpid() {
		return corpid;
	}

	public void setCorpid(String corpid) {
		this.corpid = corpid;
	}

	public String getLandid() {
		return landid;
	}

	public void setLandid(String landid) {
		this.landid = landid;
	}

	public String getLeader() {
		return leader;
	}

	public void setLeader(String leader) {
		this.leader = leader;
	}

	public String getLinktel() {
		return linktel;
	}

	public void setLinktel(String linktel) {
		this.linktel = linktel;
	}
	
	
	
}