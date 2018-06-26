package cn.com.ttxg.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import cn.com.ttxg.pojo.InStorehouseCustom;
import cn.com.ttxg.service.InStorehouseService;

@Controller
public class InStorehouseController {
	
	@Autowired
	private InStorehouseService inStorehouseService;
	
	
	
	
	@RequestMapping("inStorehouseJsonByCondition")
	@ResponseBody
	public ReturnMsg showWarehoseJsonByName(@RequestParam(value = "pn", defaultValue = "1") Integer pn,String condition,@RequestParam(value = "searchType", defaultValue = "1")int searchType) {
		
		
		
		PageInfo<InStorehouseCustom> page = inStorehouseService.getInStorehouseCustomsPage(pn, condition, searchType);
		
		return ReturnMsg.success().add("page", page);

	}

}
