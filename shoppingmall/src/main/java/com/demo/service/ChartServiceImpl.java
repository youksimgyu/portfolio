package com.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.domain.ChartVO;
import com.demo.mapper.ChartMapper;

@Service
public class ChartServiceImpl implements ChartService {

	@Autowired
	private ChartMapper chartMapper;
	
	@Override
	public List<ChartVO> primaryChart() {
		// TODO Auto-generated method stub
		return chartMapper.primaryChart();
	}

	@Override
	public List<ChartVO> subChart() {
		// TODO Auto-generated method stub
		return chartMapper.subChart();
	}

}
