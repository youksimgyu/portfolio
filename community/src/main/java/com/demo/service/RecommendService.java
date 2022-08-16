package com.demo.service;

import com.demo.domain.RecommendVO;

public interface RecommendService {
	
	// select
	RecommendVO select(Integer boa_num);
	
	// type=1일떄 up
	void insert1(RecommendVO vo);
	
	// type=1일떄 down
	void insert2(RecommendVO vo);

}
