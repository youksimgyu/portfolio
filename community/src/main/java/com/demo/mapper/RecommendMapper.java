package com.demo.mapper;

import java.util.Map;

public interface RecommendMapper {

	// type=1일 때 추천수 업데이트
	void update1(Integer boa_num);
	
	// type=2일 때 추천수 업데이트
	void update2(Integer boa_num);
	
	// select
	Map<String, Object> select(Integer boa_num);
	
	

	
}
