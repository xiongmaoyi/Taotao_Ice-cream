package com.g12.ttxg.service.impl;


import com.g12.ttxg.mapper.FlowMapper;
import com.g12.ttxg.pojo.Flow;
import com.g12.ttxg.service.FlowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FlowServiceImpl implements FlowService {
	
	@Autowired
	private FlowMapper flowMapper;

	@Override
	public int insertFlows(List<Flow> flowList) {
		
		return flowMapper.insertFlows(flowList);
	}
	
}
