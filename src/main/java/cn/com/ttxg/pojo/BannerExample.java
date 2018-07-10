package cn.com.ttxg.pojo;

import java.util.ArrayList;
import java.util.List;

public class BannerExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public BannerExample() {
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

        public Criteria andBanneridIsNull() {
            addCriterion("bannerid is null");
            return (Criteria) this;
        }

        public Criteria andBanneridIsNotNull() {
            addCriterion("bannerid is not null");
            return (Criteria) this;
        }

        public Criteria andBanneridEqualTo(Integer value) {
            addCriterion("bannerid =", value, "bannerid");
            return (Criteria) this;
        }

        public Criteria andBanneridNotEqualTo(Integer value) {
            addCriterion("bannerid <>", value, "bannerid");
            return (Criteria) this;
        }

        public Criteria andBanneridGreaterThan(Integer value) {
            addCriterion("bannerid >", value, "bannerid");
            return (Criteria) this;
        }

        public Criteria andBanneridGreaterThanOrEqualTo(Integer value) {
            addCriterion("bannerid >=", value, "bannerid");
            return (Criteria) this;
        }

        public Criteria andBanneridLessThan(Integer value) {
            addCriterion("bannerid <", value, "bannerid");
            return (Criteria) this;
        }

        public Criteria andBanneridLessThanOrEqualTo(Integer value) {
            addCriterion("bannerid <=", value, "bannerid");
            return (Criteria) this;
        }

        public Criteria andBanneridIn(List<Integer> values) {
            addCriterion("bannerid in", values, "bannerid");
            return (Criteria) this;
        }

        public Criteria andBanneridNotIn(List<Integer> values) {
            addCriterion("bannerid not in", values, "bannerid");
            return (Criteria) this;
        }

        public Criteria andBanneridBetween(Integer value1, Integer value2) {
            addCriterion("bannerid between", value1, value2, "bannerid");
            return (Criteria) this;
        }

        public Criteria andBanneridNotBetween(Integer value1, Integer value2) {
            addCriterion("bannerid not between", value1, value2, "bannerid");
            return (Criteria) this;
        }

        public Criteria andImageIsNull() {
            addCriterion("image is null");
            return (Criteria) this;
        }

        public Criteria andImageIsNotNull() {
            addCriterion("image is not null");
            return (Criteria) this;
        }

        public Criteria andImageEqualTo(String value) {
            addCriterion("image =", value, "image");
            return (Criteria) this;
        }

        public Criteria andImageNotEqualTo(String value) {
            addCriterion("image <>", value, "image");
            return (Criteria) this;
        }

        public Criteria andImageGreaterThan(String value) {
            addCriterion("image >", value, "image");
            return (Criteria) this;
        }

        public Criteria andImageGreaterThanOrEqualTo(String value) {
            addCriterion("image >=", value, "image");
            return (Criteria) this;
        }

        public Criteria andImageLessThan(String value) {
            addCriterion("image <", value, "image");
            return (Criteria) this;
        }

        public Criteria andImageLessThanOrEqualTo(String value) {
            addCriterion("image <=", value, "image");
            return (Criteria) this;
        }

        public Criteria andImageLike(String value) {
            addCriterion("image like", value, "image");
            return (Criteria) this;
        }

        public Criteria andImageNotLike(String value) {
            addCriterion("image not like", value, "image");
            return (Criteria) this;
        }

        public Criteria andImageIn(List<String> values) {
            addCriterion("image in", values, "image");
            return (Criteria) this;
        }

        public Criteria andImageNotIn(List<String> values) {
            addCriterion("image not in", values, "image");
            return (Criteria) this;
        }

        public Criteria andImageBetween(String value1, String value2) {
            addCriterion("image between", value1, value2, "image");
            return (Criteria) this;
        }

        public Criteria andImageNotBetween(String value1, String value2) {
            addCriterion("image not between", value1, value2, "image");
            return (Criteria) this;
        }

        public Criteria andOptionbanIsNull() {
            addCriterion("optionban is null");
            return (Criteria) this;
        }

        public Criteria andOptionbanIsNotNull() {
            addCriterion("optionban is not null");
            return (Criteria) this;
        }

        public Criteria andOptionbanEqualTo(Integer value) {
            addCriterion("optionban =", value, "optionban");
            return (Criteria) this;
        }

        public Criteria andOptionbanNotEqualTo(Integer value) {
            addCriterion("optionban <>", value, "optionban");
            return (Criteria) this;
        }

        public Criteria andOptionbanGreaterThan(Integer value) {
            addCriterion("optionban >", value, "optionban");
            return (Criteria) this;
        }

        public Criteria andOptionbanGreaterThanOrEqualTo(Integer value) {
            addCriterion("optionban >=", value, "optionban");
            return (Criteria) this;
        }

        public Criteria andOptionbanLessThan(Integer value) {
            addCriterion("optionban <", value, "optionban");
            return (Criteria) this;
        }

        public Criteria andOptionbanLessThanOrEqualTo(Integer value) {
            addCriterion("optionban <=", value, "optionban");
            return (Criteria) this;
        }

        public Criteria andOptionbanIn(List<Integer> values) {
            addCriterion("optionban in", values, "optionban");
            return (Criteria) this;
        }

        public Criteria andOptionbanNotIn(List<Integer> values) {
            addCriterion("optionban not in", values, "optionban");
            return (Criteria) this;
        }

        public Criteria andOptionbanBetween(Integer value1, Integer value2) {
            addCriterion("optionban between", value1, value2, "optionban");
            return (Criteria) this;
        }

        public Criteria andOptionbanNotBetween(Integer value1, Integer value2) {
            addCriterion("optionban not between", value1, value2, "optionban");
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