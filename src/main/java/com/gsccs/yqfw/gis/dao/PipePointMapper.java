package com.gsccs.yqfw.gis.dao;

import com.gsccs.yqfw.gis.model.PipePoint;
import com.gsccs.yqfw.gis.model.PipePointExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface PipePointMapper {
	
	
    int countByExample(PipePointExample example);

    int deleteByExample(PipePointExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(PipePoint record);

    int insertSelective(PipePoint record);

    List<PipePoint> selectByExample(PipePointExample example);
    List<PipePoint> selectPageByExample(PipePointExample example);
    

    PipePoint selectByPrimaryKey(Integer id);
    int updateByExampleSelective(@Param("record") PipePoint record, @Param("example") PipePointExample example);
    int updateByExample(@Param("record") PipePoint record, @Param("example") PipePointExample example);

    int updateByPrimaryKeySelective(PipePoint record);

    int updateByPrimaryKey(PipePoint record);
}