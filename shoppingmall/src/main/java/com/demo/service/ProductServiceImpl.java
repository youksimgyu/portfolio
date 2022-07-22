package com.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.domain.CategoryVO;
import com.demo.domain.ProductVO;
import com.demo.dto.Criteria;
import com.demo.mapper.ProductMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductMapper proMapper;

	@Override
	public List<CategoryVO> getCateList() {
		// TODO Auto-generated method stub
		return proMapper.getCateList();
	}

	@Override
	public List<CategoryVO> getsubCateList(Integer categoryCode) {
		// TODO Auto-generated method stub
		return proMapper.getsubCateList(categoryCode);
	}

	@Override
	public void productInsert(ProductVO vo) {
		// TODO Auto-generated method stub
		proMapper.productInsert(vo);
		
	}

	@Override
	public List<ProductVO> getProductList(Criteria cri) {
		// TODO Auto-generated method stub
		return proMapper.getProductList(cri);
	}

	@Override
	public int getProductTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return proMapper.getProductTotalCount(cri);
	}

	@Override
	public ProductVO getProductpdt_num(Integer pdt_num) {
		// TODO Auto-generated method stub
		return proMapper.getProductpdt_num(pdt_num);
	}

	@Override
	public void productModify(ProductVO vo) {
		// TODO Auto-generated method stub
		proMapper.productModify(vo);
	}

	@Override
	public void productDelete(Integer pdt_num) {
		// TODO Auto-generated method stub
		proMapper.productDelete(pdt_num);
	}
	
}
