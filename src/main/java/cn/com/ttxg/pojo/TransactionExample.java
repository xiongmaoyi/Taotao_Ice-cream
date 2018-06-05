package cn.com.ttxg.pojo;

import java.util.ArrayList;
import java.util.List;

public class TransactionExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public TransactionExample() {
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

        public Criteria andTransactionidIsNull() {
            addCriterion("transactionid is null");
            return (Criteria) this;
        }

        public Criteria andTransactionidIsNotNull() {
            addCriterion("transactionid is not null");
            return (Criteria) this;
        }

        public Criteria andTransactionidEqualTo(Integer value) {
            addCriterion("transactionid =", value, "transactionid");
            return (Criteria) this;
        }

        public Criteria andTransactionidNotEqualTo(Integer value) {
            addCriterion("transactionid <>", value, "transactionid");
            return (Criteria) this;
        }

        public Criteria andTransactionidGreaterThan(Integer value) {
            addCriterion("transactionid >", value, "transactionid");
            return (Criteria) this;
        }

        public Criteria andTransactionidGreaterThanOrEqualTo(Integer value) {
            addCriterion("transactionid >=", value, "transactionid");
            return (Criteria) this;
        }

        public Criteria andTransactionidLessThan(Integer value) {
            addCriterion("transactionid <", value, "transactionid");
            return (Criteria) this;
        }

        public Criteria andTransactionidLessThanOrEqualTo(Integer value) {
            addCriterion("transactionid <=", value, "transactionid");
            return (Criteria) this;
        }

        public Criteria andTransactionidIn(List<Integer> values) {
            addCriterion("transactionid in", values, "transactionid");
            return (Criteria) this;
        }

        public Criteria andTransactionidNotIn(List<Integer> values) {
            addCriterion("transactionid not in", values, "transactionid");
            return (Criteria) this;
        }

        public Criteria andTransactionidBetween(Integer value1, Integer value2) {
            addCriterion("transactionid between", value1, value2, "transactionid");
            return (Criteria) this;
        }

        public Criteria andTransactionidNotBetween(Integer value1, Integer value2) {
            addCriterion("transactionid not between", value1, value2, "transactionid");
            return (Criteria) this;
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

        public Criteria andGoodsnumberIsNull() {
            addCriterion("goodsnumber is null");
            return (Criteria) this;
        }

        public Criteria andGoodsnumberIsNotNull() {
            addCriterion("goodsnumber is not null");
            return (Criteria) this;
        }

        public Criteria andGoodsnumberEqualTo(String value) {
            addCriterion("goodsnumber =", value, "goodsnumber");
            return (Criteria) this;
        }

        public Criteria andGoodsnumberNotEqualTo(String value) {
            addCriterion("goodsnumber <>", value, "goodsnumber");
            return (Criteria) this;
        }

        public Criteria andGoodsnumberGreaterThan(String value) {
            addCriterion("goodsnumber >", value, "goodsnumber");
            return (Criteria) this;
        }

        public Criteria andGoodsnumberGreaterThanOrEqualTo(String value) {
            addCriterion("goodsnumber >=", value, "goodsnumber");
            return (Criteria) this;
        }

        public Criteria andGoodsnumberLessThan(String value) {
            addCriterion("goodsnumber <", value, "goodsnumber");
            return (Criteria) this;
        }

        public Criteria andGoodsnumberLessThanOrEqualTo(String value) {
            addCriterion("goodsnumber <=", value, "goodsnumber");
            return (Criteria) this;
        }

        public Criteria andGoodsnumberLike(String value) {
            addCriterion("goodsnumber like", value, "goodsnumber");
            return (Criteria) this;
        }

        public Criteria andGoodsnumberNotLike(String value) {
            addCriterion("goodsnumber not like", value, "goodsnumber");
            return (Criteria) this;
        }

        public Criteria andGoodsnumberIn(List<String> values) {
            addCriterion("goodsnumber in", values, "goodsnumber");
            return (Criteria) this;
        }

        public Criteria andGoodsnumberNotIn(List<String> values) {
            addCriterion("goodsnumber not in", values, "goodsnumber");
            return (Criteria) this;
        }

        public Criteria andGoodsnumberBetween(String value1, String value2) {
            addCriterion("goodsnumber between", value1, value2, "goodsnumber");
            return (Criteria) this;
        }

        public Criteria andGoodsnumberNotBetween(String value1, String value2) {
            addCriterion("goodsnumber not between", value1, value2, "goodsnumber");
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

        public Criteria andOrderidIsNull() {
            addCriterion("orderid is null");
            return (Criteria) this;
        }

        public Criteria andOrderidIsNotNull() {
            addCriterion("orderid is not null");
            return (Criteria) this;
        }

        public Criteria andOrderidEqualTo(Integer value) {
            addCriterion("orderid =", value, "orderid");
            return (Criteria) this;
        }

        public Criteria andOrderidNotEqualTo(Integer value) {
            addCriterion("orderid <>", value, "orderid");
            return (Criteria) this;
        }

        public Criteria andOrderidGreaterThan(Integer value) {
            addCriterion("orderid >", value, "orderid");
            return (Criteria) this;
        }

        public Criteria andOrderidGreaterThanOrEqualTo(Integer value) {
            addCriterion("orderid >=", value, "orderid");
            return (Criteria) this;
        }

        public Criteria andOrderidLessThan(Integer value) {
            addCriterion("orderid <", value, "orderid");
            return (Criteria) this;
        }

        public Criteria andOrderidLessThanOrEqualTo(Integer value) {
            addCriterion("orderid <=", value, "orderid");
            return (Criteria) this;
        }

        public Criteria andOrderidIn(List<Integer> values) {
            addCriterion("orderid in", values, "orderid");
            return (Criteria) this;
        }

        public Criteria andOrderidNotIn(List<Integer> values) {
            addCriterion("orderid not in", values, "orderid");
            return (Criteria) this;
        }

        public Criteria andOrderidBetween(Integer value1, Integer value2) {
            addCriterion("orderid between", value1, value2, "orderid");
            return (Criteria) this;
        }

        public Criteria andOrderidNotBetween(Integer value1, Integer value2) {
            addCriterion("orderid not between", value1, value2, "orderid");
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