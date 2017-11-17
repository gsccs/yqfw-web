package com.gsccs.yqfw.corp.service;

import java.util.List;

import com.gsccs.yqfw.project.model.ProjInfo;

public interface ProjInfoService {

	public void addProjInfo(ProjInfo company);

	public void updateProjInfo(ProjInfo company);

	public ProjInfo getProjInfo(String id);

	public void delProjInfo(String id);

	public List<ProjInfo> find(ProjInfo company, String order, int currPage,
			int pageSize);

	public List<ProjInfo> find(ProjInfo company);

	public int count(ProjInfo company);
}
