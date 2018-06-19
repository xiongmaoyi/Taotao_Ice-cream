package cn.com.ttxg.controller;

import static org.hamcrest.CoreMatchers.nullValue;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import cn.com.ttxg.pojo.Goods;
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
	
	@ResponseBody
	@RequestMapping(value="addGoods",method=RequestMethod.POST)
	public ReturnMsg addGoods(@RequestParam(value = "pn", defaultValue = "1") Integer pn,String condition,@RequestParam(value = "searchType", defaultValue = "1")int searchType,@Valid Goods goods,BindingResult result){
		
		if(result.hasErrors()){
			List<FieldError> errors = result.getFieldErrors();
			Map<String, Object> map = new HashMap<String, Object>();
			for(FieldError fieldError:errors){
				//错误字段名 getfiledid   错误信息 getdefaultmessage
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return ReturnMsg.fail().add("errorMap", map);
		}else {
			int a;
			a =  goodsService.insertGoods(goods);
			
			PageInfo<GoodsCustom> page = goodsService.getGoodsCustomsPage(pn, condition, searchType);	
			return ReturnMsg.success().add("page", page);
		}
		
	}
	/**
	 * 1-2-3批量删除
	 * 
	 * @param ids
	 * @return
	 */
	
	@ResponseBody
	@RequestMapping(value="deleteGoodsById/{ids}",method=RequestMethod.DELETE)
	public ReturnMsg deleteGoodsById(@PathVariable("ids") String ids){
		//判断字符串是否含有 -
		if(ids.contains("-")){
			goodsService.deleteByIds(ids);		
			return ReturnMsg.success();
		}else{
			//删除成功返回1删除失败返回0
			Integer id = Integer.parseInt(ids);
			goodsService.deleteByPrimaryKey(id);
			return ReturnMsg.success();	
		}
		
		
		
	}
	
	@ResponseBody
	@RequestMapping("checkGoodsName")
	public ReturnMsg checkGoodsName(String goodsname){
		boolean hasntSameName = goodsService.checkGoodsName(goodsname);
		if(hasntSameName){
			return ReturnMsg.success();
		}else {
			return ReturnMsg.fail();
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="getGoodsById/{id}",method=RequestMethod.GET)
	public ReturnMsg getGoodsById(@PathVariable("id") Integer id){
		Goods goods = goodsService.getGoosById(id);
		
		return ReturnMsg.success().add("goods", goods);
	}
	
	
	@ResponseBody
	@RequestMapping(value="updateGoodsById/{goodsid}",method=RequestMethod.PUT)
	public ReturnMsg updateGoodsById(@PathVariable("goodsid") Integer id,Goods goods){
		int a = goodsService.updateGoodsById(goods);
		
		return ReturnMsg.success();
	}

}
