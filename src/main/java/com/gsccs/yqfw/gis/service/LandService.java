package com.gsccs.yqfw.gis.service;

import java.util.List;

import com.gsccs.yqfw.gis.model.LandInfo;
import com.gsccs.yqfw.gis.model.LandPoint;

/**
 * 监测接口
 * 
 * @author x.d zhang
 * 
 */
public interface LandService {

	public void addLandInfo(LandInfo landInfo);
	public LandInfo getLandInfo(String id);

	public void updateLandInfo(LandInfo landInfo);
	
	public void delLandInfo(String id);
	
	public List<LandInfo> find(LandInfo param, String orderstr, int page,
			int pagesize);
	
	public Integer countLandInfo(LandInfo param);

	
	public List<LandPoint> getLandPoints(String landinfoid);
	public void addLandPoints(String landid,List<LandPoint> landPoints);
	public List<LandPoint> find(LandPoint param, String orderstr, int page,
			int pagesize);
}
