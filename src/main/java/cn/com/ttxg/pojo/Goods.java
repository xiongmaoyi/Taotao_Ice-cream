package cn.com.ttxg.pojo;

import javax.validation.constraints.Pattern;

public class Goods {
    private Integer goodsid;
    @Pattern(regexp="^(?!_)(?!.*?_$)[a-zA-Z0-9_\\u4e00-\\u9fa5]+$",message="服务端：请输入正确的商品名")
    private String goodsname;
    @Pattern(regexp="^(0|[1-9][0-9]{0,9})(\\.[0-9]{1,2})?$",message="服务端：请输入正确的商品单价")
    private String goodsmoney;

    private String goodsremarks;

    private String state;

    private Integer brandid;

    private String goodspng;

    public Integer getGoodsid() {
        return goodsid;
    }

    public void setGoodsid(Integer goodsid) {
        this.goodsid = goodsid;
    }

    public String getGoodsname() {
        return goodsname;
    }

    public void setGoodsname(String goodsname) {
        this.goodsname = goodsname == null ? null : goodsname.trim();
    }

    public String getGoodsmoney() {
        return goodsmoney;
    }

    public void setGoodsmoney(String goodsmoney) {
        this.goodsmoney = goodsmoney == null ? null : goodsmoney.trim();
    }

    public String getGoodsremarks() {
        return goodsremarks;
    }

    public void setGoodsremarks(String goodsremarks) {
        this.goodsremarks = goodsremarks == null ? null : goodsremarks.trim();
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state == null ? null : state.trim();
    }

    public Integer getBrandid() {
        return brandid;
    }

    public void setBrandid(Integer brandid) {
        this.brandid = brandid;
    }

    public String getGoodspng() {
        return goodspng;
    }

    public void setGoodspng(String goodspng) {
        this.goodspng = goodspng == null ? null : goodspng.trim();
    }
}