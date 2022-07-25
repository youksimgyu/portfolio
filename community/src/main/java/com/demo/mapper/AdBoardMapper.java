package com.demo.mapper;

import java.util.List;

import com.demo.domain.BoardVO;
import com.demo.domain.CategoryVO;
import com.demo.dto.Criteria;

public interface AdBoardMapper {

	List<CategoryVO> getCateList(); // 1차 카테고리
	
	List<CategoryVO> getsubCateList(Integer categoryCode); // 2차 카테고리
	
	BoardVO getCate_name(CategoryVO cat_c);
	
	void boardInsert(BoardVO vo);
	
	List<BoardVO> getBoardList(Criteria cri);
	
	int getBoardTotalCount(Criteria cri);
	
	BoardVO getBoardboa_num(Integer boa_num);
	
	void boardModify(BoardVO vo);
	
	void boardDelete(Integer boa_num);
	
}
