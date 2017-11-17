package com.gsccs.yqfw.corp.model;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 企业信息
 * 
 * @author x.d zhang
 * 
 */
public class Company {

	private String id;
	private String title;
	private Double lng;
	private Double lat;
	private String tel;
	private String state;
	private String leader;
	private String remark;
	private String address;
	private String classid; // 企业类型
	private String scaleid; // 企业规模
	private Date newtime; // 成了日期
	private Date intime; // 入驻时间
	//企业logo
	private String logo;

	private String newtimestr;
	private String scalestr;
	private String intimestr;
	private String classfy;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title == null ? null : title.trim();
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel == null ? null : tel.trim();
	}

	public String getLeader() {
		return leader;
	}

	public void setLeader(String leader) {
		this.leader = leader == null ? null : leader.trim();
	}

	public Double getLng() {
		return lng;
	}

	public void setLng(Double lng) {
		this.lng = lng;
	}

	public Double getLat() {
		return lat;
	}

	public void setLat(Double lat) {
		this.lat = lat;
	}

	public String getClassid() {
		return classid;
	}

	public void setClassid(String classid) {
		this.classid = classid;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getClassfy() {
		return classfy;
	}

	public void setClassfy(String classfy) {
		this.classfy = classfy;
	}

	public Date getIntime() {
		return intime;
	}

	public void setIntime(Date intime) {
		this.intime = intime;
	}

	public String getIntimestr() {
		if (null != getIntime()) {
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			intimestr = df.format(getIntime());
		}
		return intimestr;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getScaleid() {
		return scaleid;
	}

	public void setScaleid(String scaleid) {
		this.scaleid = scaleid;
	}

	public void setIntimestr(String intimestr) {
		this.intimestr = intimestr;
	}

	public String getScalestr() {
		return scalestr;
	}

	public void setScalestr(String scalestr) {
		this.scalestr = scalestr;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public Date getNewtime() {
		return newtime;
	}

	public void setNewtime(Date newtime) {
		this.newtime = newtime;
	}

	public String getNewtimestr() {
		if (null != getNewtime()) {
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			newtimestr = df.format(getNewtime());
		}
		return newtimestr;
	}

}