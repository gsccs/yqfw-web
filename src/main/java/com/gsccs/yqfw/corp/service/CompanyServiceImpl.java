package com.gsccs.yqfw.corp.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gsccs.yqfw.corp.dao.CompanyMapper;
import com.gsccs.yqfw.corp.dao.OverproofMapper;
import com.gsccs.yqfw.corp.model.Company;
import com.gsccs.yqfw.corp.model.CompanyExample;
import com.gsccs.yqfw.gis.model.GisConf;
import com.gsccs.yqfw.gis.model.PipePoint;
import com.gsccs.yqfw.gis.service.GisConfService;

@Service
public class CompanyServiceImpl implements CompanyService {

	@Autowired
	private CompanyMapper companyMapper;

	@Autowired
	private OverproofMapper overproofMapper;

	@Autowired
	private GisConfService gisConfService;
	
	@Override
	public void addCompany(Company company) {
		if (null != company){
			company.setId(UUID.randomUUID().toString());
			GisConf gisConf = gisConfService.getDefaultGisConf();
			
			Random random = new Random();
			float lng_random = random.nextFloat();
			float lat_random = random.nextFloat();
			company.setLng(gisConf.getCenterx()+lng_random/100);
			company.setLat(gisConf.getCentery()+lat_random/100);
			companyMapper.insert(company);
		}
	}

	
	
	@Override
	public List<Company> find(Company company, String order, int currPage,
			int pageSize) {
		CompanyExample example = new CompanyExample();
		CompanyExample.Criteria c = example.createCriteria();
		proSearchParam(company, c);
		example.setPageSize(pageSize);
		example.setCurrPage(currPage);
		return companyMapper.selectPageByExample(example);
	}

	@Override
	public List<Company> find(Company company) {
		CompanyExample example = new CompanyExample();
		CompanyExample.Criteria c = example.createCriteria();
		proSearchParam(company, c);
		return companyMapper.selectByExample(example);
	}

	private void proSearchParam(Company company,
			CompanyExample.Criteria criteria) {
		if (company != null) {
			if (company.getId() != null) {
				criteria.andIdEqualTo(company.getId());
			}

			if (StringUtils.isNotEmpty(company.getClassid())) {
				criteria.andClassidEqualTo(company.getClassid());
			}

			if (StringUtils.isNotEmpty(company.getScaleid())) {
				criteria.andScaleidEqualTo(company.getScaleid());
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
	public int count(Company company) {
		CompanyExample example = new CompanyExample();
		CompanyExample.Criteria c = example.createCriteria();
		proSearchParam(company, c);
		return companyMapper.countByExample(example);
	}

	@Override
	public Company getCompany(String id) {
		return companyMapper.selectByPrimaryKey(id);
	}

	@Override
	public void updateCompany(Company company) {
		if (null != company) {
			companyMapper.updateByPrimaryKey(company);
		}
	}

	@Override
	public void delCompany(String id) {
		companyMapper.deleteByPrimaryKey(id);
	}
}
