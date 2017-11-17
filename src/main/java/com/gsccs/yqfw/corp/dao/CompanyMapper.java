package com.gsccs.yqfw.corp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gsccs.yqfw.corp.model.Company;
import com.gsccs.yqfw.corp.model.CompanyExample;

public interface CompanyMapper {
	int countByExample(CompanyExample example);

	int deleteByExample(CompanyExample example);

	int deleteByPrimaryKey(String id);

	int insert(Company record);

	int insertSelective(Company record);

	List<Company> selectByExample(CompanyExample example);

	List<Company> selectPageByExample(CompanyExample example);

	Company selectByPrimaryKey(String id);

	int updateByExampleSelective(@Param("record") Company record,
			@Param("example") CompanyExample example);

	int updateByExample(@Param("record") Company record,
			@Param("example") CompanyExample example);

	int updateByPrimaryKeySelective(Company record);

	int updateByPrimaryKey(Company record);
}