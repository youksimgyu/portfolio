package com.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.demo.dto.Criteria;
import com.demo.service.UserBoardService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user/board/*")
public class UserBoardController {
	
	@Autowired
	private UserBoardService userBoardService;
	

	@GetMapping("/boardList/{cat_c}")
	public String boardList(@PathVariable("cat_c") Integer cat_c, @ModelAttribute("cri") Criteria cri, Model model) {
		
		log.info("1차 카테고리 : " + cat_c);
		
		// 1차 카테고리에 해당되는 전체 글 가져오기
		
		return "/user/board/boardList";
	}

}
