package com.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.demo.domain.CategoryVO;
import com.demo.domain.ProductVO;
import com.demo.dto.Criteria;

public interface UserProductMapper {

	// 1차 카테고리
	List<CategoryVO> getCategoryList();
	
	// 2차 카테고리
	List<CategoryVO> getSubCagegoryList(Integer cg_code_c);
	
	// 2차 카테고리별 상품목록
	List<ProductVO> getProductListbysubCategory(@Param("cg_code_c") Integer cg_code_c, @Param("cri") Criteria cri);
	
	// 2차 카테고리별 상품개수
	int getProductCountbysubCategory(@Param("cg_code_c") Integer cg_code_c, @Param("cri") Criteria cri);
}
