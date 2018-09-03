package com.g12.ttxg.service;


import com.g12.ttxg.pojo.Brand;
import com.g12.ttxg.pojo.BrandExample;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface BrandService {
	
	public List<Brand> getBrandsByExample(BrandExample example);

	public PageInfo<Brand> getBrandPage(Integer pn, String condition, int searchType);

	public int addBrand(Brand brand);

	public boolean checkBrandName(String brandname);

	public int deleteById(int id);

	public int deleteByIds(String ids);

	public Brand getBrandById(Integer id);

	public int updateBrandById(Brand brand);


	
}
