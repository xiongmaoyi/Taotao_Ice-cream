package cn.com.ttxg.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.ttxg.pojo.Order;
import cn.com.ttxg.pojo.OrderCustom;
import cn.com.ttxg.service.OrderService;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	@ResponseBody
	@RequestMapping(value="insertOrder",method=RequestMethod.POST)
	public ReturnMsg insertOrder(Order order) {
		orderService.insertOrder(order);
		int orderid = order.getOrderid();
		return ReturnMsg.success().add("orderid", orderid);
	}
	
	@ResponseBody
	@RequestMapping(value="findOrderById",method=RequestMethod.GET)
	public ReturnMsg findOrderById(int orderid) {
		
		List<OrderCustom> orderCustoms = orderService.getCompleteOrder(orderid);
		
		return ReturnMsg.success().add("orderCustoms", orderCustoms);
	}
	
	
	

}
