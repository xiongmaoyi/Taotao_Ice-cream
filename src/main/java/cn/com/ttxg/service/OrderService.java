package cn.com.ttxg.service;

import java.util.List;

import cn.com.ttxg.pojo.Order;
import cn.com.ttxg.pojo.OrderCustom;

public interface OrderService {
	public int insertOrder(Order order);

	public List<OrderCustom> getCompleteOrder(int orderid);



}
