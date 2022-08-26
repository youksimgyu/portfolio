package com.demo.mapper;

import java.util.List;

import com.demo.domain.ChartVO;

public interface ChartMapper {
	
	// 1차 카테고리별 매출
	List<ChartVO> primaryChart();

	// 2차 카테고리별 매출
	List<ChartVO> subChart();
	
}
