package com.gsccs.yqfw.gis.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gsccs.yqfw.gis.model.Area;
import com.gsccs.yqfw.gis.model.AreaExample;

public interface AreaMapper {

	int countByExample(AreaExample example);

	int deleteByExample(AreaExample example);

	int deleteByPrimaryKey(Integer id);

	int insert(Area record);

	int insertSelective(Area record);

	List<Area> selectByExample(AreaExample example);

	List<Area> selectPageByExample(AreaExample example);

	Area selectByPrimaryKey(Integer id);

	int updateByExample(@Param("record") Area record,
			@Param("example") AreaExample example);

	int updateByPrimaryKey(Area record);

	/* 查询出所有省份&直辖市 */
	List<Area> getByParId(Integer parentid);

}