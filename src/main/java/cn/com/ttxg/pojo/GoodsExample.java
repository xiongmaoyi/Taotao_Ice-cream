package cn.com.ttxg.pojo;

import java.util.ArrayList;
import java.util.List;

//用于添加条件，相当where后面的部分 
//xxxExample example = new xxxExample(); 
//Criteria criteria = new Example().createCriteria();
public class GoodsExample {
	
	
	
	//example.setOrderByClause(“字段名 ASC”);	添加升序排列条件，DESC为降序
    protected String orderByClause;
    //example.setDistinct(false)	去除重复，boolean型，true为选择不重复的记录。
    protected boolean distinct;
    //
    protected List<Criteria> oredCriteria;

    public GoodsExample() {
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

        public Criteria andGoodsidIsNull() {
            addCriterion("goodsid is null");
            return (Criteria) this;
        }

        public Criteria andGoodsidIsNotNull() {
            addCriterion("goodsid is not null");
            return (Criteria) this;
        }

        public Criteria andGoodsidEqualTo(Integer value) {
            addCriterion("goodsid =", value, "goodsid");
            return (Criteria) this;
        }

        public Criteria andGoodsidNotEqualTo(Integer value) {
            addCriterion("goodsid <>", value, "goodsid");
            return (Criteria) this;
        }

        public Criteria andGoodsidGreaterThan(Integer value) {
            addCriterion("goodsid >", value, "goodsid");
            return (Criteria) this;
        }

        public Criteria andGoodsidGreaterThanOrEqualTo(Integer value) {
            addCriterion("goodsid >=", value, "goodsid");
            return (Criteria) this;
        }

        public Criteria andGoodsidLessThan(Integer value) {
            addCriterion("goodsid <", value, "goodsid");
            return (Criteria) this;
        }

        public Criteria andGoodsidLessThanOrEqualTo(Integer value) {
            addCriterion("goodsid <=", value, "goodsid");
            return (Criteria) this;
        }

        public Criteria andGoodsidIn(List<Integer> values) {
            addCriterion("goodsid in", values, "goodsid");
            return (Criteria) this;
        }

        public Criteria andGoodsidNotIn(List<Integer> values) {
            addCriterion("goodsid not in", values, "goodsid");
            return (Criteria) this;
        }

        public Criteria andGoodsidBetween(Integer value1, Integer value2) {
            addCriterion("goodsid between", value1, value2, "goodsid");
            return (Criteria) this;
        }

        public Criteria andGoodsidNotBetween(Integer value1, Integer value2) {
            addCriterion("goodsid not between", value1, value2, "goodsid");
            return (Criteria) this;
        }

        public Criteria andGoodsnameIsNull() {
            addCriterion("goodsname is null");
            return (Criteria) this;
        }

        public Criteria andGoodsnameIsNotNull() {
            addCriterion("goodsname is not null");
            return (Criteria) this;
        }

        public Criteria andGoodsnameEqualTo(String value) {
            addCriterion("goodsname =", value, "goodsname");
            return (Criteria) this;
        }

        public Criteria andGoodsnameNotEqualTo(String value) {
            addCriterion("goodsname <>", value, "goodsname");
            return (Criteria) this;
        }

        public Criteria andGoodsnameGreaterThan(String value) {
            addCriterion("goodsname >", value, "goodsname");
            return (Criteria) this;
        }

        public Criteria andGoodsnameGreaterThanOrEqualTo(String value) {
            addCriterion("goodsname >=", value, "goodsname");
            return (Criteria) this;
        }

        public Criteria andGoodsnameLessThan(String value) {
            addCriterion("goodsname <", value, "goodsname");
            return (Criteria) this;
        }

        public Criteria andGoodsnameLessThanOrEqualTo(String value) {
            addCriterion("goodsname <=", value, "goodsname");
            return (Criteria) this;
        }

        public Criteria andGoodsnameLike(String value) {
            addCriterion("goodsname like", value, "goodsname");
            return (Criteria) this;
        }

        public Criteria andGoodsnameNotLike(String value) {
            addCriterion("goodsname not like", value, "goodsname");
            return (Criteria) this;
        }

        public Criteria andGoodsnameIn(List<String> values) {
            addCriterion("goodsname in", values, "goodsname");
            return (Criteria) this;
        }

        public Criteria andGoodsnameNotIn(List<String> values) {
            addCriterion("goodsname not in", values, "goodsname");
            return (Criteria) this;
        }

        public Criteria andGoodsnameBetween(String value1, String value2) {
            addCriterion("goodsname between", value1, value2, "goodsname");
            return (Criteria) this;
        }

        public Criteria andGoodsnameNotBetween(String value1, String value2) {
            addCriterion("goodsname not between", value1, value2, "goodsname");
            return (Criteria) this;
        }

        public Criteria andGoodsmoneyIsNull() {
            addCriterion("goodsmoney is null");
            return (Criteria) this;
        }

        public Criteria andGoodsmoneyIsNotNull() {
            addCriterion("goodsmoney is not null");
            return (Criteria) this;
        }

        public Criteria andGoodsmoneyEqualTo(String value) {
            addCriterion("goodsmoney =", value, "goodsmoney");
            return (Criteria) this;
        }

        public Criteria andGoodsmoneyNotEqualTo(String value) {
            addCriterion("goodsmoney <>", value, "goodsmoney");
            return (Criteria) this;
        }

        public Criteria andGoodsmoneyGreaterThan(String value) {
            addCriterion("goodsmoney >", value, "goodsmoney");
            return (Criteria) this;
        }

        public Criteria andGoodsmoneyGreaterThanOrEqualTo(String value) {
            addCriterion("goodsmoney >=", value, "goodsmoney");
            return (Criteria) this;
        }

        public Criteria andGoodsmoneyLessThan(String value) {
            addCriterion("goodsmoney <", value, "goodsmoney");
            return (Criteria) this;
        }

        public Criteria andGoodsmoneyLessThanOrEqualTo(String value) {
            addCriterion("goodsmoney <=", value, "goodsmoney");
            return (Criteria) this;
        }

        public Criteria andGoodsmoneyLike(String value) {
            addCriterion("goodsmoney like", value, "goodsmoney");
            return (Criteria) this;
        }

        public Criteria andGoodsmoneyNotLike(String value) {
            addCriterion("goodsmoney not like", value, "goodsmoney");
            return (Criteria) this;
        }

        public Criteria andGoodsmoneyIn(List<String> values) {
            addCriterion("goodsmoney in", values, "goodsmoney");
            return (Criteria) this;
        }

        public Criteria andGoodsmoneyNotIn(List<String> values) {
            addCriterion("goodsmoney not in", values, "goodsmoney");
            return (Criteria) this;
        }

        public Criteria andGoodsmoneyBetween(String value1, String value2) {
            addCriterion("goodsmoney between", value1, value2, "goodsmoney");
            return (Criteria) this;
        }

        public Criteria andGoodsmoneyNotBetween(String value1, String value2) {
            addCriterion("goodsmoney not between", value1, value2, "goodsmoney");
            return (Criteria) this;
        }

        public Criteria andGoodsremarksIsNull() {
            addCriterion("goodsremarks is null");
            return (Criteria) this;
        }

        public Criteria andGoodsremarksIsNotNull() {
            addCriterion("goodsremarks is not null");
            return (Criteria) this;
        }

        public Criteria andGoodsremarksEqualTo(String value) {
            addCriterion("goodsremarks =", value, "goodsremarks");
            return (Criteria) this;
        }

        public Criteria andGoodsremarksNotEqualTo(String value) {
            addCriterion("goodsremarks <>", value, "goodsremarks");
            return (Criteria) this;
        }

        public Criteria andGoodsremarksGreaterThan(String value) {
            addCriterion("goodsremarks >", value, "goodsremarks");
            return (Criteria) this;
        }

        public Criteria andGoodsremarksGreaterThanOrEqualTo(String value) {
            addCriterion("goodsremarks >=", value, "goodsremarks");
            return (Criteria) this;
        }

        public Criteria andGoodsremarksLessThan(String value) {
            addCriterion("goodsremarks <", value, "goodsremarks");
            return (Criteria) this;
        }

        public Criteria andGoodsremarksLessThanOrEqualTo(String value) {
            addCriterion("goodsremarks <=", value, "goodsremarks");
            return (Criteria) this;
        }

        public Criteria andGoodsremarksLike(String value) {
            addCriterion("goodsremarks like", value, "goodsremarks");
            return (Criteria) this;
        }

        public Criteria andGoodsremarksNotLike(String value) {
            addCriterion("goodsremarks not like", value, "goodsremarks");
            return (Criteria) this;
        }

        public Criteria andGoodsremarksIn(List<String> values) {
            addCriterion("goodsremarks in", values, "goodsremarks");
            return (Criteria) this;
        }

        public Criteria andGoodsremarksNotIn(List<String> values) {
            addCriterion("goodsremarks not in", values, "goodsremarks");
            return (Criteria) this;
        }

        public Criteria andGoodsremarksBetween(String value1, String value2) {
            addCriterion("goodsremarks between", value1, value2, "goodsremarks");
            return (Criteria) this;
        }

        public Criteria andGoodsremarksNotBetween(String value1, String value2) {
            addCriterion("goodsremarks not between", value1, value2, "goodsremarks");
            return (Criteria) this;
        }

        public Criteria andStateIsNull() {
            addCriterion("state is null");
            return (Criteria) this;
        }

        public Criteria andStateIsNotNull() {
            addCriterion("state is not null");
            return (Criteria) this;
        }

        public Criteria andStateEqualTo(String value) {
            addCriterion("state =", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateNotEqualTo(String value) {
            addCriterion("state <>", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateGreaterThan(String value) {
            addCriterion("state >", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateGreaterThanOrEqualTo(String value) {
            addCriterion("state >=", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateLessThan(String value) {
            addCriterion("state <", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateLessThanOrEqualTo(String value) {
            addCriterion("state <=", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateLike(String value) {
            addCriterion("state like", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateNotLike(String value) {
            addCriterion("state not like", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateIn(List<String> values) {
            addCriterion("state in", values, "state");
            return (Criteria) this;
        }

        public Criteria andStateNotIn(List<String> values) {
            addCriterion("state not in", values, "state");
            return (Criteria) this;
        }

        public Criteria andStateBetween(String value1, String value2) {
            addCriterion("state between", value1, value2, "state");
            return (Criteria) this;
        }

        public Criteria andStateNotBetween(String value1, String value2) {
            addCriterion("state not between", value1, value2, "state");
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


/*
方法	说明
example.setOrderByClause(“字段名 ASC”);	添加升序排列条件，DESC为降序
example.setDistinct(false)	去除重复，boolean型，true为选择不重复的记录。
criteria.andXxxIsNull	添加字段xxx为null的条件
criteria.andXxxIsNotNull	添加字段xxx不为null的条件
criteria.andXxxEqualTo(value)	添加xxx字段等于value条件
criteria.andXxxNotEqualTo(value)	添加xxx字段不等于value条件
criteria.andXxxGreaterThan(value)	添加xxx字段大于value条件
criteria.andXxxGreaterThanOrEqualTo(value)	添加xxx字段大于等于value条件
criteria.andXxxLessThan(value)	添加xxx字段小于value条件
criteria.andXxxLessThanOrEqualTo(value)	添加xxx字段小于等于value条件
criteria.andXxxIn(List<？>)	添加xxx字段值在List<？>条件
criteria.andXxxNotIn(List<？>)	添加xxx字段值不在List<？>条件
criteria.andXxxLike(“%”+value+”%”)	添加xxx字段值为value的模糊查询条件
criteria.andXxxNotLike(“%”+value+”%”)	添加xxx字段值不为value的模糊查询条件
criteria.andXxxBetween(value1,value2)	添加xxx字段值在value1和value2之间条件
criteria.andXxxNotBetween(value1,value2)	添加xxx字段值不在value1和value2之间条件
*/