package com.demo.service;

import java.util.Map;

public interface RecommendService {
	
	// type=1일때 업데이트 구문
	void boa_up(Integer boa_num);
	
	// type=1일때 업데이트 구문
	void boa_down(Integer boa_num);
	
	// select
	Map<String, Object> select(Integer boa_num);

}
