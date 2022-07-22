package com.demo.service;

import java.util.List;

import com.demo.domain.CategoryVO;
import com.demo.domain.ProductVO;
import com.demo.dto.Criteria;

public interface ProductService {

	List<CategoryVO> getCateList();
	
	List<CategoryVO> getsubCateList(Integer categoryCode);
	
	void productInsert(ProductVO vo);
	
	List<ProductVO> getProductList(Criteria cri);
	
	int getProductTotalCount(Criteria cri);
	
	ProductVO getProductpdt_num(Integer pdt_num);
	
	void productModify(ProductVO vo);
	
	void productDelete(Integer pdt_num);
	
}
