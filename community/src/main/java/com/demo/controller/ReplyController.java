package com.demo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.demo.domain.MemberVO;
import com.demo.domain.ReplyVO;
import com.demo.service.ReplyService;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/user/reply/*")
public class ReplyController {

	@Autowired
	private ReplyService replyService;
	
	@PostMapping("/replyInsert")
	public ResponseEntity<String> replyInsert(Integer boa_num, String rep_content, ReplyVO vo, HttpSession session) {
		
		ResponseEntity<String> entity = null;
		
		// 세션에서 아이디 가져와서 넣기
		String mem_id = ((MemberVO) session.getAttribute("loginStatus")).getMem_id();
		vo.setMem_id(mem_id);
		vo.setBoa_num(boa_num);
		vo.setRep_content(rep_content);
		
		replyService.replyInsert(vo);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
	}
	
}
