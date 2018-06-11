package cn.com.ttxg.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.ttxg.mapper.WarehouseMapper;
import cn.com.ttxg.pojo.WarehouseCustom;
import cn.com.ttxg.pojo.WarehouseExample;

@Service
public class WarehouseServiceImpl implements WarehouseService {

	@Autowired
	private WarehouseMapper warehouseMapper;
	
	public List<WarehouseCustom> getWarehouses() {
		return warehouseMapper.selectByExampleWithGoodsAndBrand(null);
	}

	@Override
	public List<WarehouseCustom> getWarehousesByName(WarehouseExample example) {
		// TODO Auto-generated method stub
		return warehouseMapper.selectByExampleWithGoodsAndBrand(example);
	}

	

}
