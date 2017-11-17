package com.gsccs.yqfw.gis.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gsccs.yqfw.gis.dao.LandInfoMapper;
import com.gsccs.yqfw.gis.dao.LandPointMapper;
import com.gsccs.yqfw.gis.model.GisConf;
import com.gsccs.yqfw.gis.model.LandInfo;
import com.gsccs.yqfw.gis.model.LandInfoExample;
import com.gsccs.yqfw.gis.model.LandPoint;
import com.gsccs.yqfw.gis.model.LandPointExample;

@Service("landService")
public class LandServiceImpl implements LandService {

	@Autowired
	private LandInfoMapper landInfoMapper;
	@Autowired
	private LandPointMapper landPointMapper;
	@Autowired
	private GisConfService gisConfService;

	@Override
	public void addLandInfo(LandInfo landInfo) {
		if (null != landInfo) {
			landInfo.setId(UUID.randomUUID().toString());
			//landInfo.setPoints(initPoints());
			landInfoMapper.insert(landInfo);
		}
	}

	
	public List<LandPoint> initPoints() {
			List<LandPoint> points = new ArrayList<>();
			GisConf gisConf = gisConfService.getDefaultGisConf();
			
			Random random = new Random();
			float lng_random = random.nextFloat();
			float lat_random = random.nextFloat();
			//左上角
			LandPoint point_lt = new LandPoint();
			point_lt.setLng(gisConf.getCenterx()-lng_random/100);
			point_lt.setLat(gisConf.getCentery()+lat_random/100);
			points.add(point_lt);
			//右上角
			LandPoint point_rt = new LandPoint();
			point_rt.setLng(gisConf.getCenterx()+lng_random/100);
			point_rt.setLat(gisConf.getCentery()+lat_random/100);
			points.add(point_rt);
			//右下角
			LandPoint point_rb = new LandPoint();
			point_rb.setLng(gisConf.getCenterx()+lng_random/100);
			point_rb.setLat(gisConf.getCentery()-lat_random/100);
			points.add(point_rb);
			
			//左下角
			LandPoint point_lb = new LandPoint();
			point_lb.setLng(gisConf.getCenterx()-lng_random/100);
			point_lb.setLat(gisConf.getCentery()-lat_random/100);
			points.add(point_lb);
		return points;
	}
	
	@Override
	public void updateLandInfo(LandInfo landInfo) {
		if (null != landInfo) {
			landInfoMapper.updateByPrimaryKey(landInfo);
		}
	}

	@Override
	public LandInfo getLandInfo(String id) {
		return landInfoMapper.selectByPrimaryKey(id);
	}

	@Override
	public void addLandPoints(String landid, List<LandPoint> landPoints) {
		if (null != landPoints && landPoints.size() > 0) {
			landid = landPoints.get(0).getLandid();
			if (StringUtils.isNotEmpty(landid)) {
				LandPointExample example = new LandPointExample();
				LandPointExample.Criteria c = example.createCriteria();
				c.andLandidEqualTo(landid);
				landPointMapper.deleteByExample(example);
			}
			int i = 0;
			for (LandPoint point : landPoints) {
				if (StringUtils.isNotEmpty(point.getLandid())) {
					point.setId(UUID.randomUUID().toString());
					point.setOrdernum(i);
					landPointMapper.insert(point);
					i++;
				}
			}
		}
	}

	@Override
	public List<LandPoint> getLandPoints(String landinfoid) {
		LandPointExample example = new LandPointExample();
		LandPointExample.Criteria c = example.createCriteria();
		c.andLandidEqualTo(landinfoid);
		example.setOrderByClause(" ordernum ");
		List<LandPoint> list = landPointMapper.selectByExample(example);
		if (null == list || list.size()<=0){
			list = initPoints();
		}
		return list;
	}

	@Override
	public void delLandInfo(String id) {
		LandPointExample example = new LandPointExample();
		LandPointExample.Criteria c = example.createCriteria();
		c.andLandidEqualTo(id);
		
		//删除土地地理数据
		landPointMapper.deleteByExample(example);
		
		landInfoMapper.deleteByPrimaryKey(id);
	}

	@Override
	public List<LandInfo> find(LandInfo param, String orderstr, int page,
			int pagesize) {
		LandInfoExample example = new LandInfoExample();
		LandInfoExample.Criteria c = example.createCriteria();
		proSearchParam(param, c);
		example.setCurrPage(page);
		example.setPageSize(pagesize);
		if (StringUtils.isNotEmpty(orderstr)) {
			example.setOrderByClause(orderstr);
		}
		return landInfoMapper.selectPageByExample(example);
	}

	@Override
	public Integer countLandInfo(LandInfo param) {
		LandInfoExample example = new LandInfoExample();
		LandInfoExample.Criteria c = example.createCriteria();
		proSearchParam(param, c);
		return landInfoMapper.countByExample(example);
	}

	@Override
	public List<LandPoint> find(LandPoint param, String orderstr, int page,
			int pagesize) {
		LandPointExample example = new LandPointExample();
		LandPointExample.Criteria c = example.createCriteria();
		proSearchParam(param, c);
		example.setCurrPage(page);
		example.setPageSize(pagesize);
		return landPointMapper.selectPageByExample(example);
	}

	private void proSearchParam(LandPoint param,
			LandPointExample.Criteria criteria) {
		if (param != null) {
			if (param.getId() != null) {
				criteria.andIdEqualTo(param.getId());
			}
		}
	}

	private void proSearchParam(LandInfo param,
			LandInfoExample.Criteria criteria) {
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
				criteria.andCodeLike("%" + param.getCode() + "%");
			}

			if (StringUtils.isNotEmpty(param.getTitle())) {
				criteria.andTitleLike("%" + param.getTitle() + "%");
			}
		}

	}

}
