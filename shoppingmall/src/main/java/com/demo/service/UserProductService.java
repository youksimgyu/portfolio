package com.demo.service;

import java.util.List;

import com.demo.domain.CategoryVO;
import com.demo.domain.ProductVO;
import com.demo.dto.Criteria;

public interface UserProductService {

	// 1차 카테고리
	List<CategoryVO> getCategoryList();
	
	// 2차 카테고리
	List<CategoryVO> getSubCagegoryList(Integer cg_code_c);
	
	// 2차 카테고리별 상품목록
	List<ProductVO> getProductListbysubCategory(Integer cg_code_c, Criteria cri);
	
	// 2차 카테고리별 상품개수
	int getProductCountbysubCategory(Integer cg_code_c, Criteria cri);
	
	// 상품 상세정보
	ProductVO getProductpdt_num(Integer pdt_num);
	
}
