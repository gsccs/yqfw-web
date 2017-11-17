package com.gsccs.yqfw.gis.service;

import java.util.List;

import com.gsccs.yqfw.gis.model.MarkerFactor;
import com.gsccs.yqfw.gis.model.MarkerFactor.ClassfyType;

/**
 * 图层要素接口
 * 
 * @author x.d zhang
 * 
 */
public interface MarkerService {

	public void addMarkerFact(MarkerFactor markerFactor);

	public void updateMarkerFactor(MarkerFactor markerFactor);

	public MarkerFactor getMarkerFactor(String id);

	public List<MarkerFactor> find(MarkerFactor param, String orderstr,
			int page, int pagesize);

	public List<MarkerFactor> findByClassfy(ClassfyType classfy);

	public Integer count(MarkerFactor param);
	
	public void delMarkerFactors(List<String> ids);

}
