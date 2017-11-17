package com.gsccs.yqfw.gis.model;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class GisConfExample {
    
    protected String orderByClause;

   
    protected boolean distinct;

    
    protected List<Criteria> oredCriteria;

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table yqfw_gis_conf
     *
     * @mbggenerated Mon Dec 21 14:24:12 CST 2015
     */
    public GisConfExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table yqfw_gis_conf
     *
     * @mbggenerated Mon Dec 21 14:24:12 CST 2015
     */
    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table yqfw_gis_conf
     *
     * @mbggenerated Mon Dec 21 14:24:12 CST 2015
     */
    public String getOrderByClause() {
        return orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table yqfw_gis_conf
     *
     * @mbggenerated Mon Dec 21 14:24:12 CST 2015
     */
    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table yqfw_gis_conf
     *
     * @mbggenerated Mon Dec 21 14:24:12 CST 2015
     */
    public boolean isDistinct() {
        return distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table yqfw_gis_conf
     *
     * @mbggenerated Mon Dec 21 14:24:12 CST 2015
     */
    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table yqfw_gis_conf
     *
     * @mbggenerated Mon Dec 21 14:24:12 CST 2015
     */
    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table yqfw_gis_conf
     *
     * @mbggenerated Mon Dec 21 14:24:12 CST 2015
     */
    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table yqfw_gis_conf
     *
     * @mbggenerated Mon Dec 21 14:24:12 CST 2015
     */
    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table yqfw_gis_conf
     *
     * @mbggenerated Mon Dec 21 14:24:12 CST 2015
     */
    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table yqfw_gis_conf
     *
     * @mbggenerated Mon Dec 21 14:24:12 CST 2015
     */
    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table yqfw_gis_conf
     *
     * @mbggenerated Mon Dec 21 14:24:12 CST 2015
     */
    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andAuthkeyIsNull() {
            addCriterion("authkey is null");
            return (Criteria) this;
        }

        public Criteria andAuthkeyIsNotNull() {
            addCriterion("authkey is not null");
            return (Criteria) this;
        }

        public Criteria andAuthkeyEqualTo(String value) {
            addCriterion("authkey =", value, "authkey");
            return (Criteria) this;
        }

        public Criteria andAuthkeyNotEqualTo(String value) {
            addCriterion("authkey <>", value, "authkey");
            return (Criteria) this;
        }

        public Criteria andAuthkeyGreaterThan(String value) {
            addCriterion("authkey >", value, "authkey");
            return (Criteria) this;
        }

        public Criteria andAuthkeyGreaterThanOrEqualTo(String value) {
            addCriterion("authkey >=", value, "authkey");
            return (Criteria) this;
        }

        public Criteria andAuthkeyLessThan(String value) {
            addCriterion("authkey <", value, "authkey");
            return (Criteria) this;
        }

        public Criteria andAuthkeyLessThanOrEqualTo(String value) {
            addCriterion("authkey <=", value, "authkey");
            return (Criteria) this;
        }

        public Criteria andAuthkeyLike(String value) {
            addCriterion("authkey like", value, "authkey");
            return (Criteria) this;
        }

        public Criteria andAuthkeyNotLike(String value) {
            addCriterion("authkey not like", value, "authkey");
            return (Criteria) this;
        }

        public Criteria andAuthkeyIn(List<String> values) {
            addCriterion("authkey in", values, "authkey");
            return (Criteria) this;
        }

        public Criteria andAuthkeyNotIn(List<String> values) {
            addCriterion("authkey not in", values, "authkey");
            return (Criteria) this;
        }

        public Criteria andAuthkeyBetween(String value1, String value2) {
            addCriterion("authkey between", value1, value2, "authkey");
            return (Criteria) this;
        }

        public Criteria andAuthkeyNotBetween(String value1, String value2) {
            addCriterion("authkey not between", value1, value2, "authkey");
            return (Criteria) this;
        }

        public Criteria andTitleIsNull() {
            addCriterion("title is null");
            return (Criteria) this;
        }

        public Criteria andTitleIsNotNull() {
            addCriterion("title is not null");
            return (Criteria) this;
        }

        public Criteria andTitleEqualTo(String value) {
            addCriterion("title =", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotEqualTo(String value) {
            addCriterion("title <>", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleGreaterThan(String value) {
            addCriterion("title >", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleGreaterThanOrEqualTo(String value) {
            addCriterion("title >=", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleLessThan(String value) {
            addCriterion("title <", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleLessThanOrEqualTo(String value) {
            addCriterion("title <=", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleLike(String value) {
            addCriterion("title like", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotLike(String value) {
            addCriterion("title not like", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleIn(List<String> values) {
            addCriterion("title in", values, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotIn(List<String> values) {
            addCriterion("title not in", values, "title");
            return (Criteria) this;
        }

        public Criteria andTitleBetween(String value1, String value2) {
            addCriterion("title between", value1, value2, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotBetween(String value1, String value2) {
            addCriterion("title not between", value1, value2, "title");
            return (Criteria) this;
        }

        public Criteria andCenterxIsNull() {
            addCriterion("centerx is null");
            return (Criteria) this;
        }

        public Criteria andCenterxIsNotNull() {
            addCriterion("centerx is not null");
            return (Criteria) this;
        }

        public Criteria andCenterxEqualTo(BigDecimal value) {
            addCriterion("centerx =", value, "centerx");
            return (Criteria) this;
        }

        public Criteria andCenterxNotEqualTo(BigDecimal value) {
            addCriterion("centerx <>", value, "centerx");
            return (Criteria) this;
        }

        public Criteria andCenterxGreaterThan(BigDecimal value) {
            addCriterion("centerx >", value, "centerx");
            return (Criteria) this;
        }

        public Criteria andCenterxGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("centerx >=", value, "centerx");
            return (Criteria) this;
        }

        public Criteria andCenterxLessThan(BigDecimal value) {
            addCriterion("centerx <", value, "centerx");
            return (Criteria) this;
        }

        public Criteria andCenterxLessThanOrEqualTo(BigDecimal value) {
            addCriterion("centerx <=", value, "centerx");
            return (Criteria) this;
        }

        public Criteria andCenterxIn(List<BigDecimal> values) {
            addCriterion("centerx in", values, "centerx");
            return (Criteria) this;
        }

        public Criteria andCenterxNotIn(List<BigDecimal> values) {
            addCriterion("centerx not in", values, "centerx");
            return (Criteria) this;
        }

        public Criteria andCenterxBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("centerx between", value1, value2, "centerx");
            return (Criteria) this;
        }

        public Criteria andCenterxNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("centerx not between", value1, value2, "centerx");
            return (Criteria) this;
        }

        public Criteria andCenteryIsNull() {
            addCriterion("centery is null");
            return (Criteria) this;
        }

        public Criteria andCenteryIsNotNull() {
            addCriterion("centery is not null");
            return (Criteria) this;
        }

        public Criteria andCenteryEqualTo(BigDecimal value) {
            addCriterion("centery =", value, "centery");
            return (Criteria) this;
        }

        public Criteria andCenteryNotEqualTo(BigDecimal value) {
            addCriterion("centery <>", value, "centery");
            return (Criteria) this;
        }

        public Criteria andCenteryGreaterThan(BigDecimal value) {
            addCriterion("centery >", value, "centery");
            return (Criteria) this;
        }

        public Criteria andCenteryGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("centery >=", value, "centery");
            return (Criteria) this;
        }

        public Criteria andCenteryLessThan(BigDecimal value) {
            addCriterion("centery <", value, "centery");
            return (Criteria) this;
        }

        public Criteria andCenteryLessThanOrEqualTo(BigDecimal value) {
            addCriterion("centery <=", value, "centery");
            return (Criteria) this;
        }

        public Criteria andCenteryIn(List<BigDecimal> values) {
            addCriterion("centery in", values, "centery");
            return (Criteria) this;
        }

        public Criteria andCenteryNotIn(List<BigDecimal> values) {
            addCriterion("centery not in", values, "centery");
            return (Criteria) this;
        }

        public Criteria andCenteryBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("centery between", value1, value2, "centery");
            return (Criteria) this;
        }

        public Criteria andCenteryNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("centery not between", value1, value2, "centery");
            return (Criteria) this;
        }


        public Criteria andBsswlnglxBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("bsswlng between", value1, value2, "bsswlng");
            return (Criteria) this;
        }

        public Criteria andBsswlngNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("bsswlng not between", value1, value2, "bsswlng");
            return (Criteria) this;
        }

       
        public Criteria andBsswlatBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("bsswlat between", value1, value2, "bsswlat");
            return (Criteria) this;
        }

        public Criteria andBsswlatNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("bsswlat not between", value1, value2, "bsswlat");
            return (Criteria) this;
        }

       

        public Criteria andBsnelngBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("bsnelng between", value1, value2, "bsnelng");
            return (Criteria) this;
        }

        public Criteria andBsnelngNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("bsnelng not between", value1, value2, "bsnelng");
            return (Criteria) this;
        }

        public Criteria andBsnelatBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("bsnelat between", value1, value2, "bsnelat");
            return (Criteria) this;
        }

        public Criteria andBsnelatNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("bsnelat not between", value1, value2, "bsnelat");
            return (Criteria) this;
        }

        public Criteria andCityIsNull() {
            addCriterion("city is null");
            return (Criteria) this;
        }

        public Criteria andCityIsNotNull() {
            addCriterion("city is not null");
            return (Criteria) this;
        }

        public Criteria andCityEqualTo(String value) {
            addCriterion("city =", value, "city");
            return (Criteria) this;
        }

        public Criteria andCityNotEqualTo(String value) {
            addCriterion("city <>", value, "city");
            return (Criteria) this;
        }

        public Criteria andCityGreaterThan(String value) {
            addCriterion("city >", value, "city");
            return (Criteria) this;
        }

        public Criteria andCityGreaterThanOrEqualTo(String value) {
            addCriterion("city >=", value, "city");
            return (Criteria) this;
        }

        public Criteria andCityLessThan(String value) {
            addCriterion("city <", value, "city");
            return (Criteria) this;
        }

        public Criteria andCityLessThanOrEqualTo(String value) {
            addCriterion("city <=", value, "city");
            return (Criteria) this;
        }

        public Criteria andCityLike(String value) {
            addCriterion("city like", value, "city");
            return (Criteria) this;
        }

        public Criteria andCityNotLike(String value) {
            addCriterion("city not like", value, "city");
            return (Criteria) this;
        }

        public Criteria andCityIn(List<String> values) {
            addCriterion("city in", values, "city");
            return (Criteria) this;
        }

        public Criteria andCityNotIn(List<String> values) {
            addCriterion("city not in", values, "city");
            return (Criteria) this;
        }

        public Criteria andCityBetween(String value1, String value2) {
            addCriterion("city between", value1, value2, "city");
            return (Criteria) this;
        }

        public Criteria andCityNotBetween(String value1, String value2) {
            addCriterion("city not between", value1, value2, "city");
            return (Criteria) this;
        }

        public Criteria andRemarkIsNull() {
            addCriterion("remark is null");
            return (Criteria) this;
        }

        public Criteria andRemarkIsNotNull() {
            addCriterion("remark is not null");
            return (Criteria) this;
        }

        public Criteria andRemarkEqualTo(String value) {
            addCriterion("remark =", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkNotEqualTo(String value) {
            addCriterion("remark <>", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkGreaterThan(String value) {
            addCriterion("remark >", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkGreaterThanOrEqualTo(String value) {
            addCriterion("remark >=", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkLessThan(String value) {
            addCriterion("remark <", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkLessThanOrEqualTo(String value) {
            addCriterion("remark <=", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkLike(String value) {
            addCriterion("remark like", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkNotLike(String value) {
            addCriterion("remark not like", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkIn(List<String> values) {
            addCriterion("remark in", values, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkNotIn(List<String> values) {
            addCriterion("remark not in", values, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkBetween(String value1, String value2) {
            addCriterion("remark between", value1, value2, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkNotBetween(String value1, String value2) {
            addCriterion("remark not between", value1, value2, "remark");
            return (Criteria) this;
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table yqfw_gis_conf
     *
     * @mbggenerated do_not_delete_during_merge Mon Dec 21 14:24:12 CST 2015
     */
    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table yqfw_gis_conf
     *
     * @mbggenerated Mon Dec 21 14:24:12 CST 2015
     */
    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}