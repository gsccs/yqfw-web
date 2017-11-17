package com.gsccs.yqfw.gis.service;

import java.util.List;

import com.gsccs.yqfw.corp.model.MonitorType;
import com.gsccs.yqfw.corp.model.MonitorVal;
import com.gsccs.yqfw.corp.model.WarnRule;
import com.gsccs.yqfw.gis.model.PipeLine;
import com.gsccs.yqfw.gis.model.PipePoint;

/**
 * 监测接口
 * 
 * @author x.d zhang
 * 
 */
public interface PipeService {

	public void addPipeLine(PipeLine pipeLine);

	public void updatePipeLine(PipeLine pipeLine);

	public void delPipeLine(String id);

	public PipeLine getPipeLine(String id);

	public List<PipeLine> find(PipeLine param, String orderstr, int page,
			int pagesize);

	public Integer countPipeLine(PipeLine param);

	public List<PipePoint> findByPipeid(String pipeid);

	public void addPipePoint(List<PipePoint> pipePoints);

	public void updatePipePoint(PipePoint pipePoint);

	public List<PipePoint> find(PipePoint param, String orderstr, int page,
			int pagesize);
}
