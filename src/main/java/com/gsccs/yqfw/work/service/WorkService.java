package com.gsccs.yqfw.work.service;

import java.util.List;

import com.gsccs.yqfw.work.model.WorkNotice;
import com.gsccs.yqfw.work.model.WorkPlan;

/**
 * 社区工作服务接口
 * @author x.d zhang
 *
 */
public interface WorkService {

	public List<WorkPlan> find(WorkPlan param, String orderstr, int page,
			int pagesize);
	public int count(WorkPlan param);
	public WorkPlan getPlan(String id);
	public void add(WorkPlan workPlan);
	public void update(WorkPlan workPlan);
	public void deletePlan(String id);
	
	
	public List<WorkNotice> find(WorkNotice param, String orderstr, int page,
			int pagesize);
	public int count(WorkNotice param);
	public WorkNotice getNotice(String id);
	public void add(WorkNotice workNotice);
	public void update(WorkNotice workNotice);
	public void deleteNotice(String id);
	
	

}
