package com.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.domain.RecommendVO;
import com.demo.dto.Criteria;
import com.demo.mapper.RecommendMapper;

@Service
public class RecommendServiceImpl implements RecommendService {

	@Autowired
	private RecommendMapper recommendMapper;
	

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

	@Override
	public List<RecommendVO> select(Criteria cri) {
		// TODO Auto-generated method stub
		return recommendMapper.select(cri);
	}

	@Override
	public RecommendVO getRecommend(Integer boa_num) {
		// TODO Auto-generated method stub
		return recommendMapper.getRecommend(boa_num);
	}

	@Override
	public List<RecommendVO> subselect(Integer cat_c, Criteria cri) {
		// TODO Auto-generated method stub
		return recommendMapper.subselect(cat_c, cri);
	}

	@Override
	public RecommendVO getrec_id(RecommendVO vo) {
		// TODO Auto-generated method stub
		return recommendMapper.getrec_id(vo);
	}



}
