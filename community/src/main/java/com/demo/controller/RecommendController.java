package com.demo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.demo.domain.MemberVO;
import com.demo.domain.RecommendVO;
import com.demo.domain.Reply_RecommendVO;
import com.demo.service.RecommendService;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/user/recommend/*")
public class RecommendController {

	@Autowired
	private RecommendService recomendService;
	
	@GetMapping("/boa_up_down")
	public ResponseEntity<RecommendVO> recommend(Integer boa_num, Integer type, RecommendVO vo, HttpSession session){
		ResponseEntity<RecommendVO> entity = null;
		
		// 로그인한 세션 아이디 게시물 아이디에 넣기
		String rec_id = ((MemberVO) session.getAttribute("loginStatus")).getMem_id();
		vo.setRec_id(rec_id);
		vo.setBoa_num(boa_num);
		
		// 추천기능 데이터 여부
		RecommendVO recommendCheck = recomendService.getrec_id(vo);
		
		if(recommendCheck == null) { //데이터 없으면 추천기능 진행
		
			// 추천,비추천일 때에 따라 insert
			if(type == 1) {
				recomendService.insert1(vo);
			} else if(type == 2) {
				recomendService.insert2(vo);
			}
			
			entity = new ResponseEntity<RecommendVO>(recomendService.getRecommend(boa_num), HttpStatus.OK);
			
		} else if(recommendCheck != null) { // 이미 추천 했으면

			entity = new ResponseEntity<RecommendVO>(recommendCheck, HttpStatus.OK);

		}
		
		return entity;
	}
	
	@GetMapping("/rep_up_down")
	public ResponseEntity<Reply_RecommendVO> rep_recommend(Integer boa_num, Integer rep_num, Integer type, Reply_RecommendVO vo, HttpSession session){
		ResponseEntity<Reply_RecommendVO> entity = null;
		
		// 로그인한 세션 아이디 게시물 아이디에 넣기
		String rep_id = ((MemberVO) session.getAttribute("loginStatus")).getMem_id();
		vo.setRep_id(rep_id);
		vo.setRep_num(rep_num);
		vo.setBoa_num(boa_num);
		
		// 추천기능 데이터 여부
		Reply_RecommendVO recommendCheck = recomendService.getrep_id(vo);
		
		if(recommendCheck == null) { //데이터 없으면 추천기능 진행
			
			// 추천,비추천일 때에 따라 insert
			if(type == 1) {
				recomendService.insert3(vo);
			} else if(type == 2) {
				recomendService.insert4(vo);
			}
			
			log.info(recomendService.getReply_Recommend(rep_num));
			
			entity = new ResponseEntity<Reply_RecommendVO>(recomendService.getReply_Recommend(rep_num), HttpStatus.OK);
			
		} else { // 이미 추천 했으면

			entity = new ResponseEntity<Reply_RecommendVO>(recommendCheck, HttpStatus.OK);

		}
		
		return entity;
	}
	
	
}
