package com.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.domain.MemberVO;
import com.demo.dto.LoginDTO;
import com.demo.mapper.MemberMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;
	
	@Override
	public void join(MemberVO vo) {
		
		mapper.join(vo);
	}

	@Override
	public String idCheck(String mem_id) {
		
		return mapper.idCheck(mem_id);
	}

	@Override
	public MemberVO login_ok(LoginDTO dto) {
		// TODO Auto-generated method stub
		return mapper.login_ok(dto);
	}

	@Override
	public String searchID(String mem_name, String mem_email) {
		// TODO Auto-generated method stub
		return mapper.searchID(mem_name, mem_email);
	}

	@Override
	public String getIDEmailExists(String mem_id, String mem_email) {
		// TODO Auto-generated method stub
		return mapper.getIDEmailExists(mem_id, mem_email);
	}

	@Override
	public void changePW(String mem_id, String enc_mem_pw) {
		// TODO Auto-generated method stub
		mapper.changePW(mem_id, enc_mem_pw);
	}

	@Override
	public void modify(MemberVO vo) {
		// TODO Auto-generated method stub
		mapper.modify(vo);
	}

	
	
	
}
