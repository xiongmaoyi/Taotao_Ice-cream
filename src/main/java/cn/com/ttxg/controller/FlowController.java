package cn.com.ttxg.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.com.ttxg.pojo.Flow;
import cn.com.ttxg.pojo.FlowCustom;
import cn.com.ttxg.service.FlowService;

@Controller
public class FlowController {
	
	@Autowired
	private FlowService flowService;
	
	
	@ResponseBody
	@RequestMapping(value="insertFlows",method=RequestMethod.POST)
	public ReturnMsg insertFlows(@RequestBody List<Flow> flowList) {
		
		int a = flowService.insertFlows(flowList);
		
		return ReturnMsg.success();
	}
	
	
	@ResponseBody
	@RequestMapping(value="toPurchaseMsg",method=RequestMethod.POST)
	public ReturnMsg toPurchaseMsg(@RequestBody List<FlowCustom> flowList,HttpServletRequest request) {
		System.out.println("*************************************************************************************");
		System.out.println("我的老嘎，就注册在这个屯"+flowList);
		System.out.println("*************************************************************************************");

		return ReturnMsg.success().add("flowList", flowList);
	}

}
