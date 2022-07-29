package com.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.demo.domain.ReviewVO;
import com.demo.dto.Criteria;

public interface ReviewMapper {

	// 리뷰 넣기
	void create(ReviewVO vo);
	
	// 리뷰 총 개수
	int getReviewTotalCount(Integer pdt_num);
	
	// 리뷰 리스트 가져오기
	List<ReviewVO> list(@Param("pdt_num") Integer pdt_num, @Param("cri") Criteria cri);
	
}
