package com.demo.controller;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.demo.domain.BoardNameVO;
import com.demo.domain.RecommendVO;
import com.demo.dto.Criteria;
import com.demo.dto.PageDTO;
import com.demo.service.RecommendService;
import com.demo.service.UserBoardService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private UserBoardService userBoardService;
	
	@Autowired
	private RecommendService recomendService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	// 전체 글 가져오기
	@GetMapping("/")
	public String home(Locale locale, Model model, @ModelAttribute("cri") Criteria cri) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		List<BoardNameVO> boardList = userBoardService.getBoardList(cri);
		model.addAttribute("boardList", boardList);
		
		List<RecommendVO> getRecommendList = recomendService.select(cri);
		model.addAttribute("getRecommendList", getRecommendList);
		
		// [prev] 1  2  3  4  5  [next]
		int totalCount = userBoardService.getTotalBoardTotalCount(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, totalCount));
		
		return "/user/main";
	}
	
}
