package cn.com.ttxg.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.com.ttxg.mapper.GoodsMapper;
import cn.com.ttxg.pojo.Goods;

public class OrderController {

	@Autowired
	private GoodsMapper goodsMapper;
	
//	public void namedd() {
//		//获取第1页，10条内容，默认查询总数count
//		PageHelper.startPage(1, 10);
//		List<Goods> list = goodsMapper.selectByExample(null);
//		PageInfo page = new PageInfo(list);
//		
//		
//	}

}
