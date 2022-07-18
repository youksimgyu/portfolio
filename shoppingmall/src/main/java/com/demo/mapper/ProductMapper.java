package com.demo.mapper;

import java.util.List;

import com.demo.domain.CategoryVO;

public interface ProductMapper {

	List<CategoryVO> getCateList();
	
	List<CategoryVO> getsubCateList(Integer categoryCode);
	
}
