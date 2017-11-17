package com.gsccs.yqfw.gis.service;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gsccs.yqfw.gis.dao.GisConfMapper;
import com.gsccs.yqfw.gis.model.GisConf;
import com.gsccs.yqfw.gis.model.GisConfExample;

@Service
public class GisConfServiceImpl implements GisConfService{
	
	@Autowired
	private GisConfMapper gisConfMapper;
	
	@Override
	public void addGisConf(GisConf gisConf) {
		gisConfMapper.insert(gisConf);
	}

	@Override
	public GisConf getGisConf(String ak) {
		if (GISCONF_CACHE.containsKey(ak)){
			return GISCONF_CACHE.get(ak);
		}else{
			GisConf gisConf = gisConfMapper.selectByPrimaryKey(ak);
			GISCONF_CACHE.put(ak, gisConf);
			return gisConf;
		}
	}

	
	@Override
	public List<GisConf> find(GisConf param) {
		GisConfExample example = new GisConfExample();
		GisConfExample.Criteria c = example.createCriteria();
		List<GisConf> confs = gisConfMapper.selectByExample(example);
		if (null != confs){
			for(int i=0;i<confs.size();i++){
				GISCONF_CACHE.put(confs.get(i).getAuthkey(), confs.get(i));
			}
		}
		return confs;
	}

	@Override
	public void updateGisConf(GisConf gisConf) {
		if (null != gisConf){
			gisConfMapper.updateByPrimaryKey(gisConf);
		}
		find(null);
	}

	
	@Override
	public Integer count(GisConf param) {
		return 1;
	}

	@Override
	public GisConf getDefaultGisConf() {
		if (GISCONF_CACHE.isEmpty()){
			GisConfExample example = new GisConfExample();
			GisConfExample.Criteria c = example.createCriteria();
			List<GisConf> confs = gisConfMapper.selectByExample(example);
			if (null != confs){
				for(int i=0;i<confs.size();i++){
					GISCONF_CACHE.put(confs.get(i).getAuthkey(), confs.get(i));
				}
			}
		}
		
		Iterator<String> its = GISCONF_CACHE.keySet().iterator();
		return GISCONF_CACHE.get(its.next());
	}

}
