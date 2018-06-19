package cn.com.ttxg.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import cn.com.ttxg.pojo.Brand;
import cn.com.ttxg.pojo.GoodsCustom;
import cn.com.ttxg.service.BrandService;
import cn.com.ttxg.service.GoodsService;



@Controller
public class BrandController {
	
	@Autowired
	private BrandService brandService;
	
	@ResponseBody
	@RequestMapping("showBrandJson")
	public ReturnMsg showBrandJsonByCondition(@RequestParam(value = "pn", defaultValue = "1") Integer pn,String condition,@RequestParam(value = "searchType", defaultValue = "1")int searchType){
	/*	PageInfo<GoodsCustom> page = goodsService.getGoodsCustomsPage(pn, condition, searchType);*/
		List<Brand> brandList = brandService.getBrandsByExample(null);
		return ReturnMsg.success().add("brandList", brandList);	
		
	}
	
/*	@ResponseBody
	@RequestMapping("deleteGoodsById")
	public ReturnMsg deleteGoodsById(@RequestParam(value = "pn", defaultValue = "1") Integer pn,String condition,@RequestParam(value = "searchType", defaultValue = "1")int searchType,int goodsid){
		
		//删除成功返回1删除失败返回0
		int a = goodsService.deleteByPrimaryKey(goodsid);
		
		PageInfo<GoodsCustom> page = goodsService.getGoodsCustomsPage(pn, condition, searchType);
		
		return ReturnMsg.success().add("page", page);	
		
	}*/
	
	

}
