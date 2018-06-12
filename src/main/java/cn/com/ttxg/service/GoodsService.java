package cn.com.ttxg.service;

import com.github.pagehelper.PageInfo;

import cn.com.ttxg.pojo.GoodsCustom;

public interface GoodsService {
	public PageInfo<GoodsCustom> getGoodsCustomsPage(Integer pn,String condition,int searchType);
	
}
