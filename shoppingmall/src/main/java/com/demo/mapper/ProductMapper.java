package com.demo.mapper;

import java.util.List;

import com.demo.domain.CategoryVO;
import com.demo.domain.ProductVO;

public interface ProductMapper {

	List<CategoryVO> getCateList();
	
	List<CategoryVO> getsubCateList(Integer categoryCode);
	
	void productInsert(ProductVO vo);
	
}
