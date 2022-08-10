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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demo.domain.CartOrderInfo;
import com.demo.domain.CartVO;
import com.demo.domain.CartVOList;
import com.demo.domain.MemberVO;
import com.demo.domain.OrderVO;
import com.demo.domain.PaymentVO;
import com.demo.kakaopay.ApproveResponse;
import com.demo.kakaopay.ReadyResponse;
import com.demo.service.CartService;
import com.demo.service.KakaopayServiceImpl;
import com.demo.service.OrderService;
import com.demo.service.KakaopayServiceImpl;
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
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private KakaopayServiceImpl kakaopayServiceImpl;
	
	// 주문내역
	//  @RequestParam(value = "odr_amount", required = false) 
	@GetMapping("/orderListInfo")
	public void orderListInfo(@RequestParam("type") String type, Integer pdt_num, Integer odr_amount, HttpSession session, Model model) {
		
		String mem_id = ((MemberVO) session.getAttribute("loginStatus")).getMem_id();
		
		List<CartOrderInfo> orderInfoList = null;
		
		if(type.equals("cartOrder")) { // 장바구니 구매 Integer pdt_num, int odr_amount 사용안됨
			orderInfoList = orderService.cartOrderList(mem_id);
		}else if(type.equals("direct")) { // 직접구매 Integer pdt_num, int odr_amount 파라미터 사용
			orderInfoList = orderService.directOrderList(pdt_num, odr_amount);
			// 직접구매시 장바구니 데이터를 저장
			
			CartVO vo = new CartVO();
			vo.setMem_id(mem_id);
			vo.setPdt_num(pdt_num);
			vo.setCart_amount(odr_amount);
			
			cartService.cart_add(vo);
		}
		
		// 날짜폴더명의 \를 /로 변환하는 작업
		for(int i=0; i<orderInfoList.size(); i++) {
			String pdt_img_folder = orderInfoList.get(i).getPdt_img_folder().replace("\\", "/");
			orderInfoList.get(i).setPdt_img_folder(pdt_img_folder);
		}
		
		model.addAttribute("cartOrderList", orderInfoList);
		

	}
	
	// 주문저장하기
	@PostMapping("/orderSave")
	public String orderSave(OrderVO o_vo, PaymentVO p_vo, String type, HttpSession session) {
		
		String mem_id = ((MemberVO) session.getAttribute("loginStatus")).getMem_id();
		o_vo.setMem_id(mem_id);
		
		log.info("주문정보 : " + o_vo);
		log.info("결제정보 : " + p_vo);
		
		// 1) 무통장입금일 경우
		if(type.equals("무통장입금")) {
			
			o_vo.setPayment_status("입금전");
			
			p_vo.setPay_tot_price(o_vo.getOdr_total_price()); // 총 실 결제금액
			p_vo.setPay_rest_price(0); // 추가 입금금액
		}
		
		orderService.orderbuy(o_vo, p_vo);
		
		return "redirect:/user/order/orderComplete";
	}
	
	//카카오페이 결제요청. 바로구매는 에러발생된다.
	@GetMapping("/orderPay")
	public @ResponseBody ReadyResponse payReady(/*OrderVO o_vo,  PaymentVO p_vo,*/int totalAmount, HttpSession session, Model model) {
		
		//장바구니테이블에서 상품정보(상품명, 상품코드, 수량, 상품가격*수량=단위별 금액)
		String mem_id = ((MemberVO) session.getAttribute("loginStatus")).getMem_id();
		//장바구니에서 주문이 진행될 때
		List<CartVOList> cartList = cartService.cart_list(mem_id);
		String itemName = cartList.get(0).getPdt_name() + "외 " + String.valueOf(cartList.size() - 1) + " 개";
		int quantity = cartList.size();
		
		
		// 카카오페이서버에서 보낸온 정보.
		ReadyResponse readyResponse = kakaopayServiceImpl.payReady(itemName, quantity, mem_id, totalAmount);
		
		//model.addAttribute("tid", readyResponse.getTid());
		
		session.setAttribute("tid", readyResponse.getTid());
		log.info("결제고유번호: " + readyResponse.getTid());
		
		return readyResponse;
	}
	
	
	//결제승인요청 : 큐알코드를 찍고(결제요청) 카카오페이 서버에서 결제가 성공적으로 끝나면, 카카오페이 서버에서 호출하는 주소
	@GetMapping("/orderApproval")
	public String orderApproval(@RequestParam("pg_token") String pgToken, /*, @ModelAttribute("tid") String tid, OrderVO o_vo*/ HttpSession session ) {
		
		log.info("결제 승인요청 인증토큰: " + pgToken);
		//log.info("주문정보: " + o_vo);
		
		String tid = (String) session.getAttribute("tid");
		
		log.info("결제고유번호: " + tid);
		
		//카카오페이 결제하기
		ApproveResponse approveResponse =kakaopayServiceImpl.payApprove(tid, pgToken);

		return "redirect:/user/order/orderComplete";
	}
	
	
	@GetMapping("/orderComplete")
	public void orderComplete() {
		
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
