package com.demo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.demo.domain.MemberVO;
import com.demo.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
public class MemberController {

	// 스프링시큐리티 암호화 라이브러리 클래스 주입
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
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
		
		String cryptEncoderPW = bCryptPasswordEncoder.encode(vo.getMem_pw());
		
		vo.setMem_pw(cryptEncoderPW);
		
		
		service.join(vo);
		
		log.info("회원 가입 정보 : " + vo);
		
		return "/member/login";
	}
	
	//아이디 체크
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
	
	
	//인증확인작업
	@PostMapping("/confirmAuthCode")
	@ResponseBody
	public ResponseEntity<String> confirmAuthCode(String uAuthCode, HttpSession session){
		
		ResponseEntity<String> entity = null;
		
		String authCode = (String) session.getAttribute("authCode");
		
		if(uAuthCode.equals(authCode)) {
			
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
			
			// 세션을 사용하고 난 후 즉시제거
			session.removeAttribute(authCode);
			
		} else {
			
			entity = new ResponseEntity<String>("fail", HttpStatus.OK);
		}
		
		return entity;
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
