package com.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/*")
@Log4j
public class AdminController {

	@GetMapping("/main")
	public void main() {
		
		log.info("main");
	}
	
	@GetMapping("/adLogin")
	public void adLogin() {
		
	}
	
	@PostMapping("/adLogin")
	public String adLoing_ok() {
		
		return "";
	}
	
}
