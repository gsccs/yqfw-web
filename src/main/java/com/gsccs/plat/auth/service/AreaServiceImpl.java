/**
 * 
 */
package com.gsccs.plat.auth.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gsccs.yqfw.gis.dao.AreaMapper;
import com.gsccs.yqfw.gis.model.Area;
import com.gsccs.yqfw.gis.model.AreaExample;

/**
 * @author x.d zhang
 * 
 */
@Service
public class AreaServiceImpl implements AreaService {
	
	@Autowired
	private AreaMapper areaMapper;

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.gsccs.plat.auth.service.AreaService#add(com.gsccs.mall.shop.model
	 * .Area)
	 */
	@Override
	public void add(Area area) {
		if (null != area) {
			areaMapper.insert(area);
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.gsccs.plat.auth.service.AreaService#update(com.gsccs.mall.shop.model
	 * .Area)
	 */
	@Override
	public void update(Area area) {
		if (null != area) {
			areaMapper.updateByPrimaryKey(area);
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.gsccs.plat.auth.service.AreaService#find(com.gsccs.mall.shop.model
	 * .Area)
	 */
	@Override
	public List<Area> find(Area area) {
		AreaExample example = new AreaExample();
		AreaExample.Criteria c = example.createCriteria();
		proSearchParam(area, c);
		return areaMapper.selectByExample(example);
	}

	@Override
	public Area findById(String id) {
		/*if (StringUtils.isNotEmpty(id)) {
			return areaMapper.selectByPrimaryKey(Integer.valueOf(id));
		}*/
		return null;
	}

	/**
	 * 查询条件
	 * 
	 * @param orders
	 * @param sid
	 * @param criteria
	 */
	private void proSearchParam(Area area, AreaExample.Criteria criteria) {
		if (area != null) {
			if (null != area.getParentid()) {
				criteria.andParentidEqualTo(area.getParentid());
			}

			if (null != area.getLevel()) {
				criteria.andLevelEqualTo(area.getLevel());
			}

			if (null != area.getCode()) {
				criteria.andCodeEqualTo(area.getCode());
			}

		}
	}
}
