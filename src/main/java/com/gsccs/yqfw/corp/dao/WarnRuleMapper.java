package com.gsccs.yqfw.corp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gsccs.yqfw.corp.model.WarnRule;
import com.gsccs.yqfw.corp.model.WarnRuleExample;

public interface WarnRuleMapper {
    
    int countByExample(WarnRuleExample example);
    int deleteByExample(WarnRuleExample example);
    int deleteByPrimaryKey(String id);
    int insert(WarnRule record);
    int insertSelective(WarnRule record);

    List<WarnRule> selectByExample(WarnRuleExample example);
    List<WarnRule> selectPageByExample(WarnRuleExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table yqfw_warn_rule
     *
     * @mbggenerated Wed Oct 21 11:39:56 CST 2015
     */
    WarnRule selectByPrimaryKey(String id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table yqfw_warn_rule
     *
     * @mbggenerated Wed Oct 21 11:39:56 CST 2015
     */
    int updateByExampleSelective(@Param("record") WarnRule record, @Param("example") WarnRuleExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table yqfw_warn_rule
     *
     * @mbggenerated Wed Oct 21 11:39:56 CST 2015
     */
    int updateByExample(@Param("record") WarnRule record, @Param("example") WarnRuleExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table yqfw_warn_rule
     *
     * @mbggenerated Wed Oct 21 11:39:56 CST 2015
     */
    int updateByPrimaryKeySelective(WarnRule record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table yqfw_warn_rule
     *
     * @mbggenerated Wed Oct 21 11:39:56 CST 2015
     */
    int updateByPrimaryKey(WarnRule record);
}