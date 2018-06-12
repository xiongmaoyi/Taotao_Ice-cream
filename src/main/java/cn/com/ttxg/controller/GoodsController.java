package cn.com.ttxg.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import cn.com.ttxg.pojo.GoodsCustom;
import cn.com.ttxg.service.GoodsService;



@Controller
public class GoodsController {
	
	@Autowired
	private GoodsService goodsService;
	
	@ResponseBody
	@RequestMapping("showGoodsJsonByCondition")
	public ReturnMsg showGoodsJsonByCondition(@RequestParam(value = "pn", defaultValue = "1") Integer pn,String condition,@RequestParam(value = "searchType", defaultValue = "1")int searchType){
		PageInfo<GoodsCustom> page = goodsService.getGoodsCustomsPage(pn, condition, searchType);
		
		return ReturnMsg.success().add("page", page);	
		
	}

}
