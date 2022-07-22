package com.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.demo.domain.CategoryVO;
import com.demo.domain.ProductVO;
import com.demo.dto.Criteria;
import com.demo.dto.PageDTO;
import com.demo.service.AdCategoryService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/category/*")
public class AdCategoryController {

	@Autowired
	private AdCategoryService adCatService;
	
	@GetMapping("/categoryInsert")
	public void categoryInsert() {
		
	}
	
	@PostMapping("/categoryInsert")
	public String categoryInsert(CategoryVO vo) {
		
		adCatService.categoryInsert(vo);
		
		return "redirect:/admin/category/categoryList";
	}
	
	//상품목록:페이징,검색추가
	@GetMapping("/categoryList")
	public void productList(@ModelAttribute("cri") Criteria cri, Model model) {
		
		List<CategoryVO> productList = adCatService.getCategoryList(cri);
		
		// 페이징쿼리에 의한 상품목록
		model.addAttribute("productList", productList);
		
		// [prev] 1  2  3  4  5  [next]
		int totalCount = adCatService.getCategoryTotalCount(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, totalCount));
		
	}
	
}
