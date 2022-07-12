package com.demo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.demo.domain.MemberVO;
import com.demo.dto.LoginDTO;
import com.demo.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
public class MemberController {

	@Autowired
	private MemberService service;
	
	@GetMapping("/join")
	public void join() {
		
	}
	
	@PostMapping("/join") //MemberVO vo = new MemberVO(); -> 스프링이 객체생성을 자동으로 해줌
	public String join(MemberVO vo, RedirectAttributes rttr) throws Exception {
		
		if(vo.getMem_accept_e().equals("on")) {
			vo.setMem_accept_e("Y");
		}
		
		log.info(vo); // vo.toString()
		
		service.join(vo);
		
		return ""; // 회원가입 후 이동할 주소
	}
	
	@ResponseBody
	@GetMapping("/idCheck")
	public ResponseEntity<String> idCheck(@RequestParam("mem_id") String mem_id){
		
		ResponseEntity<String> entity = null;
		
		// 아이디 존재여부 작업
		String isUseID = "";
		
		if(service.idCheck(mem_id) != null) {
			isUseID = "no"; // 같은 아이디가 존재한다
		}else {
			isUseID = "yes"; // 사용 가능 아이디
		}
		
		entity = new ResponseEntity<String>(isUseID, HttpStatus.OK);
		
		return entity;
	}
	
	@GetMapping("/login")
	public void login() {
		
		log.info("로그인 폼");
	}
	
	@PostMapping("/loginPost")
	public String login_ok(LoginDTO dto, RedirectAttributes rttr, HttpSession session) throws Exception {
		
		// 로그인정보 인증작업
		MemberVO vo = service.login_ok(dto);
		
		String url = "";
		
		if(vo != null) { // 아이디가 존재하는 경우
			
			// 사용자가 입력한 평문텍스트(일반비번)과 DB에 저장된 암호화된 비밀번호 비교작업
			
			// 1)비번 일치
			url = "/"; // 메인페이지
			
			// 2)비번 일치 안되는 경우
			url = "/member/login"; // 로그인 화면
			
		} else { // 아이디가 존재하지 않는 경우
			
			url = "/member/login"; // 로그인 화면
			
		}
		
		return "redirect:/" + url; // 다른주소로 이동
	}
	
}
