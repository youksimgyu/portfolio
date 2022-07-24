package com.demo.mapper;

import java.util.List;

import com.demo.domain.AdBoardVO;
import com.demo.domain.CategoryVO;
import com.demo.dto.Criteria;

public interface AdBoardMapper {

	List<CategoryVO> getCateList(); // 1차 카테고리
	
	List<CategoryVO> getsubCateList(Integer categoryCode); // 2차 카테고리
	
	void boardInsert(AdBoardVO vo);
	
	List<AdBoardVO> getBoardList(Criteria cri);
	
	int getBoardTotalCount(Criteria cri);
	
	AdBoardVO getBoardad_boa_num(Integer ad_boa_num);
	
	void boardModify(AdBoardVO vo);
	
	void boardDelete(Integer ad_boa_num);
	
}
