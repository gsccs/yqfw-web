package com.gsccs.yqfw.gis.model;

/**
 * 图层要素分类
 * 
 * @author x.d zhang
 * 
 */
public class MarkerFactor {

	private String id;
	private String title;
	private String state;
	private String remark;
	private String icon;
	private String linecolor = "#6495ED";
	private String fillcolor = "#6495ED";
    private Integer weight = 2;
    private Float opacity = 0.5f;
	
	private ClassfyType classfy;

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

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state == null ? null : state.trim();
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark == null ? null : remark.trim();
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon == null ? null : icon.trim();
	}
	
	public String getLinecolor() {
		return linecolor;
	}

	public void setLinecolor(String linecolor) {
		this.linecolor = linecolor;
	}

	public String getFillcolor() {
		return fillcolor;
	}

	public void setFillcolor(String fillcolor) {
		this.fillcolor = fillcolor;
	}

	public ClassfyType getClassfy() {
		return classfy;
	}

	
	public void setClassfy(ClassfyType classfy) {
		this.classfy = classfy;
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


	public static enum ClassfyType {
		LAND("土地"), PIPE("管线"), CORP("企业"),SCALE("企业规模");

		private final String info;

		private ClassfyType(String info) {
			this.info = info;
		}

		public String getInfo() {
			return info;
		}
	}
}