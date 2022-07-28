package com.demo.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demo.domain.CartVO;
import com.demo.domain.CartVOList;
import com.demo.domain.MemberVO;
import com.demo.service.CartService;
import com.demo.util.UploadFileUtils;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user/cart/*")
public class CartController {

	@Autowired
	private CartService cartService;
	
	// name이 servlet-context의  bean id와 같아야 함
	@Resource(name = "uploadPath")
	private String uploadPath; // "C:/Dev/upload"
	
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
	
	@GetMapping("/cart_list")
	public String cart_list(HttpSession session, Model model) {
		
		String mem_id = ((MemberVO) session.getAttribute("loginStatus")).getMem_id();
		
		List<CartVOList> cartList = cartService.cart_list(mem_id);
		
		// 날짜폴더명의 \를 /로 변환하는 작업
		for(int i=0; i<cartList.size(); i++) {
			String pdt_img_folder = cartList.get(i).getPdt_img_folder().replace("\\", "/");
			cartList.get(i).setPdt_img_folder(pdt_img_folder);
		}
		
		model.addAttribute("cartList", cartList);
		
		return "/user/cart/cartList"; //jsp경로 이름
	}
	
	@ResponseBody
	@GetMapping("/cart_amount_update1")
	public ResponseEntity<String> cart_amount_update1(Long cart_code, int cart_amount){
		ResponseEntity<String> entity = null;
		
		cartService.cart_amount_update(cart_code, cart_amount);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
	}


	@GetMapping("/cart_amount_update2")
	public String cart_amount_update2(Long cart_code, int cart_amount){
		
		cartService.cart_amount_update(cart_code, cart_amount);
		
		return "redirect:/user/cart/cart_list";
	}
	
	@GetMapping("/cart_delete")
	public String cart_delete(Long cart_code) {
		
		cartService.cart_delete(cart_code);
		
		return "redirect:/user/cart/cart_list";
	}
	
	@GetMapping("/cart_total_delete")
	public String cart_total_delete(HttpSession session) {
		
		String mem_id = ((MemberVO) session.getAttribute("loginStatus")).getMem_id();
		
		cartService.cart_total_delete(mem_id);
		
		return "redirect:/user/cart/cart_list";
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
