package cn.com.ttxg.service;


import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.ttxg.mapper.OrderMapper;
import cn.com.ttxg.pojo.Order;
import cn.com.ttxg.pojo.OrderCustom;
import cn.com.ttxg.pojo.OrderExample;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderMapper orderMapper;
	
	
	@Override
	public int insertOrder(Order order) {
		Date day=new Date();    

		order.setOrderdate(day);
		order.setState("1");
		int a = orderMapper.insert(order);
		return a;
	}


	@Override
	public List<OrderCustom> getCompleteOrder(int orderid) {
		
		OrderExample example = new OrderExample();
		example.createCriteria().andOrderidEqualTo(orderid);
		
		return orderMapper.selectCompleteOrder(example);
	}


	

}
