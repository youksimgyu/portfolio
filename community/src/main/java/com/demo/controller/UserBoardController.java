package com.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demo.domain.BoardNameVO;
import com.demo.domain.BoardVO;
import com.demo.domain.CategoryVO;
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
	@GetMapping("/boardList/{cat_c}/{cat_name}")
	public String boardList(@PathVariable("cat_c") Integer cat_c, @PathVariable("cat_name") String cat_name, @ModelAttribute("cri") Criteria cri, Model model) {
		
		log.info("1차 카테고리 : " + cat_c);
		
		// 1차 카테고리에 해당되는 전체 글 가져오기
		List<BoardNameVO> getMainList = userBoardService.getMainBoardList(cat_c, cri);
		model.addAttribute("getMainList", getMainList);
		
		// 2차 카테고리 추출
		List<CategoryVO> getSubList = userBoardService.getSubCategoryList(cat_c);
		model.addAttribute("getSubList", getSubList);
		
		// [prev] 1  2  3  4  5  [next]
		int totalCount = userBoardService.getBoardTotalCount(cat_c, cri);
		model.addAttribute("pageMaker", new PageDTO(cri, totalCount));
		
		return "/user/board/boardList";
	}
	
	
	// 글 가져오기
	@GetMapping("/boardGet")
	public void boardGet(Integer boa_num, @ModelAttribute("cat_name") String cat_name, @ModelAttribute("cri") Criteria cri, Model model) {
		
		// 게시물 조회수 올리기
		userBoardService.boa_hit(boa_num);
		
		// 글 가져오기
		BoardNameVO boardGet = userBoardService.boardGet(boa_num);
		model.addAttribute("boardGet", boardGet);
		
		log.info(boardGet);
			
		
	}
	
	
}
