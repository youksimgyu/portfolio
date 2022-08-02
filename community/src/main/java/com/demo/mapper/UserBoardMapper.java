package com.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.demo.domain.BoardVO;
import com.demo.domain.CategoryVO;
import com.demo.dto.Criteria;

public interface UserBoardMapper {
	
	// 1차 카테고리
	List<CategoryVO> getCategoryList();
	
	// 1차 카테고리 기준 전체글 가져오기
	List<BoardVO> getMainBoardList(@Param("cat_c") Integer cat_c, @Param("cri") Criteria cri);
	
	// 데이터 개수
	int getBoardTotalCount(@Param("cat_c") Integer cat_c, @Param("cri") Criteria cri);

}
