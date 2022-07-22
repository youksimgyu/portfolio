package com.demo.mapper;

import java.util.List;

import com.demo.domain.CategoryVO;

public interface AdCategoryMapper {

	void categoryInsert(CategoryVO vo);
	
	List<CategoryVO> getCateList();
	
}
