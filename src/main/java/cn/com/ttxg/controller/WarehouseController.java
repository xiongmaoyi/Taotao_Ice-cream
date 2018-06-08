package cn.com.ttxg.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.com.ttxg.mapper.WarehouseMapper;
import cn.com.ttxg.pojo.WarehouseCustom;

@Controller
public class WarehouseController{

	@Autowired
	private WarehouseMapper warehouseMapper;
	
	@RequestMapping("showAllWarehouse.action")
	public ModelAndView selectAll() throws Exception {
		
	
		List<WarehouseCustom> warehouseCustoms = warehouseMapper.selectByExampleWithGoodsAndBrand(null);
		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("warehouseCustoms",warehouseCustoms);
		modelAndView.setViewName("/ShowWarehouse.jsp");
		
		return modelAndView;
	}

}
