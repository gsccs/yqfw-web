package com.gsccs.yqfw.corp.dao;

import com.gsccs.yqfw.corp.model.Overproof;
import com.gsccs.yqfw.corp.model.OverproofExample;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface OverproofMapper {
    int countByExample(OverproofExample example);

    int deleteByExample(OverproofExample example);

    int deleteByPrimaryKey(Long id);

    int insert(Overproof record);

    int insertSelective(Overproof record);

    List<Overproof> selectByExample(OverproofExample example);

    Overproof selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") Overproof record, @Param("example") OverproofExample example);

    int updateByExample(@Param("record") Overproof record, @Param("example") OverproofExample example);

    int updateByPrimaryKeySelective(Overproof record);

    int updateByPrimaryKey(Overproof record);
}