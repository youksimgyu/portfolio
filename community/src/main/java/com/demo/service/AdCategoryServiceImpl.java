package com.demo.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.demo.domain.CategoryVO;
import com.demo.mapper.AdCategoryMapper;

public class AdCategoryServiceImpl implements AdCategoryService {

	@Autowired
	private AdCategoryMapper mapper;
	
	@Override
	public void categoryInsert(CategoryVO vo) {
		// TODO Auto-generated method stub
		mapper.categoryInsert(vo);
	}

}
