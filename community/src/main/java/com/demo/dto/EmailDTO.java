package com.demo.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class EmailDTO {
	
	private String senderName; // 발신자 이름
	private String senderMail; // 발신자 메일주소
	private String receiveMail; // 수신자 메일주소. 회원메일주소사용
	private String subject; // 제목
	private String message; // 본문

	public EmailDTO() {
		this.senderName = "Symbol";
		this.senderMail = "Symbol"; // GMail 전자우편 정보 SMTP메일서버 이용
		this.subject = "Symbol 회원가입 메일인증코드입니다.";
		this.message = "메일 인증을 위한 인증코드를 확인하시고, 회원가입시 인증코드 입력란에 입력하세요.";
	}
	
}

