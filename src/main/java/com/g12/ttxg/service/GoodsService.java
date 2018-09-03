package com.g12.ttxg.service;


import com.g12.ttxg.pojo.Goods;
import com.g12.ttxg.pojo.GoodsCustom;
import com.github.pagehelper.PageInfo;

public interface GoodsService {
	public PageInfo<GoodsCustom> getGoodsCustomsPage(Integer pn, String condition, int searchType);
	public int deleteByPrimaryKey(Integer goodsid);
	public int insertGoods(Goods record);
	public boolean checkGoodsName(String goodsname);
	public Goods getGoosById(Integer id);
	public int updateGoodsById(Goods record);
	public int deleteByIds(String ids);
}
