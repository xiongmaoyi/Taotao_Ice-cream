package cn.com.ttxg.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.druid.sql.ast.statement.SQLIfStatement.Else;
import com.alibaba.druid.util.StringUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.com.ttxg.pojo.InStorehouseCustom;
import cn.com.ttxg.pojo.InStorehouseExample;
import cn.com.ttxg.pojo.WarehouseCustom;
import cn.com.ttxg.pojo.WarehouseExample;
import cn.com.ttxg.service.InStorehouseService;

@Controller
public class InStorehouseController {
	
	@Autowired
	private InStorehouseService InStorehouseService;
	
	
	@RequestMapping("inStorehouseJson")
	@ResponseBody
	public ReturnMsg showWarehoseJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		/*InStorehouseExample example = new InStorehouseExample();*/
		/*example.createCriteria().andGoodsnameEqualTo("%老%");*/
		// 从pn页开始查，每页显示5个数据，start后面紧跟的查询就是分页查询
		PageHelper.startPage(pn, 5);
		List<InStorehouseCustom> inStorehouseCustoms = InStorehouseService.getInStorehouseCustoms(null);
		// 封装为page，并设定每次连续显示5页
		PageInfo<InStorehouseCustom> page = new PageInfo<InStorehouseCustom>(inStorehouseCustoms, 5);
		
		return ReturnMsg.success().add("page", page);

	}
	
	@RequestMapping("inStorehouseJsonByCondition")
	@ResponseBody
	public ReturnMsg showWarehoseJsonByName(@RequestParam(value = "pn", defaultValue = "1") Integer pn,String condition,@RequestParam(value = "searchType", defaultValue = "1")int searchType) {
		InStorehouseExample example = new InStorehouseExample();
		//条件不为空的时候在example中插入条件
		if(!StringUtils.isEmpty(condition)){
			if(searchType==1){
				example.createCriteria().andGoodsNameLike("%"+condition+"%");
			}else if(searchType==2){
				example.createCriteria().andGoodsidEqualTo(condition);
			}else if(searchType==3){
				example.createCriteria().andBrandNameLike("%"+condition+"%");
			}
			
		}
		
		// 从pn页开始查，每页显示5个数据，start后面紧跟的查询就是分页查询
		PageHelper.startPage(pn, 5);
		List<InStorehouseCustom> inStorehouseCustoms = InStorehouseService.getInStorehouseCustoms(example);
		// 封装为page，并设定每次连续显示5页
		PageInfo<InStorehouseCustom> page = new PageInfo<InStorehouseCustom>(inStorehouseCustoms, 5);
		
		return ReturnMsg.success().add("page", page);

	}

}
