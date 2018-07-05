package cn.com.ttxg.service;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.druid.util.StringUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.com.ttxg.mapper.OrderMapper;
import cn.com.ttxg.mapper.UserMapper;
import cn.com.ttxg.pojo.Order;
import cn.com.ttxg.pojo.OrderCustom;
import cn.com.ttxg.pojo.OrderExample;
import cn.com.ttxg.pojo.User;
import cn.com.ttxg.pojo.UserExample;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderMapper orderMapper;
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public int insertOrder(Order order) {
		Date day=new Date();    

		order.setOrderdate(day);
		order.setState("1");
		int a = orderMapper.insert(order);
		return a;
	}

	//五表联合查询
	@Override
	public List<OrderCustom> getCompleteOrder(int orderid) {
		
		OrderExample example = new OrderExample();
		example.createCriteria().andOrderidEqualTo(orderid);
		
		return orderMapper.selectCompleteOrder(example);
	}


	@Override
	public PageInfo<OrderCustom> getPurchasePage(Integer pn, String condition, int searchType) {
		OrderExample example = new OrderExample();
		example.createCriteria().andOrdertypeEqualTo("1");
		//按订单编号，时间，处理人，客户，送货员查询
		if(!StringUtils.isEmpty(condition)){
			if(searchType==1){
				example.createCriteria().andOrderidEqualTo(condition);
			}else if(searchType==2){
				//example.createCriteria().andOrderdateBetween(1, 2);
			}else if(searchType==3){
				//example.createCriteria().andUserNameLike("%"+condition+"%");
			}
		}
		
		
		PageHelper.startPage(pn, 5);
		List<OrderCustom> orderCustoms = orderMapper.selectCompleteOrder(example);
		PageInfo<OrderCustom> page = new PageInfo<OrderCustom>(orderCustoms,5);
		return page;

	}


	@Override
	public PageInfo<OrderCustom> getAllOrderPage(Integer pn, String condition, int searchType) {
		OrderExample example = new OrderExample();
		//按订单编号，时间，处理人，客户，送货员查询
		if(!StringUtils.isEmpty(condition)){
			if(searchType==1){
				example.createCriteria().andOrderidEqualTo(condition);
			}else if(searchType==2){
			//	example.createCriteria().andOrderdateBetween(date_1, date_2);
			}
		}

		PageHelper.startPage(pn, 5);
		List<OrderCustom> orderCustoms = orderMapper.selectCompleteOrder(example);
		PageInfo<OrderCustom> page = new PageInfo<OrderCustom>(orderCustoms,5);
		return page;
	}


	@Override
	public PageInfo<OrderCustom> findPageByCondition(Integer pn, String condition, int searchType,Date date_1, Date date_2) {
		OrderExample example = new OrderExample();
		//按订单编号，时间
		
			if(searchType==1){
				if(!StringUtils.isEmpty(condition)){
				example.createCriteria().andOrderidEqualTo(condition);
				}
			}else if(searchType==2){
				example.createCriteria().andOrderdateBetween(date_1, date_2);
			}else if(searchType==3){
				if(!StringUtils.isEmpty(condition)){
				
				example.createCriteria().andOrderstateEqualTo(condition).andOrdertypeEqualTo("2");
				}
			}
		
		PageHelper.startPage(pn, 5);
		List<OrderCustom> orderCustoms = orderMapper.selectSimpleOrder(example);
		PageInfo<OrderCustom> page = new PageInfo<OrderCustom>(orderCustoms,5);
		return page;
	}

	@Override
	public int deleteByIds(String ids) {
		List<Integer> idList = new ArrayList<Integer>();
		//按照-分割为字符串数组
		String[] str_ids = ids.split("-");
		//遍历字符串数组
		for(String string:str_ids){
			idList.add(Integer.parseInt(string));
		}
		OrderExample example = new OrderExample();
		example.createCriteria().andOrderidIn(idList);
		//删除order后，数据库会根据触发器自动删除flow
		return orderMapper.deleteByExample(example);
	}

	@Override
	public int deleteByPrimaryKey(Integer id) {
		return orderMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int updateByid(Order order) {
		
		return orderMapper.updateByPrimaryKeySelective(order);
	}

	
	@Override
	public PageInfo<OrderCustom> findPurchase(Integer pn, String condition, int searchType, Date date_1, Date date_2) {
		OrderExample example = new OrderExample();
		//按订单编号，时间
		cn.com.ttxg.pojo.OrderExample.Criteria criteria = example.createCriteria().andOrdertypeEqualTo("1");
			if(searchType==1){
				if(!StringUtils.isEmpty(condition)){
					criteria.andOrderidEqualTo(condition);
				}
			}else if(searchType==2){
				criteria.andOrderdateBetween(date_1, date_2);
			}
		
		PageHelper.startPage(pn, 5);
		List<OrderCustom> orderCustoms = orderMapper.selectSimpleOrder(example);
		PageInfo<OrderCustom> page = new PageInfo<OrderCustom>(orderCustoms,5);
		return page;
	}

	@Override
	public PageInfo<OrderCustom> findSale(Integer pn,String condition, int searchType, Date date_1, Date date_2) {
		OrderExample example = new OrderExample();
		//按订单编号，时间
		cn.com.ttxg.pojo.OrderExample.Criteria criteria = example.createCriteria().andOrdertypeEqualTo("2");
		
			if(searchType==1){
				if(!StringUtils.isEmpty(condition)){
				criteria.andOrderidEqualTo(condition);
				}
			}else if(searchType==2){
				criteria.andOrderdateBetween(date_1, date_2);
			}else if(searchType==3){
				if(!StringUtils.isEmpty(condition)){
				
				criteria.andOrderstateEqualTo(condition);
				}
			}
		
		PageHelper.startPage(pn, 5);
		List<OrderCustom> orderCustoms = orderMapper.selectSimpleOrder(example);
		PageInfo<OrderCustom> page = new PageInfo<OrderCustom>(orderCustoms,5);
		return page;
	}

	@Override
	public int getMaxId() {
	
		return orderMapper.selectMaxOrderId();
	}

	@Override
	public PageInfo<OrderCustom> findUnDeliverPageByCondition(Integer pn, String condition, int searchType, Date date_1,
			Date date_2) {
		OrderExample example = new OrderExample();
		//按订单编号，时间
		cn.com.ttxg.pojo.OrderExample.Criteria criteria = example.createCriteria().andOrderstateEqualTo("1");
		criteria.andOrdertypeEqualTo("2");
			if(searchType==1){
				if(!StringUtils.isEmpty(condition)){
				criteria.andOrderidEqualTo(condition);
				}
			}else if(searchType==2){
				criteria.andOrderdateBetween(date_1, date_2);
			}
		
		PageHelper.startPage(pn, 5);
		List<OrderCustom> orderCustoms = orderMapper.selectSimpleOrder(example);
		PageInfo<OrderCustom> page = new PageInfo<OrderCustom>(orderCustoms,5);
		return page;
	}

	@Override
	public PageInfo<OrderCustom> findPageByDelivery(Integer pn, String condition, int searchType, Date date_1,
			Date date_2, String delivery) {
		OrderExample example = new OrderExample();
		UserExample example2 = new UserExample();
		example2.createCriteria().andUsernameEqualTo(delivery);
		//按订单编号，时间
		int userid = userMapper.selectByExample(example2).get(0).getUserid();
		
		cn.com.ttxg.pojo.OrderExample.Criteria criteria = example.createCriteria().andDeliveryEqualTo(Integer.toString(userid));
		
			if(searchType==1){
				if(!StringUtils.isEmpty(condition)){
				criteria.andOrderidEqualTo(condition);
				}
			}else if(searchType==2){
				criteria.andOrderdateBetween(date_1, date_2);
			}else if(searchType==3){
				if(!StringUtils.isEmpty(condition)){
				
				criteria.andOrderstateEqualTo(condition).andOrdertypeEqualTo("2");
				}
			}
		
		PageHelper.startPage(pn, 5);
		List<OrderCustom> orderCustoms = orderMapper.selectSimpleOrder(example);
		PageInfo<OrderCustom> page = new PageInfo<OrderCustom>(orderCustoms,5);
		return page;
	}


	

}
