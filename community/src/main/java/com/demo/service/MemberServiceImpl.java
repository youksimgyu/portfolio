package com.demo.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.domain.MemberVO;
import com.demo.dto.EmailDTO;
import com.demo.dto.LoginDTO;
import com.demo.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;
	
	@Override
	public void join(MemberVO vo) {
		// TODO Auto-generated method stub
		mapper.join(vo);
	}

	@Override
	public String idCheck(String mem_id) {
		// TODO Auto-generated method stub
		return mapper.idCheck(mem_id);
	}

	@Override
	public MemberVO Login_ok(LoginDTO dto) {
		// TODO Auto-generated method stub
		return mapper.Login_ok(dto);
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
