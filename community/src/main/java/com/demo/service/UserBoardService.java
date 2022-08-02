package com.demo.service;

import java.util.List;

import com.demo.domain.BoardVO;
import com.demo.domain.CategoryVO;
import com.demo.dto.Criteria;

public interface UserBoardService {
	
	// 1차 카테고리
	List<CategoryVO> getCategoryList();
	
	// 1차 카테고리 기준 전체글 가져오기
	List<BoardVO> getMainBoardList(Integer cat_c, Criteria cri);
	
	// 데이터 개수
	int getBoardTotalCount(Integer cat_c, Criteria cri);

}
