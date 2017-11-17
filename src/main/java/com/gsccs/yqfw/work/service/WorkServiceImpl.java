package com.gsccs.yqfw.work.service;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.druid.util.StringUtils;
import com.gsccs.yqfw.work.dao.WorkNoticeMapper;
import com.gsccs.yqfw.work.dao.WorkPlanMapper;
import com.gsccs.yqfw.work.model.WorkNotice;
import com.gsccs.yqfw.work.model.WorkNoticeExample;
import com.gsccs.yqfw.work.model.WorkPlan;
import com.gsccs.yqfw.work.model.WorkPlanExample;

@Service
public class WorkServiceImpl implements WorkService {

	@Autowired
	private WorkPlanMapper workPlanMapper;
	@Autowired
	private WorkNoticeMapper workNoticeMapper;

	@Override
	public List<WorkPlan> find(WorkPlan param, String orderstr, int page,
			int pagesize) {
		WorkPlanExample example = new WorkPlanExample();
		WorkPlanExample.Criteria c = example.createCriteria();
		prefix(c, param);
		example.setCurrPage(page);
		example.setPageSize(pagesize);
		return workPlanMapper.selectPageByExample(example);
	}

	@Override
	public int count(WorkPlan param) {
		WorkPlanExample example = new WorkPlanExample();
		WorkPlanExample.Criteria c = example.createCriteria();
		prefix(c, param);
		return workPlanMapper.countByExample(example);
	}

	@Override
	public void add(WorkPlan workPlan) {
		if (null != workPlan) {
			workPlan.setId(UUID.randomUUID().clockSequence()+"");
			workPlan.setAddtime(new Date());
			workPlanMapper.insert(workPlan);
		}
	}

	@Override
	public void update(WorkPlan workPlan) {
		if (null != workPlan) {
			workPlanMapper.updateByPrimaryKey(workPlan);
		}
	}

	@Override
	public void deletePlan(String id) {
		workPlanMapper.deleteByPrimaryKey(id);
	}

	@Override
	public List<WorkNotice> find(WorkNotice param, String orderstr, int page,
			int pagesize) {
		WorkNoticeExample example = new WorkNoticeExample();
		WorkNoticeExample.Criteria c = example.createCriteria();
		prefix(c, param);
		example.setCurrPage(page);
		example.setPageSize(pagesize);
		return workNoticeMapper.selectPageByExample(example);
	}

	@Override
	public int count(WorkNotice param) {
		WorkNoticeExample example = new WorkNoticeExample();
		WorkNoticeExample.Criteria c = example.createCriteria();
		prefix(c, param);
		return workNoticeMapper.countByExample(example);
	}

	@Override
	public void add(WorkNotice workNotice) {
		if (null != workNotice) {
			workNotice.setId(UUID.randomUUID().toString());
			workNotice.setAddtime(new Date());
			workNoticeMapper.insert(workNotice);
		}
	}

	@Override
	public void update(WorkNotice workNotice) {
		if (null != workNotice) {
			workNoticeMapper.updateByPrimaryKey(workNotice);
		}
	}

	@Override
	public void deleteNotice(String id) {
		if (null != id && id.trim().length() > 0) {
			workNoticeMapper.deleteByPrimaryKey(id);
		}
	}

	/**
	 * @param c
	 * @param param
	 */
	private void prefix(WorkPlanExample.Criteria c, WorkPlan param) {
		if (null != param) {
			System.err.println(param.getTitle());
			if (!StringUtils.isEmpty(param.getTitle())) {
				c.andTitleLike("%" + param.getTitle() + "%");
			}
			if (!StringUtils.isEmpty(param.getState())) {
				c.andStateEqualTo(param.getState());
			}
		}
	}

	private void prefix(WorkNoticeExample.Criteria c, WorkNotice param) {
		if (null != param) {
			if (!StringUtils.isEmpty(param.getContent())) {
				c.andContentLike("%" + param.getContent() + "%");
			}
		}
	}

	@Override
	public WorkPlan getPlan(String id) {

		return workPlanMapper.selectByPrimaryKey(id);
	}

	@Override
	public WorkNotice getNotice(String id) {
		return workNoticeMapper.selectByPrimaryKey(id);
	}

}
