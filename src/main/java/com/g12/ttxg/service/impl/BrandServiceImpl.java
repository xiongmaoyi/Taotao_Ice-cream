package com.g12.ttxg.service.impl;


import com.g12.ttxg.mapper.BrandMapper;
import com.g12.ttxg.pojo.Brand;
import com.g12.ttxg.pojo.BrandExample;
import com.g12.ttxg.service.BrandService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;

@Service
public class BrandServiceImpl implements BrandService {

	@Autowired
	private BrandMapper brandMapper;
	@Override
	public List<Brand> getBrandsByExample(BrandExample example) {
		return brandMapper.selectByExample(example);
	}
	@Override
	public PageInfo<Brand> getBrandPage(Integer pn, String condition, int searchType) {
		BrandExample example = new BrandExample();
		if(!StringUtils.isEmpty(condition)){
			if(searchType==1){
				example.createCriteria().andBrandidEqualTo(Integer.parseInt(condition));
			}else if(searchType==2){
				example.createCriteria().andBrandnameLike("%"+condition+"%");
			}
		}
		PageHelper.startPage(pn,5);
		List<Brand> brandList = brandMapper.selectByExample(example);
		PageInfo<Brand> page = new PageInfo<Brand>(brandList,5);
		
		return page;
	}
	@Override
	public int addBrand(Brand brand) {
		
		return brandMapper.insert(brand);
	}
	@Override
	public boolean checkBrandName(String brandname) {
		BrandExample example = new BrandExample();
		example.createCriteria().andBrandnameEqualTo(brandname);
		long sameNameCount = brandMapper.countByExample(example);
		return sameNameCount == 0;
	}
	@Override
	public int deleteById(int id) {
		
		return brandMapper.deleteByPrimaryKey(id);
	}
	@Override
	public int deleteByIds(String ids) {
		List<Integer> idList = new ArrayList<Integer>();
		String[] str_ids = ids.split("-"); 
		for(String s:str_ids){
			idList.add(Integer.parseInt(s));
		}
		BrandExample example = new BrandExample();
		example.createCriteria().andBrandidIn(idList);
		
		return brandMapper.deleteByExample(example);
	}
	@Override
	public Brand getBrandById(Integer id) {
		
		return brandMapper.selectByPrimaryKey(id);
	}
	@Override
	public int updateBrandById(Brand brand) {
		return brandMapper.updateByPrimaryKeySelective(brand);
	}

}
