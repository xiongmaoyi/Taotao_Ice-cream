package com.g12.ttxg.controller;


import com.g12.ttxg.pojo.Flow;
import com.g12.ttxg.pojo.FlowCustom;
import com.g12.ttxg.service.FlowService;
import com.g12.ttxg.utils.ReturnMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class FlowController {
	
	@Autowired
	private FlowService flowService;
	
	
	@ResponseBody
	@RequestMapping(value="insertFlows",method= RequestMethod.POST)
	public ReturnMsg insertFlows(@RequestBody List<Flow> flowList) {
		
		int a = flowService.insertFlows(flowList);
		
		return ReturnMsg.success();
	}
	
	
	@ResponseBody
	@RequestMapping(value="toPurchaseMsg",method=RequestMethod.POST)
	public ReturnMsg toPurchaseMsg(@RequestBody List<FlowCustom> flowList, HttpServletRequest request){

		return ReturnMsg.success().add("flowList", flowList);
	}

}
