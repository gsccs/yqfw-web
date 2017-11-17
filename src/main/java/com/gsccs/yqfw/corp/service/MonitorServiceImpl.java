package com.gsccs.yqfw.corp.service;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gsccs.plat.bass.BaseExample;
import com.gsccs.yqfw.corp.dao.MonitorTypeMapper;
import com.gsccs.yqfw.corp.dao.MonitorValMapper;
import com.gsccs.yqfw.corp.dao.WarnRuleMapper;
import com.gsccs.yqfw.corp.model.MonitorType;
import com.gsccs.yqfw.corp.model.MonitorTypeExample;
import com.gsccs.yqfw.corp.model.MonitorVal;
import com.gsccs.yqfw.corp.model.MonitorValExample;
import com.gsccs.yqfw.corp.model.WarnRule;
import com.gsccs.yqfw.corp.model.WarnRuleExample;

@Service("monitorService")
public class MonitorServiceImpl implements MonitorService {

	@Autowired
	private MonitorTypeMapper monitorTypeMapper;
	@Autowired
	private MonitorValMapper monitorValMapper;
	@Autowired
	private WarnRuleMapper warnRuleMapper;

	@Override
	public void addMonitorType(MonitorType monitorType) {
		if (null != monitorType) {
			monitorType.setId(UUID.randomUUID().toString());
			monitorTypeMapper.insert(monitorType);
		}
	}

	@Override
	public void addMonitorVal(MonitorVal monitorval) {
		if (null != monitorval) {
			monitorval.setId(UUID.randomUUID().toString());
			if (null == monitorval.getAddtime()) {
				monitorval.setAddtime(new Date());
			}
			monitorValMapper.insert(monitorval);
		}
	}

	@Override
	public void addWarnRule(WarnRule warnRule) {
		if (null != warnRule) {
			warnRule.setId(UUID.randomUUID().toString());
			warnRuleMapper.insert(warnRule);
		}
	}

	@Override
	public Integer countMinitorVal(MonitorVal param) {
		MonitorValExample example = new MonitorValExample();
		MonitorValExample.Criteria c = example.createCriteria();
		proSearchParam(param, c);
		return monitorValMapper.countByExample(example);
	}

	@Override
	public Integer countMinitorType(MonitorType param) {
		MonitorTypeExample example = new MonitorTypeExample();
		MonitorTypeExample.Criteria c = example.createCriteria();
		proSearchParam(param, c);
		return monitorTypeMapper.countByExample(example);
	}

	@Override
	public Integer countWarnRule(WarnRule param) {
		WarnRuleExample example = new WarnRuleExample();
		WarnRuleExample.Criteria c = example.createCriteria();
		proSearchParam(param, c);
		return warnRuleMapper.countByExample(example);
	}

	@Override
	public List<MonitorType> find(MonitorType param, String orderstr, int page,
			int pagesize) {
		MonitorTypeExample example = new MonitorTypeExample();
		MonitorTypeExample.Criteria c = example.createCriteria();
		proSearchParam(param, c);
		example.setCurrPage(page);
		example.setPageSize(pagesize);
		return monitorTypeMapper.selectPageByExample(example);
	}

	@Override
	public List<WarnRule> find(WarnRule param, String orderstr, int page,
			int pagesize) {
		WarnRuleExample example = new WarnRuleExample();
		WarnRuleExample.Criteria c = example.createCriteria();
		proSearchParam(param, c);
		example.setCurrPage(page);
		example.setPageSize(pagesize);
		return warnRuleMapper.selectPageByExample(example);
	}
	
	
	@Override
	public List<WarnRule> find(WarnRule param) {
		WarnRuleExample example = new WarnRuleExample();
		WarnRuleExample.Criteria c = example.createCriteria();
		proSearchParam(param, c);
		return warnRuleMapper.selectByExample(example);
	}

	@Override
	public List<MonitorVal> find(MonitorVal param, String orderstr, int page,
			int pagesize) {
		MonitorValExample example = new MonitorValExample();
		MonitorValExample.Criteria c = example.createCriteria();
		proSearchParam(param, c);
		example.setCurrPage(page);
		example.setPageSize(pagesize);
		if (StringUtils.isNotEmpty(orderstr)) {
			example.setOrderByClause(orderstr);
		}
		return monitorValMapper.selectPageByExample(example);
	}

