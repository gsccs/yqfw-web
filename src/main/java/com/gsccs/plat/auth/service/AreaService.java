package com.gsccs.plat.auth.service;

import java.util.List;

import com.gsccs.yqfw.gis.model.Area;

public interface AreaService {

	public void add(Area area);
	public void update(Area area);
	public Area findById(String id);
	public List<Area> find(Area area);
	
}
