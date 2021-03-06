package com.g12.ttxg.controller;


import com.g12.ttxg.pojo.Order;
import com.g12.ttxg.pojo.OrderCustom;
import com.g12.ttxg.service.OrderService;
import com.g12.ttxg.utils.ReturnMsg;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;

	@ResponseBody
	@RequestMapping(value = "insertOrder", method = RequestMethod.POST)
	public ReturnMsg insertOrder(Order order) {
		orderService.insertOrder(order);
		int orderid = order.getOrderid();
		System.out.println("orderid----------------------------------------------------->>>>>>"+orderid);
		return ReturnMsg.success().add("orderid", orderid);
	}

	/**
	 * 根据id获得详细订单信息
	 * 
	 * @param orderid
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "findOrderById", method = RequestMethod.GET)
	public ReturnMsg findOrderById(int orderid) {

		List<OrderCustom> orderCustoms = orderService.getCompleteOrder(orderid);

		return ReturnMsg.success().add("orderCustoms", orderCustoms);
	}

	@ResponseBody
	@RequestMapping(value = "findPurchasePage", method = RequestMethod.GET)
	public ReturnMsg findPurchase(@RequestParam(value = "pn", defaultValue = "1") Integer pn, String condition,
								  String date1, String date2, @RequestParam(value = "searchType", defaultValue = "1") int searchType)
			throws ParseException {
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");

		Date date_1 = null, date_2 = null;

		try {
			if (date1 == null) {
				date_1 = sf.parse("1999-1-1");
			} else {
				date_1 = sf.parse(date1);
			}
			if (date2 == null) {
				date_2 = sf.parse("2500-1-1");
			} else {
				date_2 = sf.parse(date2);
			}
		} catch (ParseException e) {
			e.printStackTrace();
			// 抛出异常之后默认搜索所有
			date_1 = sf.parse("1999-1-1");
			date_2 = sf.parse("2500-1-1");
		}

		PageInfo<OrderCustom> page = orderService.findPurchase(pn, condition, searchType, date_1, date_2);
		return ReturnMsg.success().add("page", page);
	}

	@ResponseBody
	@RequestMapping(value = "findSalePage", method = RequestMethod.GET)
	public ReturnMsg findSale(@RequestParam(value = "pn", defaultValue = "1") Integer pn, String condition,String date1, String date2, @RequestParam(value = "searchType", defaultValue = "1") int searchType) throws ParseException {
		
	
		
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		Date date_1 = null, date_2 = null;

		try {
			if (date1 == null) {
				date_1 = sf.parse("1999-1-1");
			} else {
				date_1 = sf.parse(date1);
			}
			if (date2 == null) {
				date_2 = sf.parse("2500-1-1");
			} else {
				date_2 = sf.parse(date2);
			}
		} catch (ParseException e) {
			e.printStackTrace();
			// 抛出异常之后默认搜索所有
			date_1 = sf.parse("1999-1-1");
			date_2 = sf.parse("2500-1-1");
		}

		PageInfo<OrderCustom> page = orderService.findSale(pn, condition, searchType, date_1, date_2);
		return ReturnMsg.success().add("page", page);
	}

	/**
	 * 获得详细订单信息
	 * 
	 * @param pn
	 * @param condition
	 * @param searchType
	 * @return
	 */

	@ResponseBody
	@RequestMapping(value = "findAllOrder", method = RequestMethod.GET)
	public ReturnMsg getAllOrder(@RequestParam(value = "pn", defaultValue = "1") Integer pn, String condition,
			@RequestParam(value = "searchType", defaultValue = "1") int searchType) {

		PageInfo<OrderCustom> page = orderService.getAllOrderPage(pn, condition, searchType);
		return ReturnMsg.success().add("page", page);

	}

	/**
	 * 获得简单的订单信息
	 * 
	 * @param pn
	 * @param condition
	 * @param date1
	 * @param date2
	 * @param searchType
	 * @return
	 * @throws ParseException
	 */

	@ResponseBody
	@RequestMapping(value = "findOrderByCondition", method = RequestMethod.GET)
	public ReturnMsg findOrderByCondition(@RequestParam(value = "pn", defaultValue = "1") Integer pn, String condition,
			String date1, String date2, @RequestParam(value = "searchType", defaultValue = "1") int searchType)
			throws ParseException {
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");

		Date date_1 = null, date_2 = null;

		try {
			if (date1 == null) {
				date_1 = sf.parse("1999-1-1");
			} else {
				date_1 = sf.parse(date1);
			}
			if (date2 == null) {
				date_2 = sf.parse("2500-1-1");
			} else {
				date_2 = sf.parse(date2);
			}
		} catch (ParseException e) {
			e.printStackTrace();
			// 抛出异常之后默认搜索所有
			date_1 = sf.parse("1999-1-1");
			date_2 = sf.parse("2500-1-1");
		}

		PageInfo<OrderCustom> page = orderService.findPageByCondition(pn, condition, searchType, date_1, date_2);
		return ReturnMsg.success().add("page", page);

	}

	@ResponseBody
	@RequestMapping(value = "deleteOrderById/{ids}", method = RequestMethod.DELETE)
	public ReturnMsg deleteOrderById(@PathVariable("ids") String ids) {
		// 判断字符串是否含有 -
		if (ids.contains("-")) {
			orderService.deleteByIds(ids);
			return ReturnMsg.success();
		} else {
			// 删除成功返回1删除失败返回0
			Integer id = Integer.parseInt(ids);
			orderService.deleteByPrimaryKey(id);
			return ReturnMsg.success();
		}

	}

	@ResponseBody
	@RequestMapping(value = "updateOrderById/{orderid}", method = RequestMethod.PUT)
	public ReturnMsg updateOrderById(@PathVariable("orderid") Integer id, Order order) {
		int a = orderService.updateByid(order);
		return ReturnMsg.success();

	}
	
	@ResponseBody
	@RequestMapping(value = "findMaxOrderId", method = RequestMethod.GET)
	public ReturnMsg findMaxOrderId() {
		int maxOrderId = orderService.getMaxId();
		return ReturnMsg.success().add("maxOrderId", maxOrderId);
	}
	
	
	
	@ResponseBody
	@RequestMapping(value = "findUnDeliverOrderByCondition", method = RequestMethod.GET)
	public ReturnMsg findUnDeliverOrderByCondition(@RequestParam(value = "pn", defaultValue = "1") Integer pn, String condition,
			String date1, String date2, @RequestParam(value = "searchType", defaultValue = "1") int searchType)
			throws ParseException {
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");

		Date date_1 = null, date_2 = null;

		try {
			if (date1 == null) {
				date_1 = sf.parse("1999-1-1");
			} else {
				date_1 = sf.parse(date1);
			}
			if (date2 == null) {
				date_2 = sf.parse("2500-1-1");
			} else {
				date_2 = sf.parse(date2);
			}
		} catch (ParseException e) {
			e.printStackTrace();
			// 抛出异常之后默认搜索所有
			date_1 = sf.parse("1999-1-1");
			date_2 = sf.parse("2500-1-1");
		}

		PageInfo<OrderCustom> page = orderService.findUnDeliverPageByCondition(pn, condition, searchType, date_1, date_2);
		return ReturnMsg.success().add("page", page);

	}
	
	
	
	//获取送货员接单信息
	@ResponseBody
	@RequestMapping(value = "findOrderByDelivery", method = RequestMethod.GET)
	public ReturnMsg findOrderByDelivery(@RequestParam(value = "pn", defaultValue = "1") Integer pn, String condition,
			String date1, String date2, @RequestParam(value = "searchType", defaultValue = "1") int searchType,String delivery)
			throws ParseException {
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");

		Date date_1 = null, date_2 = null;

		try {
			if (date1 == null) {
				date_1 = sf.parse("1999-1-1");
			} else {
				date_1 = sf.parse(date1);
			}
			if (date2 == null) {
				date_2 = sf.parse("2500-1-1");
			} else {
				date_2 = sf.parse(date2);
			}
		} catch (ParseException e) {
			e.printStackTrace();
			// 抛出异常之后默认搜索所有
			date_1 = sf.parse("1999-1-1");
			date_2 = sf.parse("2500-1-1");
		}

		PageInfo<OrderCustom> page = orderService.findPageByDelivery(pn, condition, searchType, date_1, date_2,delivery);
		return ReturnMsg.success().add("page", page);

	}
	//填充订单送货人
	@ResponseBody
	@RequestMapping(value = "takeOrderById/{orderid}/{delivery}", method = RequestMethod.PUT)
	public ReturnMsg takeOrderById(Order order) {
		System.out.println("uuuuuuuuuuuupppppppppppppppppppp"+order.getDelivery());
		order.setOrderstate("2");
		int a = orderService.updateByid(order);
		return ReturnMsg.success();

	}
	//更改订单状态为已完成
		@ResponseBody
		@RequestMapping(value = "finishOrderById/{orderid}", method = RequestMethod.PUT)
		public ReturnMsg finishOrderById(Order order) {
			order.setOrderstate("3");
			int a = orderService.updateByid(order);
			return ReturnMsg.success();

		}
	//总统计(总支出，总收入，总单量)
		@ResponseBody
		@RequestMapping(value = "findThreeTotal", method = RequestMethod.GET)
		public ReturnMsg findThreeTotal(Order order) {
			List<Map<String, Object>> threeTotal;
			threeTotal = orderService.findThreeTotal();
			return ReturnMsg.success().add("threeTotal", threeTotal);
		}



		//条形图（bar）
		@ResponseBody
		@RequestMapping(value = "findThreeTotalWithMonths", method = RequestMethod.GET)
		public ReturnMsg findThreeTotalWithMonths(Order order) {
			List<Map<String, Object>> chartBar;
		
			chartBar = orderService.findThreeTotalMonths();
		
			return ReturnMsg.success().add("chartBar", chartBar);
		}
		

}
