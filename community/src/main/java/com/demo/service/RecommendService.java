package com.demo.service;

import java.util.List;

import com.demo.domain.RecommendVO;
import com.demo.dto.Criteria;

public interface RecommendService {
	
	RecommendVO getRecommend(Integer boa_num);
	
	// type=1일떄 up
	void insert1(RecommendVO vo);
	
	// type=1일떄 down
	void insert2(RecommendVO vo);

	List<RecommendVO> select(Criteria cri);
	
	List<RecommendVO> subselect(Integer cat_c, Criteria cri);
}
