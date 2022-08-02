package com.demo.service;

import java.util.List;

import com.demo.domain.CategoryVO;

public interface UserBoardService {
	
	// 1차 카테고리
	List<CategoryVO> getCategoryList();
	
	// 2차 카테고리
	List<CategoryVO> getSubCagegoryList(Integer cat_c);

}
