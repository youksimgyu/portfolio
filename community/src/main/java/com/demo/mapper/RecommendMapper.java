package com.demo.mapper;

public interface RecommendMapper {

	// type=1일 때 추천수 업데이트
	void update1(Integer boa_num);
	
	// type=1일때 추천수 업데이트 정보 가져오기
	int select1(Integer boa_num);
	
	// type=1일 때 추천수 업데이트
	void update2(Integer boa_num);
	
	// type=1일때 추천수 업데이트 정보 가져오기
	int select2(Integer boa_num);
	
}
