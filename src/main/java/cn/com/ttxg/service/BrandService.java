package cn.com.ttxg.service;

import java.util.List;

import cn.com.ttxg.pojo.Brand;
import cn.com.ttxg.pojo.BrandExample;

public interface BrandService {
	
	List<Brand> getBrandsByExample(BrandExample example);
	
}
