package cn.com.ttxg.service;

import com.github.pagehelper.PageInfo;

import cn.com.ttxg.pojo.Goods;
import cn.com.ttxg.pojo.GoodsCustom;

public interface GoodsService {
	public PageInfo<GoodsCustom> getGoodsCustomsPage(Integer pn,String condition,int searchType);
	public int deleteByPrimaryKey(Integer goodsid);
	public int insertGoods(Goods record);
	public boolean checkGoodsName(String goodsname);
	public Goods getGoosById(Integer id);
	public int updateGoodsById(Goods record);
	public int deleteByIds(String ids);
}
