package cn.com.ttxg.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.com.ttxg.mapper.WarehouseMapper;
import cn.com.ttxg.pojo.WarehouseCustom;
import cn.com.ttxg.pojo.WarehouseExample;
import cn.com.ttxg.service.WarehouseService;

@Controller
public class WarehouseController {

	@Autowired
	private WarehouseService warehouseService;

	/*@RequestMapping("showAllWarehouse.action")
	public ModelAndView showWarehouses(@RequestParam(value = "pn", defaultValue = "1") Integer pn) throws Exception {

		// 从pn页开始查，每页显示5个数据，start后面紧跟的查询就是分页查询
		PageHelper.startPage(pn, 5);
		List<WarehouseCustom> warehouseCustoms = warehouseService.getWarehouses();
		// 封装为page，并设定每次连续显示5页
		PageInfo<WarehouseCustom> page = new PageInfo<WarehouseCustom>(warehouseCustoms, 5);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("page", page);
		modelAndView.setViewName("ShowWarehouse");

		return modelAndView;
	}*/

	@RequestMapping("warehouseJson")
	@ResponseBody
	public ReturnMsg showWarehoseJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {

		// 从pn页开始查，每页显示5个数据，start后面紧跟的查询就是分页查询
		PageHelper.startPage(pn, 5);
		List<WarehouseCustom> warehouseCustoms = warehouseService.getWarehouses();
		// 封装为page，并设定每次连续显示5页
		PageInfo<WarehouseCustom> page = new PageInfo<WarehouseCustom>(warehouseCustoms, 5);
		return ReturnMsg.success().add("page", page);

	}
	@RequestMapping("warehouseJsonByName")
	@ResponseBody
	public ReturnMsg showWarehoseJsonByName(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		WarehouseExample example = new WarehouseExample();
		example.createCriteria().andGoodsnameEqualTo("%老%");
		// 从pn页开始查，每页显示5个数据，start后面紧跟的查询就是分页查询
		PageHelper.startPage(pn, 5);
		List<WarehouseCustom> warehouseCustoms = warehouseService.getWarehousesByName(example);
		// 封装为page，并设定每次连续显示5页
		PageInfo<WarehouseCustom> page = new PageInfo<WarehouseCustom>(warehouseCustoms, 5);
		
		return ReturnMsg.success().add("page", page);

	}
	
	

}
