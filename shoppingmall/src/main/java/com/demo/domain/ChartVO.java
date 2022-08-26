package com.demo.domain;

import lombok.Data;

@Data
public class ChartVO {

	private String primary_cd; // 1차 카테고리 이름
	private int sales_p; // 1차 카테고리별 매출
	private String secondary_cd; // 2차 카테고리 이름
	private int sales_s; // 2차 카테고리별 매출
	private String month; // 월
	private int monthly_sales; // 월별 매출 
	private String year; // 년도
	private int total; // 연도별 매출
	
}
