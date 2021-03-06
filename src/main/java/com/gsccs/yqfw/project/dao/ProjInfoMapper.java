package com.gsccs.yqfw.project.dao;

import com.gsccs.yqfw.project.model.ProjInfo;
import com.gsccs.yqfw.project.model.ProjInfoExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ProjInfoMapper {
	/**
	 * This method was generated by MyBatis Generator. This method corresponds
	 * to the database table yqfw_project
	 * 
	 * @mbggenerated Mon Nov 02 11:55:52 CST 2015
	 */
	int countByExample(ProjInfoExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds
	 * to the database table yqfw_project
	 * 
	 * @mbggenerated Mon Nov 02 11:55:52 CST 2015
	 */
	int deleteByExample(ProjInfoExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds
	 * to the database table yqfw_project
	 * 
	 * @mbggenerated Mon Nov 02 11:55:52 CST 2015
	 */
	int deleteByPrimaryKey(String id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds
	 * to the database table yqfw_project
	 * 
	 * @mbggenerated Mon Nov 02 11:55:52 CST 2015
	 */
	int insert(ProjInfo record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds
	 * to the database table yqfw_project
	 * 
	 * @mbggenerated Mon Nov 02 11:55:52 CST 2015
	 */
	int insertSelective(ProjInfo record);

	List<ProjInfo> selectByExample(ProjInfoExample example);

	List<ProjInfo> selectPageByExample(ProjInfoExample example);

	ProjInfo selectByPrimaryKey(String id);

	int updateByExampleSelective(@Param("record") ProjInfo record,
			@Param("example") ProjInfoExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds
	 * to the database table yqfw_project
	 * 
	 * @mbggenerated Mon Nov 02 11:55:52 CST 2015
	 */
	int updateByExample(@Param("record") ProjInfo record,
			@Param("example") ProjInfoExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds
	 * to the database table yqfw_project
	 * 
	 * @mbggenerated Mon Nov 02 11:55:52 CST 2015
	 */
	int updateByPrimaryKeySelective(ProjInfo record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds
	 * to the database table yqfw_project
	 * 
	 * @mbggenerated Mon Nov 02 11:55:52 CST 2015
	 */
	int updateByPrimaryKey(ProjInfo record);
}