package cn.com.ttxg.pojo;

public class Transaction {
    private Integer transactionid;

    private Integer goodsid;

    private String goodsnumber;

    private String goodsmoney;

    private Integer orderid;

    private String state;

    public Integer getTransactionid() {
        return transactionid;
    }

    public void setTransactionid(Integer transactionid) {
        this.transactionid = transactionid;
    }

    public Integer getGoodsid() {
        return goodsid;
    }

    public void setGoodsid(Integer goodsid) {
        this.goodsid = goodsid;
    }

    public String getGoodsnumber() {
        return goodsnumber;
    }

    public void setGoodsnumber(String goodsnumber) {
        this.goodsnumber = goodsnumber == null ? null : goodsnumber.trim();
    }

    public String getGoodsmoney() {
        return goodsmoney;
    }

    public void setGoodsmoney(String goodsmoney) {
        this.goodsmoney = goodsmoney == null ? null : goodsmoney.trim();
    }

    public Integer getOrderid() {
        return orderid;
    }

    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state == null ? null : state.trim();
    }
}