package com.demo.mapper;

import java.util.List;

import com.demo.domain.CategoryVO;
import com.demo.domain.ProductVO;
import com.demo.dto.Criteria;

public interface ProductMapper {

	List<CategoryVO> getCateList(); // 1차 카테고리
	
	List<CategoryVO> getsubCateList(Integer categoryCode); // 2차 카테고리
	
	void productInsert(ProductVO vo);
	
	List<ProductVO> getProductList(Criteria cri);
	
	int getProductTotalCount(Criteria cri);
	
	ProductVO getProductpdt_num(Integer pdt_num);
	
	void productModify(ProductVO vo);
	
}
