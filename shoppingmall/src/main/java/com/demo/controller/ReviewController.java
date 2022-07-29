package com.demo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.demo.domain.MemberVO;
import com.demo.domain.ReviewVO;
import com.demo.dto.Criteria;
import com.demo.dto.PageDTO;
import com.demo.service.ReviewService;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/user/review/*")
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	// 상품 후기 쓰기
	// consumes : 클라이언트에서 보내는 데이터 타입지정
	// produces : 서버에서 클라이언트로 보내는 데이터 타입지정
	// @RequestBody : json데이터를 ReviewVO vo 객체로 변환하는 작업
	@PostMapping(value = "/new", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ReviewVO vo, HttpSession session) {
		ResponseEntity<String> entity = null;
		
		// 세션에서 아이디 가져와서 넣기
		String mem_id = ((MemberVO) session.getAttribute("loginStatus")).getMem_id();
		vo.setMem_id(mem_id);
		
		reviewService.create(vo);
		
		log.info("상품후기 : " + vo);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
	}
	
	// 상품 후기 수정
	
	
	// 상품 후기 삭제
	
	
	// 상품 후기 1) 목록데이터 2) 페이징징보(2개의 데이터) -> json포맷으로 클라이언트에게 보내는 작업
	@GetMapping("/list/{pdt_num}/{page}")
	public ResponseEntity<Map<String, Object>> reviewList(@PathVariable("pdt_num") Integer pdt_num, @PathVariable("page") Integer page){
		ResponseEntity<Map<String, Object>> entity = null;
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 페이지에 대한 값만 가져온다
		Criteria cri = new Criteria(); //검색필드가 필요 없으므로, 메서드의 파라미터로 사용하지 않고, 객체를 직접생성한다
		cri.setPageNum(page);
		
		// 댓글 목록 가져온 작업
		List<ReviewVO> list =  reviewService.list(pdt_num, cri);
		map.put("list", list);
		
		// 페이지정보
		PageDTO pageMaker = new PageDTO(cri, reviewService.getReviewTotalCount(pdt_num));
		map.put("pageMaker", pageMaker);
		
		entity = new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
		
		return entity;
	}
	
	
}
