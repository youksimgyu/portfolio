package com.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.demo.service.UserBoardService;



@ControllerAdvice(basePackages = {"com.demo.controller"})
public class GlobalControllerAdvice {

	@Autowired
	private UserBoardService userBoardService; 
	
	@ModelAttribute
	public void categoryList(Model model) {
		
		model.addAttribute("mainCategoryList", userBoardService.getCategoryList());
	}
	
}
