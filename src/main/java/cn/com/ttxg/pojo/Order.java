package cn.com.ttxg.pojo;

import java.util.Date;

public class Order {
    private Integer orderid;

    private String ordertype;

    private String ordermoney;

    private String orderremarks;

    private Date orderdate;

    private String orderstate;

    private Integer userid;

    private String state;

    private String delivery;

    private String custom;

    public Integer getOrderid() {
        return orderid;
    }

    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }

    public String getOrdertype() {
        return ordertype;
    }

    public void setOrdertype(String ordertype) {
        this.ordertype = ordertype == null ? null : ordertype.trim();
    }

    public String getOrdermoney() {
        return ordermoney;
    }

    public void setOrdermoney(String ordermoney) {
        this.ordermoney = ordermoney == null ? null : ordermoney.trim();
    }

    public String getOrderremarks() {
        return orderremarks;
    }

    public void setOrderremarks(String orderremarks) {
        this.orderremarks = orderremarks == null ? null : orderremarks.trim();
    }

    public Date getOrderdate() {
        return orderdate;
    }

    public void setOrderdate(Date orderdate) {
        this.orderdate = orderdate;
    }

    public String getOrderstate() {
        return orderstate;
    }

    public void setOrderstate(String orderstate) {
        this.orderstate = orderstate == null ? null : orderstate.trim();
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state == null ? null : state.trim();
    }

    public String getDelivery() {
        return delivery;
    }

    public void setDelivery(String delivery) {
        this.delivery = delivery == null ? null : delivery.trim();
    }

    public String getCustom() {
        return custom;
    }

    public void setCustom(String custom) {
        this.custom = custom == null ? null : custom.trim();
    }
}