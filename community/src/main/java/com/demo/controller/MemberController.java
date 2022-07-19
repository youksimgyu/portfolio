package com.demo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.demo.domain.MemberVO;
import com.demo.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
public class MemberController {

	@Autowired
	private MemberService service;
	
	
	@GetMapping("/main")
	public void main() {
		
	}
	
	@GetMapping("/join")
	public void join() {
		
	}
	
	@PostMapping("/join")
	public String join(MemberVO vo, RedirectAttributes rttr, HttpSession session) throws Exception {
		
		service.join(vo);
		
		log.info("회원 가입 정보 : " + vo);
		
		return "/member/login";
	}
	
//	@GetMapping("/login")
//	public void login() {
//		
//	}
//	
//	@PostMapping("/login")
//	public String login() {
//		
//		return "redirect:";
//	}
}
