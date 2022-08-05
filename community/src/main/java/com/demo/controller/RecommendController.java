package com.demo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.demo.domain.BoardVO;
import com.demo.domain.CategoryVO;
import com.demo.domain.MemberVO;
import com.demo.service.RecommendService;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/user/recommend/*")
public class RecommendController {

	@Autowired
	private RecommendService recomendService;
	
	@GetMapping("/boa_up_down")
	public ResponseEntity<String> recommend(@PathVariable("boa_num") Integer boa_num, @PathVariable("type") Integer type, HttpSession session, BoardVO vo){
		ResponseEntity<String> entity = null;
		
		// 세션에서 아이디 가져와서 넣기
		String mem_id = ((MemberVO) session.getAttribute("loginStatus")).getMem_id();
		vo.setMem_id(mem_id);
		
		if(type == 1) {
			recomendService.boa_up(boa_num);
		} else if(type == 2) {
			recomendService.boa_down(boa_num);
		}
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
	}
	
	
}
