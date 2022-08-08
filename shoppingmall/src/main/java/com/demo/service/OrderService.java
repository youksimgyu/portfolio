package com.demo.service;

import java.util.List;

import com.demo.domain.CartOrderInfo;
import com.demo.domain.OrderVO;
import com.demo.domain.PaymentVO;

public interface OrderService {

	List<CartOrderInfo> cartOrderList(String mem_id);
	
	// 직접 주문목록
	List<CartOrderInfo> directOrderList(Integer pdt_num, int odr_amount);
	
	void orderbuy(OrderVO o_vo, PaymentVO p_vo);
	
}
