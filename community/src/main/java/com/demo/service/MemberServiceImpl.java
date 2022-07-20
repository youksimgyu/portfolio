package com.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.domain.MemberVO;
import com.demo.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;
	
	@Override
	public void join(MemberVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String idCheck(String mem_id) {
		// TODO Auto-generated method stub
		return mapper.idCheck(mem_id);
	}

}
