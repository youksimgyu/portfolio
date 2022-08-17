package com.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demo.domain.OrderVO;
import com.demo.dto.Criteria;
import com.demo.dto.PageDTO;
import com.demo.service.AdOrderService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/order/*")
public class AdOrderController {

	@Autowired
	private AdOrderService adOrderService;
	
	@GetMapping("/orderList")
	public void orderList(Criteria cri, Model model) {
		
		// 리스트 가져와서 jsp로 전송
		List<OrderVO> orderList = adOrderService.getOrderList(cri);
		model.addAttribute("orderList", orderList);
		
		// 전체 갯수 가져와서 페이지정보 jsp 전송
		int totalCount = adOrderService.getOrderTotalCount(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, totalCount));
	}
	
	@ResponseBody
	@GetMapping("/orderStatusChange")
	public ResponseEntity<String> orderStatusChange(Long odr_code, String odr_status) {
		ResponseEntity<String> entity = null;
		
		adOrderService.orderStatusChange(odr_code, odr_status);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
	}
	
	// 선택된 주문정보 삭제. ajax구문으로 배열값이 파라미터로 전송될 경우, 스프링 메서드에서는 파라미터 작업? @RequestParam("ordCodeArr[]")
	@ResponseBody
	@PostMapping("/orderCheckedDelete")
	public ResponseEntity<String> orderCheckedDelete(@RequestParam("ordCodeArr[]") List<Long> ordCodeArr) {
		ResponseEntity<String> entity = null;
		
		// 방법1
		for(int i=0; i<ordCodeArr.size(); i++) {
			//주문번호를 이용하여 삭제구문진행
			adOrderService.orderDelete(ordCodeArr.get(i));
		}
		
		// 방법2
		// mybatis에서 이구문을 작업을 해야한다. delete 주문테이블 where 주문번호  in (1,2,3,4,5)
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
	}
	
	
}
