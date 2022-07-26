package com.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.domain.CategoryVO;
import com.demo.domain.ProductVO;
import com.demo.dto.Criteria;
import com.demo.mapper.UserProductMapper;

import lombok.extern.log4j.Log4j;

@Service
public class UserProductServiceImpl implements UserProductService {
	
	@Autowired
	private UserProductMapper proMapper;
	
	@Override
	public List<CategoryVO> getCategoryList() {
		// TODO Auto-generated method stub
		return proMapper.getCategoryList();
	}

	@Override
	public List<CategoryVO> getSubCagegoryList(Integer cg_code_c) {
		// TODO Auto-generated method stub
		return proMapper.getSubCagegoryList(cg_code_c);
	}

	@Override
	public List<ProductVO> getProductListbysubCategory(Integer cg_code_c, Criteria cri) {
		// TODO Auto-generated method stub
		return proMapper.getProductListbysubCategory(cg_code_c, cri);
	}

	@Override
	public int getProductCountbysubCategory(Integer cg_code_c, Criteria cri) {
		// TODO Auto-generated method stub
		return proMapper.getProductCountbysubCategory(cg_code_c, cri);
	}

	@Override
	public ProductVO getProductpdt_num(Integer pdt_num) {
		// TODO Auto-generated method stub
		return proMapper.getProductpdt_num(pdt_num);
	}

	
	
}
