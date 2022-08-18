package com.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.demo.domain.RecommendVO;
import com.demo.dto.Criteria;

public interface RecommendMapper {
	
	RecommendVO getRecommend(Integer boa_num);
	
	// type=1일떄 up
	void insert1(RecommendVO vo);
	
	// type=1일떄 down
	void insert2(RecommendVO vo);

	List<RecommendVO> select(Criteria cri);
	
	List<RecommendVO> subselect(@Param("cat_c") Integer cat_c, @Param("cri") Criteria cri);
}
