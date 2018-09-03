package com.g12.ttxg.pojo;

public class InStorehouse {
    private Integer messageid;

    private Integer goodsid;

    private String goodscount;

    private Integer storehouseid;

    public Integer getMessageid() {
        return messageid;
    }

    public void setMessageid(Integer messageid) {
        this.messageid = messageid;
    }

    public Integer getGoodsid() {
        return goodsid;
    }

    public void setGoodsid(Integer goodsid) {
        this.goodsid = goodsid;
    }

    public String getGoodscount() {
        return goodscount;
    }

    public void setGoodscount(String goodscount) {
        this.goodscount = goodscount == null ? null : goodscount.trim();
    }

    public Integer getStorehouseid() {
        return storehouseid;
    }

    public void setStorehouseid(Integer storehouseid) {
        this.storehouseid = storehouseid;
    }
}