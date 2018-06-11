package cn.com.ttxg.pojo;

import java.util.ArrayList;
import java.util.List;

public class InStorehouseExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public InStorehouseExample() {
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

        public Criteria andMessageidIsNull() {
            addCriterion("messageid is null");
            return (Criteria) this;
        }

        public Criteria andMessageidIsNotNull() {
            addCriterion("messageid is not null");
            return (Criteria) this;
        }

        public Criteria andMessageidEqualTo(Integer value) {
            addCriterion("messageid =", value, "messageid");
            return (Criteria) this;
        }

        public Criteria andMessageidNotEqualTo(Integer value) {
            addCriterion("messageid <>", value, "messageid");
            return (Criteria) this;
        }

        public Criteria andMessageidGreaterThan(Integer value) {
            addCriterion("messageid >", value, "messageid");
            return (Criteria) this;
        }

        public Criteria andMessageidGreaterThanOrEqualTo(Integer value) {
            addCriterion("messageid >=", value, "messageid");
            return (Criteria) this;
        }

        public Criteria andMessageidLessThan(Integer value) {
            addCriterion("messageid <", value, "messageid");
            return (Criteria) this;
        }

        public Criteria andMessageidLessThanOrEqualTo(Integer value) {
            addCriterion("messageid <=", value, "messageid");
            return (Criteria) this;
        }

        public Criteria andMessageidIn(List<Integer> values) {
            addCriterion("messageid in", values, "messageid");
            return (Criteria) this;
        }

        public Criteria andMessageidNotIn(List<Integer> values) {
            addCriterion("messageid not in", values, "messageid");
            return (Criteria) this;
        }

        public Criteria andMessageidBetween(Integer value1, Integer value2) {
            addCriterion("messageid between", value1, value2, "messageid");
            return (Criteria) this;
        }

        public Criteria andMessageidNotBetween(Integer value1, Integer value2) {
            addCriterion("messageid not between", value1, value2, "messageid");
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

        public Criteria andGoodscountIsNull() {
            addCriterion("goodscount is null");
            return (Criteria) this;
        }

        public Criteria andGoodscountIsNotNull() {
            addCriterion("goodscount is not null");
            return (Criteria) this;
        }

        public Criteria andGoodscountEqualTo(String value) {
            addCriterion("goodscount =", value, "goodscount");
            return (Criteria) this;
        }

        public Criteria andGoodscountNotEqualTo(String value) {
            addCriterion("goodscount <>", value, "goodscount");
            return (Criteria) this;
        }

        public Criteria andGoodscountGreaterThan(String value) {
            addCriterion("goodscount >", value, "goodscount");
            return (Criteria) this;
        }

        public Criteria andGoodscountGreaterThanOrEqualTo(String value) {
            addCriterion("goodscount >=", value, "goodscount");
            return (Criteria) this;
        }

        public Criteria andGoodscountLessThan(String value) {
            addCriterion("goodscount <", value, "goodscount");
            return (Criteria) this;
        }

        public Criteria andGoodscountLessThanOrEqualTo(String value) {
            addCriterion("goodscount <=", value, "goodscount");
            return (Criteria) this;
        }

        public Criteria andGoodscountLike(String value) {
            addCriterion("goodscount like", value, "goodscount");
            return (Criteria) this;
        }
        
        /**
         * 定制的example---------------------------------------------------------------------------------------
         * @param value
         * @return
         */
        
        public Criteria andGoodsNameLike(String value) {
            addCriterion("goodsname like", value, "goodsname");
            return (Criteria) this;
        }
        
        public Criteria andBrandNameLike(String value) {
            addCriterion("brandname like", value, "brandname");
            return (Criteria) this;
        }
        public Criteria andGoodsidEqualTo(String value) {
            addCriterion("instorehouse.goodsid =", value, "instorehouse.goodsid");
            return (Criteria) this;
        }
        
        
        /**-----------------------------------------------------------------------------------------------------*/

        public Criteria andGoodscountNotLike(String value) {
            addCriterion("goodscount not like", value, "goodscount");
            return (Criteria) this;
        }

        public Criteria andGoodscountIn(List<String> values) {
            addCriterion("goodscount in", values, "goodscount");
            return (Criteria) this;
        }

        public Criteria andGoodscountNotIn(List<String> values) {
            addCriterion("goodscount not in", values, "goodscount");
            return (Criteria) this;
        }

        public Criteria andGoodscountBetween(String value1, String value2) {
            addCriterion("goodscount between", value1, value2, "goodscount");
            return (Criteria) this;
        }

        public Criteria andGoodscountNotBetween(String value1, String value2) {
            addCriterion("goodscount not between", value1, value2, "goodscount");
            return (Criteria) this;
        }

        public Criteria andStorehouseidIsNull() {
            addCriterion("storehouseid is null");
            return (Criteria) this;
        }

        public Criteria andStorehouseidIsNotNull() {
            addCriterion("storehouseid is not null");
            return (Criteria) this;
        }

        public Criteria andStorehouseidEqualTo(Integer value) {
            addCriterion("storehouseid =", value, "storehouseid");
            return (Criteria) this;
        }

        public Criteria andStorehouseidNotEqualTo(Integer value) {
            addCriterion("storehouseid <>", value, "storehouseid");
            return (Criteria) this;
        }

        public Criteria andStorehouseidGreaterThan(Integer value) {
            addCriterion("storehouseid >", value, "storehouseid");
            return (Criteria) this;
        }

        public Criteria andStorehouseidGreaterThanOrEqualTo(Integer value) {
            addCriterion("storehouseid >=", value, "storehouseid");
            return (Criteria) this;
        }

        public Criteria andStorehouseidLessThan(Integer value) {
            addCriterion("storehouseid <", value, "storehouseid");
            return (Criteria) this;
        }

        public Criteria andStorehouseidLessThanOrEqualTo(Integer value) {
            addCriterion("storehouseid <=", value, "storehouseid");
            return (Criteria) this;
        }

        public Criteria andStorehouseidIn(List<Integer> values) {
            addCriterion("storehouseid in", values, "storehouseid");
            return (Criteria) this;
        }

        public Criteria andStorehouseidNotIn(List<Integer> values) {
            addCriterion("storehouseid not in", values, "storehouseid");
            return (Criteria) this;
        }

        public Criteria andStorehouseidBetween(Integer value1, Integer value2) {
            addCriterion("storehouseid between", value1, value2, "storehouseid");
            return (Criteria) this;
        }

        public Criteria andStorehouseidNotBetween(Integer value1, Integer value2) {
            addCriterion("storehouseid not between", value1, value2, "storehouseid");
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