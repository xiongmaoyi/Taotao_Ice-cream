package cn.com.ttxg.service;

import com.github.pagehelper.PageInfo;

import cn.com.ttxg.pojo.InStorehouseCustom;

public interface InStorehouseService {
	public PageInfo<InStorehouseCustom> getInStorehouseCustomsPage(Integer pn,String condition,int searchType);
	
}
