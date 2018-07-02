package cn.com.ttxg.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.ttxg.mapper.FlowMapper;
import cn.com.ttxg.pojo.Flow;

@Service
public class FlowServiceImpl implements FlowService {
	
	@Autowired
	private FlowMapper flowMapper;

	@Override
	public int insertFlows(List<Flow> flowList) {
		
		return flowMapper.insertFlows(flowList);
	}
	
}
