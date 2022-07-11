package com.demo.service;

import com.demo.domain.MemberVO;

public interface MemberService {
	
	void join(MemberVO vo);
	
	String idCheck(String mem_id);
	
}
