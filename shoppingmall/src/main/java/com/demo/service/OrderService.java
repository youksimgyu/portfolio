package com.demo.service;

import java.util.List;

import com.demo.domain.CartOrderInfo;

public interface OrderService {

	List<CartOrderInfo> cartOrderList(String mem_id);
	
}
