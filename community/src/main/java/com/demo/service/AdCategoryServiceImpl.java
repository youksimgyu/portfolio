package com.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.domain.CategoryVO;
import com.demo.mapper.AdCategoryMapper;

@Service
public class AdCategoryServiceImpl implements AdCategoryService {

	@Autowired
	private AdCategoryMapper mapper;
	
	@Override
	public void categoryInsert(CategoryVO vo) {
		// TODO Auto-generated method stub
		mapper.categoryInsert(vo);
	}

}
