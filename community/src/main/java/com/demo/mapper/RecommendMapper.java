package com.demo.mapper;

import java.util.List;

import com.demo.domain.RecommendVO;

public interface RecommendMapper {
	
	RecommendVO getRecommend(Integer boa_num);
	
	// type=1일떄 up
	void insert1(RecommendVO vo);
	
	// type=1일떄 down
	void insert2(RecommendVO vo);

	List<RecommendVO> select();
}
