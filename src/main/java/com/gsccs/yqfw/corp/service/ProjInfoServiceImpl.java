package com.gsccs.yqfw.corp.service;

import java.util.List;
import java.util.UUID;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gsccs.yqfw.project.dao.ProjInfoMapper;
import com.gsccs.yqfw.project.model.ProjInfo;
import com.gsccs.yqfw.project.model.ProjInfoExample;

@Service
public class ProjInfoServiceImpl implements ProjInfoService {

	@Autowired
	private ProjInfoMapper projInfoMapper;

	@Override
	public void addProjInfo(ProjInfo company) {
		if (null != company) {
			company.setId(UUID.randomUUID().toString());
			projInfoMapper.insert(company);
		}
	}

	@Override
	public List<ProjInfo> find(ProjInfo company, String order, int currPage,
			int pageSize) {
		ProjInfoExample example = new ProjInfoExample();
		ProjInfoExample.Criteria c = example.createCriteria();
		proSearchParam(company, c);
		example.setPageSize(pageSize);
		example.setCurrPage(currPage);
		return projInfoMapper.selectPageByExample(example);
	}

	@Override
	public List<ProjInfo> find(ProjInfo company) {
		ProjInfoExample example = new ProjInfoExample();
		ProjInfoExample.Criteria c = example.createCriteria();
		proSearchParam(company, c);
		return projInfoMapper.selectByExample(example);
	}

	private void proSearchParam(ProjInfo company,
			ProjInfoExample.Criteria criteria) {
		if (company != null) {
			if (company.getId() != null) {
				criteria.andIdEqualTo(company.getId());
			}

			if (StringUtils.isNotEmpty(company.getState())) {
				criteria.andStateEqualTo(company.getState());
			}

			if (StringUtils.isNotEmpty(company.getTitle())) {
				criteria.andTitleLike("%" + company.getTitle() + "%");
			}
		}
	}

	@Override
	public int count(ProjInfo company) {
		ProjInfoExample example = new ProjInfoExample();
		ProjInfoExample.Criteria c = example.createCriteria();
		proSearchParam(company, c);
		return projInfoMapper.countByExample(example);
	}

	@Override
	public ProjInfo getProjInfo(String id) {
		return projInfoMapper.selectByPrimaryKey(id);
	}

	@Override
	public void updateProjInfo(ProjInfo company) {
		if (null != company) {
			projInfoMapper.updateByPrimaryKey(company);
		}
	}

	@Override
	public void delProjInfo(String id) {
		projInfoMapper.deleteByPrimaryKey(id);
	}
}
