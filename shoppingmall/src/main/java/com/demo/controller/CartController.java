package com.demo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demo.domain.CartVO;
import com.demo.domain.MemberVO;
import com.demo.service.CartService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user/cart/*")
public class CartController {

	@Autowired
	private CartService cartService;
	
	// 장바구니 담기
	@ResponseBody
	@GetMapping("/cart_add")
	public ResponseEntity<String> cart_add(CartVO vo, HttpSession session){
		ResponseEntity<String> entity = null;
		
		log.info("장바구니 : " + vo);
		
		// 세션에서 로그인시 사용한 정보를 사용
		String mem_id = ((MemberVO) session.getAttribute("loginStatus")).getMem_id();
		vo.setMem_id(mem_id);
		
		cartService.cart_add(vo);
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
	}
	
}
