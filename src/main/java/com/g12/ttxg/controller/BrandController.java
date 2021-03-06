package com.g12.ttxg.controller;


import com.g12.ttxg.pojo.Brand;
import com.g12.ttxg.service.BrandService;
import com.g12.ttxg.utils.ReturnMsg;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class BrandController {
	
	@Autowired
	private BrandService brandService;
	
	@ResponseBody
	@RequestMapping("showBrandJson")
	public ReturnMsg showBrandJsonByCondition(@RequestParam(value = "pn", defaultValue = "1") Integer pn, String condition, @RequestParam(value = "searchType", defaultValue = "1")int searchType){
	/*	PageInfo<GoodsCustom> page = goodsService.getGoodsCustomsPage(pn, condition, searchType);*/
		List<Brand> brandList = brandService.getBrandsByExample(null);
		return ReturnMsg.success().add("brandList", brandList);	
	}
	
	@ResponseBody
	@RequestMapping(value="showBrandPageByCondition",method= RequestMethod.GET)
	public ReturnMsg showBrandPageByCondition(@RequestParam(value = "pn", defaultValue = "1") Integer pn,String condition,@RequestParam(value = "searchType", defaultValue = "1")int searchType){
		PageInfo<Brand> page = brandService.getBrandPage(pn, condition, searchType);
		return ReturnMsg.success().add("page", page);	
	}
	@ResponseBody
	@RequestMapping(value="addBrand",method=RequestMethod.POST)
	public ReturnMsg addBrand(Brand brand,@RequestParam(value = "pn", defaultValue = "1") Integer pn,String condition,@RequestParam(value = "searchType", defaultValue = "1")int searchType){
		int a = brandService.addBrand(brand);
		PageInfo<Brand> page = brandService.getBrandPage(pn, condition, searchType);
		return ReturnMsg.success().add("page", page);
	}
	
	@ResponseBody
	@RequestMapping("checkBrandName")
	public ReturnMsg checkBrandName(String brandname){
		boolean hasntSameName = brandService.checkBrandName(brandname);
		if(hasntSameName){
			return ReturnMsg.success();
		}else{
			return ReturnMsg.fail();
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="deleteBrandById/{ids}",method=RequestMethod.DELETE)
	public ReturnMsg deleteBrandById(@PathVariable(value="ids") String ids){
		int a;
		if(ids.contains("-")){
			a=brandService.deleteByIds(ids);
		}else {
			a=brandService.deleteById(Integer.parseInt(ids));
		}
		
		return ReturnMsg.success();
	}
	
	@ResponseBody
	@RequestMapping(value="getBrandById/{id}",method=RequestMethod.GET)
	public ReturnMsg getBrandById(@PathVariable("id")Integer id){
			Brand brand = brandService.getBrandById(id);
		return ReturnMsg.success().add("brand", brand);
	}
	@ResponseBody
	@RequestMapping(value="updateBrandById/{brandid}")
	public ReturnMsg updateBrandById(Brand brand){
		int a = brandService.updateBrandById(brand);
		
		return ReturnMsg.success();
		
	}
	
	

}
