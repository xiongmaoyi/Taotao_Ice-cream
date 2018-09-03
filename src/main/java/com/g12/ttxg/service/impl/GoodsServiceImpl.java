package com.g12.ttxg.service.impl;


import com.g12.ttxg.mapper.GoodsMapper;
import com.g12.ttxg.pojo.Goods;
import com.g12.ttxg.pojo.GoodsCustom;
import com.g12.ttxg.pojo.GoodsExample;
import com.g12.ttxg.service.GoodsService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;

@Service
public class GoodsServiceImpl implements GoodsService {

	
	@Autowired
	private GoodsMapper goodsMapper;
	@Override
	public PageInfo<GoodsCustom> getGoodsCustomsPage(Integer pn, String condition, int searchType) {
		GoodsExample example = new GoodsExample();
		
		example.setOrderByClause("`goodsid`");
		//条件不为空的时候在example中插入条件
		if(!StringUtils.isEmpty(condition)){
			if(searchType==1){
				example.createCriteria().andGoodsnameLike("%"+condition+"%");
			}else if(searchType==2){
				example.createCriteria().andGoodsidEqualTo(condition);
			}else if(searchType==3){
				example.createCriteria().andBrandNameLike("%"+condition+"%");
			}
			
		}
		
		// 从pn页开始查，每页显示5个数据，start后面紧跟的查询就是分页查询
		PageHelper.startPage(pn, 5);
		List<GoodsCustom> goodsCustoms = goodsMapper.selectWithBrandByExample(example);
		PageInfo<GoodsCustom> page = new PageInfo<GoodsCustom>(goodsCustoms, 5);
		
		return page;
	}
	@Override
	public int deleteByPrimaryKey(Integer goodsid) {
		
		return goodsMapper.deleteByPrimaryKey(goodsid);
	}
	@Override
	public int insertGoods(Goods record) {
		GoodsExample example = new GoodsExample();
		example.setOrderByClause("`goodsid`");
		return goodsMapper.insertSelective(record);
	}
	@Override
	public boolean checkGoodsName(String goodsname) {
		GoodsExample example = new GoodsExample();
		GoodsExample.Criteria criteria = example.createCriteria();
		criteria.andGoodsnameEqualTo(goodsname);
		
		long count =goodsMapper.countByExample(example);
		
		
		return count==0;
	}
	@Override
	public Goods getGoosById(Integer id) {
		// TODO Auto-generated method stub
		return goodsMapper.selectByPrimaryKey(id);
	}
	@Override
	public int updateGoodsById(Goods record) {
	
		return goodsMapper.updateByPrimaryKeySelective(record);
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
	
		GoodsExample example = new GoodsExample();
		GoodsExample.Criteria criteria = example.createCriteria();
		criteria.andGoodsidIn(idList);
		
		return goodsMapper.deleteByExample(example);
	}

}
