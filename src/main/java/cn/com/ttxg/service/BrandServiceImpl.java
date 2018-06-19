package cn.com.ttxg.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.ttxg.mapper.BrandMapper;
import cn.com.ttxg.pojo.Brand;
import cn.com.ttxg.pojo.BrandExample;

@Service
public class BrandServiceImpl implements BrandService {

	@Autowired
	private BrandMapper brandMapper;
	@Override
	public List<Brand> getBrandsByExample(BrandExample example) {
		return brandMapper.selectByExample(example);
	}

}
