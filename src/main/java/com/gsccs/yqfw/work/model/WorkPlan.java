package com.gsccs.yqfw.work.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class WorkPlan {

	private String id;
	private String title;
	private String content;
	private String assigner;
	private Date addtime;
	private Date pstarttime;
	private Date pendtime;
	private String state;
	private String remark;
	private Date endtime;

	private String pstartstr;
	private String pendstr;
	private String addtimestr;
	private String endtimestr;

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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content == null ? null : content.trim();
	}

	public String getAssigner() {
		return assigner;
	}

	public void setAssigner(String assigner) {
		this.assigner = assigner == null ? null : assigner.trim();
	}

	public Date getAddtime() {
		return addtime;
	}

	public void setAddtime(Date addtime) {
		this.addtime = addtime;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the
	 * value of the database column sqfw_work_plan.pstarttime
	 * 
	 * @return the value of sqfw_work_plan.pstarttime
	 * 
	 * @mbggenerated Tue Oct 20 11:57:22 CST 2015
	 */
	public Date getPstarttime() {
		return pstarttime;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the
	 * value of the database column sqfw_work_plan.pstarttime
	 * 
	 * @param pstarttime
	 *            the value for sqfw_work_plan.pstarttime
	 * 
	 * @mbggenerated Tue Oct 20 11:57:22 CST 2015
	 */
	public void setPstarttime(Date pstarttime) {
		this.pstarttime = pstarttime;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the
	 * value of the database column sqfw_work_plan.pendtime
	 * 
	 * @return the value of sqfw_work_plan.pendtime
	 * 
	 * @mbggenerated Tue Oct 20 11:57:22 CST 2015
	 */
	public Date getPendtime() {
		return pendtime;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the
	 * value of the database column sqfw_work_plan.pendtime
	 * 
	 * @param pendtime
	 *            the value for sqfw_work_plan.pendtime
	 * 
	 * @mbggenerated Tue Oct 20 11:57:22 CST 2015
	 */
	public void setPendtime(Date pendtime) {
		this.pendtime = pendtime;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the
	 * value of the database column sqfw_work_plan.state
	 * 
	 * @return the value of sqfw_work_plan.state
	 * 
	 * @mbggenerated Tue Oct 20 11:57:22 CST 2015
	 */
	public String getState() {
		return state;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the
	 * value of the database column sqfw_work_plan.state
	 * 
	 * @param state
	 *            the value for sqfw_work_plan.state
	 * 
	 * @mbggenerated Tue Oct 20 11:57:22 CST 2015
	 */
	public void setState(String state) {
		this.state = state == null ? null : state.trim();
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the
	 * value of the database column sqfw_work_plan.remark
	 * 
	 * @return the value of sqfw_work_plan.remark
	 * 
	 * @mbggenerated Tue Oct 20 11:57:22 CST 2015
	 */
	public String getRemark() {
		return remark;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the
	 * value of the database column sqfw_work_plan.remark
	 * 
	 * @param remark
	 *            the value for sqfw_work_plan.remark
	 * 
	 * @mbggenerated Tue Oct 20 11:57:22 CST 2015
	 */
	public void setRemark(String remark) {
		this.remark = remark == null ? null : remark.trim();
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the
	 * value of the database column sqfw_work_plan.endtime
	 * 
	 * @return the value of sqfw_work_plan.endtime
	 * 
	 * @mbggenerated Tue Oct 20 11:57:22 CST 2015
	 */
	public Date getEndtime() {
		return endtime;
	}

	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}

	public String getPstartstr() {
		if (null != getPstarttime()) {
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			pstartstr = df.format(getPstarttime());
		}
		return pstartstr;
	}

	public String getPendstr() {
		if (null != getPendtime()) {
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			pendstr = df.format(getPendtime());
		}
		return pendstr;
	}

	public String getAddtimestr() {
		if (null != getAddtime()) {
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			addtimestr = df.format(getAddtime());
		}
		return addtimestr;
	}

	public String getEndtimestr() {
		if (null != getEndtime()) {
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			endtimestr = df.format(getEndtime());
		}
		return endtimestr;
	}

}