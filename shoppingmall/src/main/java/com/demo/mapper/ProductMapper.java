package com.demo.mapper;

import java.util.List;

import com.demo.domain.CategoryVO;
import com.demo.domain.ProductVO;
import com.demo.dto.Criteria;

public interface ProductMapper {

	List<CategoryVO> getCateList();
	
	List<CategoryVO> getsubCateList(Integer categoryCode);
	
	void productInsert(ProductVO vo);
	
	List<ProductVO> getProductList(Criteria cri);
	
	int getProductTotalCount(Criteria cri);
	
}
