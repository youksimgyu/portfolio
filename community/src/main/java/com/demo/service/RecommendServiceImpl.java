package com.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.mapper.RecommendMapper;

@Service
public class RecommendServiceImpl implements RecommendService {

	@Autowired
	private RecommendMapper recommendMapper;
	
	@Override
	public void boa_up(Integer boa_num) {
		// TODO Auto-generated method stub
		recommendMapper.update1(boa_num);
		recommendMapper.select1(boa_num);
	}

	@Override
	public void boa_down(Integer boa_num) {
		// TODO Auto-generated method stub
		recommendMapper.update2(boa_num);
		recommendMapper.select2(boa_num);
	}

}