	private void proSearchParam(MonitorType param,
			MonitorTypeExample.Criteria criteria) {
		if (param != null) {

			if (param.getId() != null) {
				criteria.andIdEqualTo(param.getId());
			}
			if (StringUtils.isNotEmpty(param.getState())) {
				criteria.andStateEqualTo(param.getState());
			}

			if (StringUtils.isNotEmpty(param.getTitle())) {
				criteria.andTitleLike("%" + param.getTitle() + "%");
			}
		}
	}

	private void proSearchParam(MonitorVal param,
			MonitorValExample.Criteria criteria) {
		if (param != null) {
			if (param.getId() != null) {
				criteria.andIdEqualTo(param.getId());
			}
			if (StringUtils.isNotEmpty(param.getTypeId())) {
				criteria.andTypeIdEqualTo(param.getTypeId());
			}

			if (StringUtils.isNotEmpty(param.getCorpId())) {
				criteria.andCorpIdEqualTo(param.getCorpId());
			}

		}
	}

	private void proSearchParam(WarnRule param,
			WarnRuleExample.Criteria criteria) {
		if (param != null) {
			if (param.getId() != null) {
				criteria.andIdEqualTo(param.getId());
			}

			if (StringUtils.isNotEmpty(param.getTypeId())) {
				criteria.andTypeIdEqualTo(param.getTypeId());
			}

			if (StringUtils.isNotEmpty(param.getState())) {
				criteria.andStateEqualTo(param.getState());
			}
		}
	}

	@Override
	public void updateMonitorType(MonitorType monitorType) {
		if (null != monitorType) {
			monitorTypeMapper.updateByPrimaryKey(monitorType);
		}
	}

	@Override
	public void updateMonitorVal(MonitorVal monitorval) {
		if (null != monitorval) {
			monitorValMapper.updateByPrimaryKey(monitorval);
		}
	}

	@Override
	public void updateWarnRule(WarnRule warnRule) {
		if (null != warnRule) {
			warnRuleMapper.updateByPrimaryKey(warnRule);
		}
	}

	@Override
	public MonitorType getMonitorType(String id) {
		if (StringUtils.isNotEmpty(id)) {
			return monitorTypeMapper.selectByPrimaryKey(id);
		}
		return null;
	}

	@Override
	public MonitorVal getMonitorVal(String id) {
		if (StringUtils.isNotEmpty(id)) {
			return monitorValMapper.selectByPrimaryKey(id);
		}
		return null;
	}

	@Override
	public WarnRule getWarnRule(String id) {
		if (StringUtils.isNotEmpty(id)) {
			return warnRuleMapper.selectByPrimaryKey(id);
		}
		return null;
	}

	@Override
	public void delMonitorType(List<String> ids) {
		if (null != ids && ids.size() > 0) {
			MonitorTypeExample example = new MonitorTypeExample();
			MonitorTypeExample.Criteria c = example.createCriteria();
			c.andIdIn(ids);
			monitorTypeMapper.deleteByExample(example);
		}
	}

	@Override
	public void delMonitorVal(List<String> ids) {
		if (null != ids && ids.size() > 0) {
			System.out.println("id size="+ids.size());
			System.out.println("id"+ids.get(0));
			MonitorValExample example = new MonitorValExample();
			MonitorValExample.Criteria c = example.createCriteria();
			c.andIdIn(ids);
			monitorValMapper.deleteByExample(example);
		}
	}

	@Override
	public void delWarnRule(List<String> ids) {
		if (null != ids && ids.size() > 0) {
			WarnRuleExample example = new WarnRuleExample();
			WarnRuleExample.Criteria c = example.createCriteria();
			c.andIdIn(ids);
			warnRuleMapper.deleteByExample(example);
		}
	}

	@Override
	public List<MonitorVal> findCorpMonitVals(String corpid) {
		return monitorValMapper.selectCorpMonitVals(corpid);
	}

	@Override
	public void delCorpMonitorVal(String corpid) {
		MonitorValExample example = new MonitorValExample();
		MonitorValExample.Criteria c = example.createCriteria();
		c.andCorpIdEqualTo(corpid);
		monitorValMapper.deleteByExample(example);
	}

	@Override
	public List<MonitorVal> findOverData(int page, int pagesize) {
		BaseExample baseExample = new BaseExample();
		baseExample.setCurrPage(page);
		baseExample.setPageSize(pagesize);
		return monitorValMapper.selectOverData(baseExample.getSkip(), baseExample.getPageSize());
	}

	

}
