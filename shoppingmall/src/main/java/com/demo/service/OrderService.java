package com.demo.service;

import java.util.List;

import com.demo.domain.CartOrderInfo;
import com.demo.domain.OrderVO;

public interface OrderService {

	List<CartOrderInfo> cartOrderList(String mem_id);
	
	void orderbuy(OrderVO vo);
	
}
