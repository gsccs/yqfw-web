package com.gsccs.yqfw.gis.model;

import java.util.List;

/**
 * 园区土地信息
 * @author x.d zhang
 *
 */
public class LandInfo {

	private String id;
	private String code;
	private String title;
	private String remark;
	private Double measure;
	private String state;
	private String corpid;
	private String classid;
	
	//企业名称
	private String corpname;
	//分类名称
	private String classfy;
	
	private String fillcolor;
	private String linecolor;
    private Integer weight;
    private Float opacity;
    
	private List<LandPoint> points;
	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id == null ? null : id.trim();
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code == null ? null : code.trim();
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title == null ? null : title.trim();
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark == null ? null : remark.trim();
	}

	public Double getMeasure() {
		return measure;
	}

	public void setMeasure(Double measure) {
		this.measure = measure;
	}

	public String getState() {
		return state;
	}

	
	public void setState(String state) {
		this.state = state == null ? null : state.trim();
	}

	public String getCorpid() {
		return corpid;
	}

	
	public void setCorpid(String corpid) {
		this.corpid = corpid == null ? null : corpid.trim();
	}

	
	public List<LandPoint> getPoints() {
		/*if (null == points || points.size()<=0){
			points = new ArrayList<>();
			Random random = new Random();
			float lng_random = random.nextFloat();
			float lat_random = random.nextFloat();
			//左上角
			LandPoint point_lt = new LandPoint();
			point_lt.setLng(100.45-lng_random/100);
			point_lt.setLat(38.94+lat_random/100);
			points.add(point_lt);
			//右上角
			LandPoint point_rt = new LandPoint();
			point_rt.setLng(100.45+lng_random/100);
			point_rt.setLat(38.94+lat_random/100);
			points.add(point_rt);
			//右下角
			LandPoint point_rb = new LandPoint();
			point_rb.setLng(100.45+lng_random/100);
			point_rb.setLat(38.94-lat_random/100);
			points.add(point_rb);
			
			//左下角
			LandPoint point_lb = new LandPoint();
			point_lb.setLng(100.45-lng_random/100);
			point_lb.setLat(38.94-lat_random/100);
			points.add(point_lb);
		}*/
		return points;
	}

	public void setPoints(List<LandPoint> points) {
		this.points = points;
	}

	public String getCorpname() {
		return corpname;
	}

	public void setCorpname(String corpname) {
		this.corpname = corpname;
	}

	public String getClassid() {
		return classid;
	}

	public void setClassid(String classid) {
		this.classid = classid;
	}

	public String getClassfy() {
		return classfy;
	}

	public void setClassfy(String classfy) {
		this.classfy = classfy;
	}

	public String getFillcolor() {
		return fillcolor;
	}

	public void setFillcolor(String fillcolor) {
		this.fillcolor = fillcolor;
	}

	public String getLinecolor() {
		return linecolor;
	}

	public void setLinecolor(String linecolor) {
		this.linecolor = linecolor;
	}

	public Integer getWeight() {
		return weight;
	}

	public void setWeight(Integer weight) {
		this.weight = weight;
	}

	public Float getOpacity() {
		return opacity;
	}

	public void setOpacity(Float opacity) {
		this.opacity = opacity;
	}
}