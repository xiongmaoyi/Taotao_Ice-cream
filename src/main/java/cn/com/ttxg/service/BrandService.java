package cn.com.ttxg.service;

import java.util.List;

import com.github.pagehelper.PageInfo;

import cn.com.ttxg.pojo.Brand;
import cn.com.ttxg.pojo.BrandExample;

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
