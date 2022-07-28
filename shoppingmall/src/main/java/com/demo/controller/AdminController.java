package com.demo.controller;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.demo.domain.AdminVO;
import com.demo.domain.MemberVO;
import com.demo.dto.AdminLoginDTO;
import com.demo.service.AdminService;

import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/admin/*")
@Controller
public class AdminController {

	// 스프링시큐리티 암호화 라이브러리 클래스 주입
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private AdminService service;
	
	//로그인 폼
	@GetMapping("/adLogin")
	public void adlogin() {
		
		log.info("관리자 로그인 폼");
	}
	
	//로그인
	@PostMapping("/adLogin")
	public String adlogin_ok(AdminLoginDTO dto, RedirectAttributes rttr, HttpSession session) throws Exception {
		
		log.info("관리자 로그인 정보 : " + dto);
		
		//로그인 인증작업 맞는지 확인
		AdminVO vo = service.login_ok(dto);
		
		String url = "";
		String msg = "";
		
		if(vo != null) {
			
			String passwd = dto.getAdmin_pw();
			String db_passwd = vo.getAdmin_pw();
			
			if(bCryptPasswordEncoder.matches(passwd, db_passwd)) {
				url = "/admin/main";
				session.setAttribute("adLoginStatus", vo);
				msg = "adLoginSuccess";
			} else {
				url = "/admin/adLogin";
				msg = "passFailure";
			}
		} else {
			url = "/admin/adLogin";
			msg = "idFailure";
		}
		
		rttr.addFlashAttribute("msg", msg);
		
		return "redirect:" + url;
	}
	
	@GetMapping("/main")
	public void main(HttpSession session, AdminVO vo) {
		
		String adm_id = ((AdminVO) session.getAttribute("adLoginStatus")).getAdmin_id();
		vo.setAdmin_id(adm_id);
	}
	
	//로그아웃
	@GetMapping("/adLogout")
	public String adLogout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/admin/adLogin";
	}

	

}
