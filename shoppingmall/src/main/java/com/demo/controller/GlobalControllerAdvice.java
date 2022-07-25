package com.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.demo.service.UserProductService;

import lombok.extern.log4j.Log4j;

@ControllerAdvice(basePackages = {"com.demo.controller"})
@Log4j
public class GlobalControllerAdvice {

	// com.demo.controller 패키지안에 존재하는 컨트롤러에서 주소요청을 받으면, categoryList메서드가 자동으로 호출되어,
	// 공통모델을 사용할 수가 있게 된다.
	
	
	@Autowired
	private UserProductService userProService;
	
	// 1차 카테고리 Model작업
	@ModelAttribute
	public void categoryList(Model model) {
		
		log.info("1차카테고리 모델작업");
		
		model.addAttribute("mainCategoryList", userProService.getCategoryList());
	}
	
}
