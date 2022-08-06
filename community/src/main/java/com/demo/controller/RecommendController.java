package com.demo.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.demo.domain.BoardVO;
import com.demo.domain.MemberVO;
import com.demo.service.RecommendService;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/user/recommend/*")
public class RecommendController {

	@Autowired
	private RecommendService recomendService;
	
	@GetMapping("/boa_up_down")
	public ResponseEntity<Map<String, Object>> recommend(Integer boa_num, Integer type, BoardVO vo, HttpSession session){
		ResponseEntity<Map<String, Object>> entity = null;
		
		String mem_id = ((MemberVO) session.getAttribute("loginStatus")).getMem_id();
		vo.setMem_id(mem_id);
				
		// 추천,비추천일 때에 따라 update
		if(type == 1) {
			recomendService.boa_up(boa_num);
		} else if(type == 2) {
			recomendService.boa_down(boa_num);
		}
		
		
//		Map<String, Object> a = recomendService.select(boa_num);
		
		
//		Map<String, Object> b = new HashMap<String, Object>();
//		b.put("boa_up", Integer.parseInt(String.valueOf(a.get("boa_up"))));
//		b.put("boa_down", Integer.parseInt(String.valueOf(a.get("boa_down"))));
//		
//		log.info(b);
		
		
		entity = new ResponseEntity<Map<String,Object>>(recomendService.select(boa_num), HttpStatus.OK);
		
		return entity;
	}
	
	
}
