package com.g12.ttxg.pojo;

public class InStorehouseCustom extends InStorehouse {
    private GoodsCustom goodsCustom;
    private Storehouse storehouse;
	public GoodsCustom getGoodsCustom() {
		return goodsCustom;
	}
	public void setGoodsCustom(GoodsCustom goodsCustom) {
		this.goodsCustom = goodsCustom;
	}
	public Storehouse getStorehouse() {
		return storehouse;
	}
	public void setStorehouse(Storehouse storehouse) {
		this.storehouse = storehouse;
	}
}