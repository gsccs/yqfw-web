package com.gsccs.yqfw.corp.model;

import java.util.ArrayList;
import java.util.List;

public class OverproofExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public OverproofExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

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

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Long value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Long value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Long value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Long value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Long value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Long value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Long> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Long> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Long value1, Long value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Long value1, Long value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andCompanyidIsNull() {
            addCriterion("companyid is null");
            return (Criteria) this;
        }

        public Criteria andCompanyidIsNotNull() {
            addCriterion("companyid is not null");
            return (Criteria) this;
        }

        public Criteria andCompanyidEqualTo(Long value) {
            addCriterion("companyid =", value, "companyid");
            return (Criteria) this;
        }

        public Criteria andCompanyidNotEqualTo(Long value) {
            addCriterion("companyid <>", value, "companyid");
            return (Criteria) this;
        }

        public Criteria andCompanyidGreaterThan(Long value) {
            addCriterion("companyid >", value, "companyid");
            return (Criteria) this;
        }

        public Criteria andCompanyidGreaterThanOrEqualTo(Long value) {
            addCriterion("companyid >=", value, "companyid");
            return (Criteria) this;
        }

        public Criteria andCompanyidLessThan(Long value) {
            addCriterion("companyid <", value, "companyid");
            return (Criteria) this;
        }

        public Criteria andCompanyidLessThanOrEqualTo(Long value) {
            addCriterion("companyid <=", value, "companyid");
            return (Criteria) this;
        }

        public Criteria andCompanyidIn(List<Long> values) {
            addCriterion("companyid in", values, "companyid");
            return (Criteria) this;
        }

        public Criteria andCompanyidNotIn(List<Long> values) {
            addCriterion("companyid not in", values, "companyid");
            return (Criteria) this;
        }

        public Criteria andCompanyidBetween(Long value1, Long value2) {
            addCriterion("companyid between", value1, value2, "companyid");
            return (Criteria) this;
        }

        public Criteria andCompanyidNotBetween(Long value1, Long value2) {
            addCriterion("companyid not between", value1, value2, "companyid");
            return (Criteria) this;
        }

        public Criteria andNameIsNull() {
            addCriterion("name is null");
            return (Criteria) this;
        }

        public Criteria andNameIsNotNull() {
            addCriterion("name is not null");
            return (Criteria) this;
        }

        public Criteria andNameEqualTo(String value) {
            addCriterion("name =", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotEqualTo(String value) {
            addCriterion("name <>", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameGreaterThan(String value) {
            addCriterion("name >", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameGreaterThanOrEqualTo(String value) {
            addCriterion("name >=", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLessThan(String value) {
            addCriterion("name <", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLessThanOrEqualTo(String value) {
            addCriterion("name <=", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLike(String value) {
            addCriterion("name like", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotLike(String value) {
            addCriterion("name not like", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameIn(List<String> values) {
            addCriterion("name in", values, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotIn(List<String> values) {
            addCriterion("name not in", values, "name");
            return (Criteria) this;
        }

        public Criteria andNameBetween(String value1, String value2) {
            addCriterion("name between", value1, value2, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotBetween(String value1, String value2) {
            addCriterion("name not between", value1, value2, "name");
            return (Criteria) this;
        }

        public Criteria andOverproofvalueIsNull() {
            addCriterion("overproofvalue is null");
            return (Criteria) this;
        }

        public Criteria andOverproofvalueIsNotNull() {
            addCriterion("overproofvalue is not null");
            return (Criteria) this;
        }

        public Criteria andOverproofvalueEqualTo(String value) {
            addCriterion("overproofvalue =", value, "overproofvalue");
            return (Criteria) this;
        }

        public Criteria andOverproofvalueNotEqualTo(String value) {
            addCriterion("overproofvalue <>", value, "overproofvalue");
            return (Criteria) this;
        }

        public Criteria andOverproofvalueGreaterThan(String value) {
            addCriterion("overproofvalue >", value, "overproofvalue");
            return (Criteria) this;
        }

        public Criteria andOverproofvalueGreaterThanOrEqualTo(String value) {
            addCriterion("overproofvalue >=", value, "overproofvalue");
            return (Criteria) this;
        }

        public Criteria andOverproofvalueLessThan(String value) {
            addCriterion("overproofvalue <", value, "overproofvalue");
            return (Criteria) this;
        }

        public Criteria andOverproofvalueLessThanOrEqualTo(String value) {
            addCriterion("overproofvalue <=", value, "overproofvalue");
            return (Criteria) this;
        }

        public Criteria andOverproofvalueLike(String value) {
            addCriterion("overproofvalue like", value, "overproofvalue");
            return (Criteria) this;
        }

        public Criteria andOverproofvalueNotLike(String value) {
            addCriterion("overproofvalue not like", value, "overproofvalue");
            return (Criteria) this;
        }

        public Criteria andOverproofvalueIn(List<String> values) {
            addCriterion("overproofvalue in", values, "overproofvalue");
            return (Criteria) this;
        }

        public Criteria andOverproofvalueNotIn(List<String> values) {
            addCriterion("overproofvalue not in", values, "overproofvalue");
            return (Criteria) this;
        }

        public Criteria andOverproofvalueBetween(String value1, String value2) {
            addCriterion("overproofvalue between", value1, value2, "overproofvalue");
            return (Criteria) this;
        }

        public Criteria andOverproofvalueNotBetween(String value1, String value2) {
            addCriterion("overproofvalue not between", value1, value2, "overproofvalue");
            return (Criteria) this;
        }

        public Criteria andStandardvalueIsNull() {
            addCriterion("standardvalue is null");
            return (Criteria) this;
        }

        public Criteria andStandardvalueIsNotNull() {
            addCriterion("standardvalue is not null");
            return (Criteria) this;
        }

        public Criteria andStandardvalueEqualTo(String value) {
            addCriterion("standardvalue =", value, "standardvalue");
            return (Criteria) this;
        }

        public Criteria andStandardvalueNotEqualTo(String value) {
            addCriterion("standardvalue <>", value, "standardvalue");
            return (Criteria) this;
        }

        public Criteria andStandardvalueGreaterThan(String value) {
            addCriterion("standardvalue >", value, "standardvalue");
            return (Criteria) this;
        }

        public Criteria andStandardvalueGreaterThanOrEqualTo(String value) {
            addCriterion("standardvalue >=", value, "standardvalue");
            return (Criteria) this;
        }

        public Criteria andStandardvalueLessThan(String value) {
            addCriterion("standardvalue <", value, "standardvalue");
            return (Criteria) this;
        }

        public Criteria andStandardvalueLessThanOrEqualTo(String value) {
            addCriterion("standardvalue <=", value, "standardvalue");
            return (Criteria) this;
        }

        public Criteria andStandardvalueLike(String value) {
            addCriterion("standardvalue like", value, "standardvalue");
            return (Criteria) this;
        }

        public Criteria andStandardvalueNotLike(String value) {
            addCriterion("standardvalue not like", value, "standardvalue");
            return (Criteria) this;
        }

        public Criteria andStandardvalueIn(List<String> values) {
            addCriterion("standardvalue in", values, "standardvalue");
            return (Criteria) this;
        }

        public Criteria andStandardvalueNotIn(List<String> values) {
            addCriterion("standardvalue not in", values, "standardvalue");
            return (Criteria) this;
        }

        public Criteria andStandardvalueBetween(String value1, String value2) {
            addCriterion("standardvalue between", value1, value2, "standardvalue");
            return (Criteria) this;
        }

        public Criteria andStandardvalueNotBetween(String value1, String value2) {
            addCriterion("standardvalue not between", value1, value2, "standardvalue");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

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