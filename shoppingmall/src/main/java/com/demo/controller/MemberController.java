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
	
	//인증확인작업
	@PostMapping("/confirmAuthCode")
	@ResponseBody
	public ResponseEntity<String> confirmAuthCode(String uAuthCode, HttpSession session){
		
		ResponseEntity<String> entity = null;
		
		String authCode = (String) session.getAttribute("authCode");
		
		if(uAuthCode.equals(authCode)) {
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>("fail", HttpStatus.OK);
		}
		
		return entity;
	}
	
	@GetMapping("/login")
	public void login() {
		
		log.info("로그인 폼");
	}
	
	@PostMapping("/loginPost")
	public String login_ok(LoginDTO dto, RedirectAttributes rttr, HttpSession session) throws Exception {
		
//		RedirectAttributes 인터페이스 주요 설명
//		1) rttr.addFlashAttribute(attributeName, attributeValue) : 페이지 이동주소의 jsp에서 참조할 경우
		
//		2) rttr.addAttribute(attributeName, attributeValue) : 리다이렉트 주소에 파라미터로 사용. /member/login?파라미터1=값&파리미터2=값
//			rttr.addAttribute("pageNum", pageNum);
//			rttr.addAttribute("amount", amount);
		
		log.info("로그인 정보 : " + dto);
		
		// 로그인정보 인증작업
		MemberVO vo = service.login_ok(dto);
		
		String url = "";
		String msg = "";
		
		if(vo != null) { // 아이디가 존재하는 경우
			
			// 사용자가 입력한 평문텍스트(일반비번)과 DB에 저장된 암호화된 비밀번호 비교작업
			
			// 1)비번 일치
			String passwd = dto.getMem_pw(); //사용자가 입력한 비밀번호
			String db_passwd = vo.getMem_pw(); //DB에서 가져온 비밀번호
			
			if(passwd.equals(db_passwd)) {
				url = "/"; // 메인페이지
				session.setAttribute("loginStatus", vo); // 인증성공시 서버측에 세션을 통한 정보를 저장.
				msg = "loginSuccess";
				
			} else {
				// 2)비번 일치 안되는 경우
				url = "/member/login"; // 로그인 화면
				msg = "passwdFailure";
			}
			
			
		} else { // 아이디가 존재하지 않는 경우
			
			url = "/member/login"; // 로그인 화면
			msg = "idFailure";
			
		}
		
		rttr.addFlashAttribute("msg", msg); // 이동하는 주소의 jsp에서 참조함.
		
		return "redirect:" + url; // 다른주소로 이동
	}
	
}
