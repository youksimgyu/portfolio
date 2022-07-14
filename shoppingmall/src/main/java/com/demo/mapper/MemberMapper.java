package com.demo.mapper;

import org.apache.ibatis.annotations.Param;

import com.demo.domain.MemberVO;
import com.demo.dto.LoginDTO;

public interface MemberMapper {

	void join(MemberVO vo);
	
	String idCheck(String mem_id);
	
	MemberVO login_ok(LoginDTO dto); // 아이디만 사용
	
	// mapper 인터페이스의 메서드가 파라미터 2개 이상일 경우에는 @Param 반드시 사용
	// @Param("")의 안에 내용을 sql에서 사용한다
	// 아이디 찾기
	String searchID(@Param("mem_name") String mem_name, @Param("mem_email") String mem_email);
	
	// 임시비밀번호 발급
	// 아이디와 이메일이 일치하는지 확인만 필요
	String getIDEmailExists(@Param("mem_id") String mem_id, @Param("mem_email") String mem_email);
	
	// 임시비밀번호를 암호화해서 데이터베이스에 넣는 과정
	void changePW(@Param("mem_id") String mem_id, @Param("mem_pw") String enc_mem_pw);
	
	// 회원정보 수정
	void modify(MemberVO vo);
	
	
	
}
