package cn.com.ttxg.service;

import java.util.Date;
import java.util.List;

import com.github.pagehelper.PageInfo;

import cn.com.ttxg.pojo.Order;
import cn.com.ttxg.pojo.OrderCustom;

public interface OrderService {
	public int insertOrder(Order order);

	public List<OrderCustom> getCompleteOrder(int orderid);

	public PageInfo<OrderCustom> getPurchasePage(Integer pn, String condition, int searchType);

	public PageInfo<OrderCustom> getAllOrderPage(Integer pn, String condition, int searchType);

	public PageInfo<OrderCustom> findPageByCondition(Integer pn, String condition, int searchType, Date date_1, Date date_2);

	public int deleteByIds(String ids);

	public int deleteByPrimaryKey(Integer id);

	public int updateByid(Order order);

	public PageInfo<OrderCustom> findPurchase(Integer pn, String condition, int searchType, Date date_1, Date date_2);

	public PageInfo<OrderCustom> findSale(Integer pn, String condition, int searchType, Date date_1, Date date_2);



}
