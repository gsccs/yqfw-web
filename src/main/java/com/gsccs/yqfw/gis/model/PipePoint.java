package com.gsccs.yqfw.gis.model;

public class PipePoint {
	
	
	private String id;
	private String pipeid;
	private Double lng;
	private Double lat;
	private String remark;
	private Integer ordernum;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPipeid() {
		return pipeid;
	}

	public void setPipeid(String pipeid) {
		this.pipeid = pipeid == null ? null : pipeid.trim();
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

}