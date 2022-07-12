package com.demo.mapper;

import com.demo.domain.MemberVO;
import com.demo.dto.LoginDTO;

public interface MemberMapper {

	void join(MemberVO vo);
	
	String idCheck(String mem_id);
	
	MemberVO login_ok(LoginDTO dto); // 아이디만 사용
	
}
