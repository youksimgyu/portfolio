package com.demo.service;

import com.demo.domain.MemberVO;
import com.demo.dto.LoginDTO;

public interface MemberService {
	
	void join(MemberVO vo);
	
	String idCheck(String mem_id);
	
	MemberVO login_ok(LoginDTO dto);
	
}
