package cn.com.ttxg.pojo;

import java.util.List;

public class WarehouseCustom extends Warehouse{
    
    
    private List<GoodsCustom> goodsCustomList;

   
	

	public List<GoodsCustom> getGoodsCustomList() {
		return goodsCustomList;
	}

	public void setGoodsCustomList(List<GoodsCustom> goodsCustomList) {
		this.goodsCustomList = goodsCustomList;
	}

	
}