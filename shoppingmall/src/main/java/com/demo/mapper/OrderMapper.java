package com.demo.mapper;

import java.util.List;

import com.demo.domain.CartOrderInfo;

public interface OrderMapper {

	List<CartOrderInfo> cartOrderList(String mem_id);
	
}
