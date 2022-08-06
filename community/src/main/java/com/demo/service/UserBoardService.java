package com.demo.service;

import java.util.List;

import com.demo.domain.BoardNameVO;
import com.demo.domain.BoardVO;
import com.demo.domain.CategoryVO;
import com.demo.dto.Criteria;

public interface UserBoardService {
	
	// 1차 카테고리
	List<CategoryVO> getCategoryList();
	
	// 2차 카테고리
	List<CategoryVO> getSubCategoryList(Integer cat_c);
	
	// 1차 카테고리 기준 전체글 가져오기
	List<BoardNameVO> getMainBoardList(Integer cat_c, Criteria cri);
	
	// 데이터 개수
	int getBoardTotalCount(Integer cat_c, Criteria cri);
	
	// 글 가져오기
	BoardNameVO boardGet(Integer boa_num);
	
	// 게시물 조회수 올리기
	int boa_hit(Integer boa_num);
	
	// 게시물 쓰기
	void boardInsert(BoardVO vo);
	
	// 전체 글 가져오기
	List<BoardNameVO> getBoardList(Criteria cri);
	
	// 전체 글 카운트
	int getTotalBoardTotalCount(Criteria cri);
	
	
	
}
