package com.demo.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demo.domain.CartOrderInfo;
import com.demo.domain.MemberVO;
import com.demo.domain.OrderVO;
import com.demo.service.OrderService;
import com.demo.util.UploadFileUtils;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/user/order/*")
@Log4j
public class OrderController {

	// name이 servlet-context의  bean id와 같아야 함
	@Resource(name = "uploadPath")
	private String uploadPath; // "C:/Dev/upload"
	
	@Autowired
	private OrderService orderService;
	
	// 주문내역
	@GetMapping("/orderListInfo")
	public void orderListInfo(HttpSession session, Model model) {
		
		String mem_id = ((MemberVO) session.getAttribute("loginStatus")).getMem_id();
		
		List<CartOrderInfo> cartOrderList = orderService.cartOrderList(mem_id);
		
		// 날짜폴더명의 \를 /로 변환하는 작업
		for(int i=0; i<cartOrderList.size(); i++) {
			String pdt_img_folder = cartOrderList.get(i).getPdt_img_folder().replace("\\", "/");
			cartOrderList.get(i).setPdt_img_folder(pdt_img_folder);
		}
		
		model.addAttribute("cartOrderList", cartOrderList);
	}
	
	// 주문저장하기
	@PostMapping("/orderSave")
	public String orderSave(OrderVO vo, HttpSession session) {
		
		String mem_id = ((MemberVO) session.getAttribute("loginStatus")).getMem_id();
		vo.setMem_id(mem_id);
		
		log.info("주문정보 : " + vo);
		
		orderService.orderbuy(vo);
		
		return "/";
	}
	
	// 상품목록에서 이미지 보여주기
	@ResponseBody
	@GetMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String folderName, String fileName){
		
//		log.info("폴더이름: " + folderName);
//		log.info("파일이름: " + fileName);
		
		// 이미지를 바이트배열로 읽어오는 작업
		return UploadFileUtils.getFile(uploadPath, folderName + "\\" + fileName);
	}
	
}
