package com.gsccs.yqfw.gis.model;

public class GisConf {

	private String authkey;
	private String title;

	// 地图中心点
	private Double centerx;
	private Double centery;
	// 是否控制视野范围
	private String isbound;

	private Double bsswlng;
	private Double bsswlat;
	private Double bsnelng;
	private Double bsnelat;
	
	private String city;
	private String remark;

	public String getAuthkey() {
		return authkey;
	}

	public void setAuthkey(String authkey) {
		this.authkey = authkey == null ? null : authkey.trim();
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title == null ? null : title.trim();
	}

	public Double getCenterx() {
		return centerx;
	}

	public void setCenterx(Double centerx) {
		this.centerx = centerx;
	}

	public Double getCentery() {
		return centery;
	}

	public void setCentery(Double centery) {
		this.centery = centery;
	}

	public String getIsbound() {
		return isbound;
	}

	public void setIsbound(String isbound) {
		this.isbound = isbound;
	}

	
	public Double getBsswlng() {
		return bsswlng;
	}

	public void setBsswlng(Double bsswlng) {
		this.bsswlng = bsswlng;
	}

	public Double getBsswlat() {
		return bsswlat;
	}

	public void setBsswlat(Double bsswlat) {
		this.bsswlat = bsswlat;
	}

	public Double getBsnelng() {
		return bsnelng;
	}

	public void setBsnelng(Double bsnelng) {
		this.bsnelng = bsnelng;
	}

	public Double getBsnelat() {
		return bsnelat;
	}

	public void setBsnelat(Double bsnelat) {
		this.bsnelat = bsnelat;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city == null ? null : city.trim();
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark == null ? null : remark.trim();
	}
}