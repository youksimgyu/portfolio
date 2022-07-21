package com.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.demo.domain.CategoryVO;
import com.demo.service.AdCategoryService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/category/*")
public class AdCategoryController {

	@Autowired
	private AdCategoryService service;
	
	@GetMapping("/categoryInsert")
	public void categoryInsert() {
		
	}
	
	@PostMapping("/categoryInsert")
	public String categoryInsert(CategoryVO vo) {
		
		service.categoryInsert(vo);
		
		return "redirect:/admin/category/categoryList";
	}
	
}
