package com.gsccs.yqfw.corp.service;

import java.util.List;

import com.gsccs.yqfw.corp.model.MonitorType;
import com.gsccs.yqfw.corp.model.MonitorVal;
import com.gsccs.yqfw.corp.model.WarnRule;

/**
 * 监测接口
 * @author x.d zhang
 *
 */
public interface MonitorService {

	public void addMonitorType(MonitorType monitorType);
	public void addMonitorVal(MonitorVal monitorval);
	public void addWarnRule(WarnRule warnRule);
	
	public void updateMonitorType(MonitorType monitorType);
	public void updateMonitorVal(MonitorVal monitorval);
	public void updateWarnRule(WarnRule warnRule);
	
	
	public MonitorType getMonitorType(String id);
	public MonitorVal getMonitorVal(String id);
	public WarnRule getWarnRule(String id);
	
	public void delMonitorType(List<String> ids);
	public void delMonitorVal(List<String> ids);
	public void delCorpMonitorVal(String corpid);
	public void delWarnRule(List<String> ids);
	
	public List<MonitorType> find(MonitorType param,String orderstr,int page,int pagesize);
	public List<WarnRule> find(WarnRule param,String orderstr,int page,int pagesize);
	public List<WarnRule> find(WarnRule param);
	public List<MonitorVal> find(MonitorVal param,String orderstr,int page,int pagesize);
	
	public List<MonitorVal> findOverData(int page,int pagesize);
	public List<MonitorVal> findCorpMonitVals(String corpid);
	
	public Integer countMinitorVal(MonitorVal param);
	public Integer countMinitorType(MonitorType param);
	public Integer countWarnRule(WarnRule param);
}
