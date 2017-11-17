package com.gsccs.yqfw.gis.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.gsccs.yqfw.gis.model.GisConf;


/**
 * 地图配置接口
 * @author x.d zhang
 *
 */
public interface GisConfService {
	
	static Map<String,GisConf> GISCONF_CACHE = new HashMap<String, GisConf>();
	
	public void addGisConf(GisConf gisConf);
	public void updateGisConf(GisConf gisConf);
	
	public GisConf getGisConf(String ak);
	
	public GisConf getDefaultGisConf();
	
	public List<GisConf> find(GisConf param);
	public Integer count(GisConf param);

}
