package cn.com.ttxg.pojo;

public class Goods {
    private Integer goodsid;

    private String goodsname;

    private String goodsmoney;

    private String goodsremarks;

    private String state;

    private Integer brandid;

    private String goodspng;

    private String marketprice;

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

    public String getMarketprice() {
        return marketprice;
    }

    public void setMarketprice(String marketprice) {
        this.marketprice = marketprice == null ? null : marketprice.trim();
    }
}