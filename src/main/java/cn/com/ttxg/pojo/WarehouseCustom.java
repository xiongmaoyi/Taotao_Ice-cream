package cn.com.ttxg.pojo;

import java.util.List;

public class WarehouseCustom {
    private Integer warehousegoodsid;

    private Integer goodsid;

    private String goodscount;
    
    private List<GoodsCustom> goodsCustomList;

   
	

	public List<GoodsCustom> getGoodsCustomList() {
		return goodsCustomList;
	}

	public void setGoodsCustomList(List<GoodsCustom> goodsCustomList) {
		this.goodsCustomList = goodsCustomList;
	}

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