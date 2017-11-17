package com.gsccs.yqfw.gis.model;

import java.util.ArrayList;
import java.util.List;

/**
 * 园区管线
 * @author x.d zhang
 *
 */
public class PipeLine {
	
    private String id;
    private String code;
    private String title;
    private String remark;
    private String state;
    private String length;
    private String corpid;
    private String classid;	//管线分类
    
    private String classfy;
    private String corpname;
    private String linecolor;
    private Integer weight;
    private Float opacity;
    
    private List<PipePoint> points;

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

    
    public String getState() {
        return state;
    }

   
    public void setState(String state) {
        this.state = state == null ? null : state.trim();
    }

   
    public String getLength() {
        return length;
    }

    
    public void setLength(String length) {
        this.length = length == null ? null : length.trim();
    }

    public String getClassid() {
		return classid;
	}

	public void setClassid(String classid) {
		this.classid = classid;
	}
    
    public String getCorpid() {
        return corpid;
    }

    public void setCorpid(String corpid) {
        this.corpid = corpid == null ? null : corpid.trim();
    }

	public List<PipePoint> getPoints() {
		return points;
	}

	public void setPoints(List<PipePoint> points) {
		this.points = points;
	}

	public String getClassfy() {
		return classfy;
	}

	public void setClassfy(String classfy) {
		this.classfy = classfy;
	}

	
	public String getCorpname() {
		return corpname;
	}

	public void setCorpname(String corpname) {
		this.corpname = corpname;
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