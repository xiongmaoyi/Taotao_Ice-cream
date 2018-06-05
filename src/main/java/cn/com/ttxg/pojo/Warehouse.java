package cn.com.ttxg.pojo;

public class Warehouse {
    private Integer warehousegoodsid;

    private Integer goodsid;

    private String goodscount;

    public Integer getWarehousegoodsid() {
        return warehousegoodsid;
    }

    public void setWarehousegoodsid(Integer warehousegoodsid) {
        this.warehousegoodsid = warehousegoodsid;
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
}