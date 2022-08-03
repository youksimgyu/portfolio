package com.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.domain.CartOrderInfo;
import com.demo.mapper.OrderMapper;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderMapper orderMapper;
	
	@Override
	public List<CartOrderInfo> cartOrderList(String mem_id) {
		// TODO Auto-generated method stub
		return orderMapper.cartOrderList(mem_id);
	}

}
