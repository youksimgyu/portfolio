package com.demo.service;

import java.util.List;

import com.demo.domain.CategoryVO;

public interface ProductService {

	List<CategoryVO> getCateList();
	
	List<CategoryVO> getsubCateList(Integer categoryCode);
	
}
