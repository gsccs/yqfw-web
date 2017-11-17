package com.gsccs.yqfw.gis.service;

import java.util.List;
import java.util.UUID;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gsccs.yqfw.gis.dao.MarkerFactorMapper;
import com.gsccs.yqfw.gis.model.MarkerFactor;
import com.gsccs.yqfw.gis.model.MarkerFactor.ClassfyType;
import com.gsccs.yqfw.gis.model.MarkerFactorExample;


@Service(value = "markerService")
public class MakerServiceImpl implements MarkerService {

	@Autowired
	private MarkerFactorMapper markerFactorMapper;

	@Override
	public void addMarkerFact(MarkerFactor markerFactor) {
		if (null != markerFactor) {
			markerFactor.setId(UUID.randomUUID().toString());
			markerFactorMapper.insert(markerFactor);
		}
	}

	@Override
	public void updateMarkerFactor(MarkerFactor markerFactor) {
		if (null != markerFactor) {
			markerFactorMapper.updateByPrimaryKey(markerFactor);
		}
	}

	@Override
	public MarkerFactor getMarkerFactor(String id) {
		return markerFactorMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<MarkerFactor> find(MarkerFactor param, String orderstr,
			int page, int pagesize) {
		MarkerFactorExample example = new MarkerFactorExample();
		MarkerFactorExample.Criteria c = example.createCriteria();
		proSearchParam(param, c);
		example.setCurrPage(page);
		example.setPageSize(pagesize);
		return markerFactorMapper.selectPageByExample(example);
	}

	@Override
	public List<MarkerFactor> findByClassfy(ClassfyType classfy) {
		if (null != classfy) {
			MarkerFactorExample example = new MarkerFactorExample();
			MarkerFactorExample.Criteria c = example.createCriteria();
			c.andClassfyEqualTo(classfy.name());
			return markerFactorMapper.selectByExample(example);
		}
		return null;
	}

	@Override
	public Integer count(MarkerFactor param) {
		MarkerFactorExample example = new MarkerFactorExample();
		MarkerFactorExample.Criteria c = example.createCriteria();
		proSearchParam(param, c);
		return markerFactorMapper.countByExample(example);
	}

	private void proSearchParam(MarkerFactor param,
			MarkerFactorExample.Criteria criteria) {
		if (param != null) {
			if (param.getId() != null) {
				criteria.andIdEqualTo(param.getId());
			}

			if (StringUtils.isNotEmpty(param.getState())) {
				criteria.andStateEqualTo(param.getState());
			}

			if (null != param.getClassfy()) {
				criteria.andClassfyEqualTo(param.getClassfy().name());
			}

			if (StringUtils.isNotEmpty(param.getTitle())) {
				criteria.andTitleLike("%" + param.getTitle() + "%");
			}
		}
	}

	@Override
	public void delMarkerFactors(List<String> ids) {
		if (null != ids && ids.size()>0){
			MarkerFactorExample example = new MarkerFactorExample();
			MarkerFactorExample.Criteria c = example.createCriteria();
			c.andIdIn(ids);
			markerFactorMapper.deleteByExample(example);
		}
	}

}
