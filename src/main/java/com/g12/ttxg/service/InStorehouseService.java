package com.g12.ttxg.service;


import com.g12.ttxg.pojo.InStorehouseCustom;
import com.github.pagehelper.PageInfo;

public interface InStorehouseService {
	public PageInfo<InStorehouseCustom> getInStorehouseCustomsPage(Integer pn, String condition, int searchType);
}
