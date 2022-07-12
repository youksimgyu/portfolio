package com.demo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.demo.dto.EmailDTO;
import com.demo.service.EmailService;

import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/email/*")
@RestController
public class EmailController {

	@Autowired
	private EmailService service;
	
	@GetMapping("/send") // EmailDTO dto = new EmailDTO(); 스프링에서 자동객체생성
	public ResponseEntity<String> send(EmailDTO dto, HttpSession session){
		
		ResponseEntity<String> entity = null;
		
		// 인증코드 생성. 6자리
		String authCode ="";
		for(int i=0; i<6; i++) {
			authCode += String.valueOf((int)(Math.random()*10)); //0~9범위의 값
		}
		
		session.setAttribute("authCode", authCode);
		
		log.info("인증코드 : " + authCode);
		
		
		// 메일보내기 기능
		try {
			service.sendMain(dto, authCode);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception ex) {
			ex.printStackTrace();
			entity = new ResponseEntity<String>("error", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
	
	
}
