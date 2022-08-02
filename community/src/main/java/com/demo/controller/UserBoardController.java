package com.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demo.domain.BoardVO;
import com.demo.dto.Criteria;
import com.demo.dto.PageDTO;
import com.demo.service.UserBoardService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user/board/*")
public class UserBoardController {
	
	@Autowired
	private UserBoardService userBoardService;
	

	// 1차 카테고리 기준 전체 글
	@GetMapping("/boardList/{cat_c}")
	public String boardList(@PathVariable("cat_c") Integer cat_c, @ModelAttribute("cri") Criteria cri, Model model) {
		
		log.info("1차 카테고리 : " + cat_c);
		
		// 1차 카테고리에 해당되는 전체 글 가져오기
		List<BoardVO> getMainList = userBoardService.getMainBoardList(cat_c, cri);
		model.addAttribute("getMainList", getMainList);
		
		// [prev] 1  2  3  4  5  [next]
		int totalCount = userBoardService.getBoardTotalCount(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, totalCount));
		
		return "/user/board/boardList";
	}

}
