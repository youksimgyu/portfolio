package com.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.domain.CategoryVO;
import com.demo.domain.ProductVO;
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
	
}
