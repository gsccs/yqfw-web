package com.gsccs.yqfw.corp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gsccs.yqfw.corp.model.MonitorVal;
import com.gsccs.yqfw.corp.model.MonitorValExample;

public interface MonitorValMapper {
    int countByExample(MonitorValExample example);

    int deleteByExample(MonitorValExample example);

    int deleteByPrimaryKey(String id);

    int insert(MonitorVal record);

    int insertSelective(MonitorVal record);

    List<MonitorVal> selectOverData(@Param("skip") int skip,@Param("pageSize") int pageSize);
    List<MonitorVal> selectByExample(MonitorValExample example);
    List<MonitorVal> selectPageByExample(MonitorValExample example);
    List<MonitorVal> selectCorpMonitVals(String corpid);
    
    MonitorVal selectByPrimaryKey(String id);
    int updateByExampleSelective(@Param("record") MonitorVal record, @Param("example") MonitorValExample example);
    int updateByExample(@Param("record") MonitorVal record, @Param("example") MonitorValExample example);
    int updateByPrimaryKeySelective(MonitorVal record);
    int updateByPrimaryKey(MonitorVal record);
}