package com.gsccs.yqfw.gis.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gsccs.yqfw.gis.dao.PipeLineMapper;
import com.gsccs.yqfw.gis.dao.PipePointMapper;
import com.gsccs.yqfw.gis.model.GisConf;
import com.gsccs.yqfw.gis.model.LandPoint;
import com.gsccs.yqfw.gis.model.LandPointExample;
import com.gsccs.yqfw.gis.model.PipeLine;
import com.gsccs.yqfw.gis.model.PipeLineExample;
import com.gsccs.yqfw.gis.model.PipePoint;
import com.gsccs.yqfw.gis.model.PipePointExample;

@Service("pipeService")
public class PipeServiceImpl implements PipeService {

	@Autowired
	private PipeLineMapper pipeLineMapper;
	@Autowired
	private PipePointMapper pipePointMapper;
	@Autowired
	private GisConfService gisConfService;

	
	@Override
	public void addPipeLine(PipeLine pipeLine) {
		if (null != pipeLine){
			pipeLine.setId(UUID.randomUUID().toString());
			pipeLineMapper.insert(pipeLine);
		}
	}

	public List<PipePoint> initPoints() {
		List<PipePoint> points = new ArrayList<>();
		GisConf gisConf = gisConfService.getDefaultGisConf();
		
		Random random = new Random();
		float lng_random = random.nextFloat();
		float lat_random = random.nextFloat();
		PipePoint point_start = new PipePoint();
		point_start.setLng(gisConf.getCenterx()-lng_random/100);
		point_start.setLat(gisConf.getCentery()+lat_random/100);
		points.add(point_start);
		
		PipePoint point_end = new PipePoint();
		point_end.setLng(gisConf.getCenterx()+lng_random/100);
		point_end.setLat(gisConf.getCentery()-lat_random/100);
		points.add(point_end);
		
		return points;
	}
	
	@Override
	public void delPipeLine(String id) {
		PipePointExample example = new PipePointExample();
		PipePointExample.Criteria c = example.createCriteria();
		c.andPipeidEqualTo(id);
		
		//删除管道地理数据
		pipePointMapper.deleteByExample(example);
		pipeLineMapper.deleteByPrimaryKey(id);
	}

	
	@Override
	public void updatePipeLine(PipeLine pipeLine) {
		if (null != pipeLine){
			pipeLineMapper.updateByPrimaryKey(pipeLine);
		}
	}
	
	@Override
	public PipeLine getPipeLine(String id) {
		return pipeLineMapper.selectByPrimaryKey(id);
	}


	@Override
	public List<PipePoint> findByPipeid(String pipeid) {
		PipePointExample example = new PipePointExample();
		PipePointExample.Criteria c = example.createCriteria();
		c.andPipeidEqualTo(pipeid);
		example.setOrderByClause(" ordernum ");
		List<PipePoint> list = pipePointMapper.selectByExample(example);
		if (null == list || list.size()<=0){
			list = initPoints();
		}
		return list;
	}

	@Override
	public void addPipePoint(List<PipePoint> pipePoints) {
		String pipeid;
		if (null != pipePoints && pipePoints.size() > 0) {
			pipeid = pipePoints.get(0).getPipeid();
			if (StringUtils.isNotEmpty(pipeid)) {
				PipePointExample example = new PipePointExample();
				PipePointExample.Criteria c = example.createCriteria();
				c.andPipeidEqualTo(pipeid);
				pipePointMapper.deleteByExample(example);
			}
			int i = 0;
			for (PipePoint point : pipePoints) {
				if (StringUtils.isNotEmpty(point.getPipeid())) {
					point.setId(UUID.randomUUID().toString());
					point.setOrdernum(i);
					pipePointMapper.insert(point);
					i++;
				}
			}
		}
	}

	@Override
	public void updatePipePoint(PipePoint pipePoint) {
		if (null!=pipePoint){
			pipePointMapper.updateByPrimaryKey(pipePoint);
		}
	}

	@Override
	public List<PipePoint> find(PipePoint param, String orderstr, int page,
			int pagesize) {
		PipePointExample example = new PipePointExample();
		PipePointExample.Criteria c = example.createCriteria();
		proSearchParam(param, c);
		example.setCurrPage(page);
		example.setPageSize(pagesize);
		return pipePointMapper.selectPageByExample(example);
	}

	
	@Override
	public Integer countPipeLine(PipeLine param) {
		PipeLineExample example = new PipeLineExample();
		PipeLineExample.Criteria c = example.createCriteria();
		proSearchParam(param, c);
		return pipeLineMapper.countByExample(example);
	}

	@Override
	public List<PipeLine> find(PipeLine param, String orderstr, int page,
			int pagesize) {
		PipeLineExample example = new PipeLineExample();
		PipeLineExample.Criteria c = example.createCriteria();
		proSearchParam(param, c);
		example.setCurrPage(page);
		example.setPageSize(pagesize);
		return pipeLineMapper.selectPageByExample(example);
	}

	private void proSearchParam(PipeLine param,
			PipeLineExample.Criteria criteria) {
		if (param != null) {
			if (param.getId() != null) {
				criteria.andIdEqualTo(param.getId());
			}

			if (StringUtils.isNotEmpty(param.getCorpid())) {
				criteria.andCorpidEqualTo(param.getCorpid());
			}
			
			if (StringUtils.isNotEmpty(param.getClassid())) {
				criteria.andClassidEqualTo(param.getClassid());
			}
			
			if (StringUtils.isNotEmpty(param.getState())) {
				criteria.andStateEqualTo(param.getState());
			}
			
			if (StringUtils.isNotEmpty(param.getCode())) {
				criteria.andCodeLike("%"+param.getCode()+"%");
			}
			
			if (StringUtils.isNotEmpty(param.getTitle())) {
				criteria.andTitleLike("%"+param.getTitle()+"%");
			}
		}
	}

	private void proSearchParam(PipePoint param,
			PipePointExample.Criteria criteria) {
		if (param != null) {
			if (param.getId() != null) {
				criteria.andIdEqualTo(param.getId());
			}
			
			if (StringUtils.isNotEmpty(param.getPipeid())){
				criteria.andPipeidEqualTo(param.getPipeid());
			}
		}
	}
	
}
