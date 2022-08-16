package com.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.domain.RecommendVO;
import com.demo.mapper.RecommendMapper;

@Service
public class RecommendServiceImpl implements RecommendService {

	@Autowired
	private RecommendMapper recommendMapper;
	

	@Override
	public RecommendVO select(Integer boa_num) {
		// TODO Auto-generated method stub
		return recommendMapper.select(boa_num);
	}

	@Override
	public void insert1(RecommendVO vo) {
		// TODO Auto-generated method stub
		recommendMapper.insert1(vo);
	}

	@Override
	public void insert2(RecommendVO vo) {
		// TODO Auto-generated method stub
		recommendMapper.insert2(vo);
	}

}
