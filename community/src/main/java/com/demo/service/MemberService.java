package com.demo.service;

import org.apache.ibatis.annotations.Param;

import com.demo.domain.MemberVO;
import com.demo.dto.LoginDTO;

public interface MemberService {
	
	void join(MemberVO vo);
	
	String idCheck(String mem_id);
	
	MemberVO Login_ok(LoginDTO dto);
	
	String searchID(String mem_name, String mem_email);
	
	String getIDEmailExists(String mem_id, String mem_email);
	
	void changePW(String mem_id, String enc_mem_pw);

	void modify(MemberVO vo);
}
