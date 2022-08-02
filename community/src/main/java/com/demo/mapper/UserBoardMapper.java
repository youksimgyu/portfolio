package com.demo.mapper;

import java.util.List;

import com.demo.domain.BoardVO;
import com.demo.domain.CategoryVO;

public interface UserBoardMapper {
	
	// 1차 카테고리
	List<CategoryVO> getCategoryList();
	
	// 2차 카테고리
	List<BoardVO> getmainBoard(Integer cat_c);

}
