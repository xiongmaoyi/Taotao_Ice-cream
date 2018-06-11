package cn.com.ttxg.service;

import java.util.List;

import cn.com.ttxg.pojo.Warehouse;
import cn.com.ttxg.pojo.WarehouseCustom;
import cn.com.ttxg.pojo.WarehouseExample;


public interface WarehouseService {
	List<WarehouseCustom> getWarehouses();
	List<WarehouseCustom> getWarehousesByName(WarehouseExample example);

}
