package cn.com.ttxg.service;

import java.util.List;

import org.springframework.stereotype.Service;

import cn.com.ttxg.pojo.Banner;

public interface BannerService {
	public List<Banner> findBanner();

}
