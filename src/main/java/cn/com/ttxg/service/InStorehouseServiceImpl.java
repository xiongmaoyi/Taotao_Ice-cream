package cn.com.ttxg.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.ttxg.mapper.InStorehouseMapper;
import cn.com.ttxg.pojo.InStorehouseCustom;
import cn.com.ttxg.pojo.InStorehouseExample;

@Service
public class InStorehouseServiceImpl implements InStorehouseService {

	@Autowired
	private InStorehouseMapper inStorehouseMapper;
	
	

	@Override
	public List<InStorehouseCustom> getInStorehouseCustoms(InStorehouseExample example) {
		return inStorehouseMapper.selectWithGoodsAndBrandByExample(example);
	}
	
	
	

}
