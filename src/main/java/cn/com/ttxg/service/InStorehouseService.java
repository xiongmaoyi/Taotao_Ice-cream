package cn.com.ttxg.service;

import java.util.List;

import cn.com.ttxg.pojo.InStorehouseCustom;
import cn.com.ttxg.pojo.InStorehouseExample;

public interface InStorehouseService {
	public List<InStorehouseCustom> getInStorehouseCustoms(InStorehouseExample example);
	
}
