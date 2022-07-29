package com.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.domain.ReviewVO;
import com.demo.dto.Criteria;
import com.demo.mapper.ReviewMapper;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewMapper reviewMapper;
	
	@Override
	public void create(ReviewVO vo) {
		// TODO Auto-generated method stub
		reviewMapper.create(vo);
	}

	@Override
	public List<ReviewVO> list(Integer pdt_num, Criteria cri) {
		// TODO Auto-generated method stub
		return reviewMapper.list(pdt_num, cri);
	}

	@Override
	public int getReviewTotalCount(Integer pdt_num) {
		// TODO Auto-generated method stub
		return reviewMapper.getReviewTotalCount(pdt_num);
	}

}
