package com.demo.service;

import java.util.List;

import com.demo.domain.ReviewVO;
import com.demo.dto.Criteria;

public interface ReviewService {

	// 리뷰 넣기
	void create(ReviewVO vo);
	
	// 리뷰 총 개수
	int getReviewTotalCount(Integer pdt_num);
	
	// 리뷰 리스트 가져오기
	List<ReviewVO> list(Integer pdt_num,Criteria cri);
}
