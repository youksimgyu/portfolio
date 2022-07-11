package com.demo.controller;

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
		
		return "";
	}
	
}
