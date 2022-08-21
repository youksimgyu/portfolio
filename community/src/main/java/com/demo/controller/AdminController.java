package com.demo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.demo.domain.AdminVO;
import com.demo.dto.AdLoginDTO;
import com.demo.service.AdminService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/*")
@Log4j
public class AdminController {
	
	// 스프링시큐리티 암호화 라이브러리 클래스 주입
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private AdminService service;


	
	@GetMapping("/adLogin")
	public void adLogin() {

	}
	
	@GetMapping("/main")
	public void main() {
		

	}
	
	@PostMapping("/adLogin")
	public String adLoing_ok(AdLoginDTO dto, RedirectAttributes rttr, HttpSession session) throws Exception {
		
		AdminVO vo = service.adLogin_ok(dto);
		
		String url = "";
		String msg = "";
		
		if(vo != null) {
			
			String passwd = dto.getAdm_pw();
			String db_passwd = vo.getAdm_pw();
			
			if(bCryptPasswordEncoder.matches(passwd, db_passwd)) {
				url = "/admin/main";
				session.setAttribute("adLoginStatus", vo);
				msg = "adLoginSuccess";
			} else {
				url = "/admin/adLogin";
				msg = "passFailure";
				log.info("비밀번호 실패 : " + dto);
			}
		} else {
			url = "/admin/adLogin";
			msg = "idFailure";
			log.info("아이디 실패");
		}
		
		rttr.addFlashAttribute("msg", msg);
		
		return url;
	}
	
	// 로그아웃
	@GetMapping("/adLogout")
	public String adLogout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/admin/adLogin";
	}
}
