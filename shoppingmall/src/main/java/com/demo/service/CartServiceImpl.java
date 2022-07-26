package com.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.domain.CartVO;
import com.demo.mapper.CartMapper;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartMapper cartMapper;

	@Override
	public void cart_add(CartVO vo) {
		// TODO Auto-generated method stub
		cartMapper.cart_add(vo);
	}
	
}
