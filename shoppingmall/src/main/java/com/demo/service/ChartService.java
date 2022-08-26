package com.demo.service;

import java.util.List;

import com.demo.domain.ChartVO;

public interface ChartService {

	// 1차 카테고리별 매출
	List<ChartVO> primaryChart();
	
	// 2차 카테고리별 매출
	List<ChartVO> subChart();
	
}
