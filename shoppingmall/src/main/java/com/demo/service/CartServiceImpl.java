package com.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.domain.CartVO;
import com.demo.domain.CartVOList;
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

	@Override
	public List<CartVOList> cart_list(String mem_id) {
		// TODO Auto-generated method stub
		return cartMapper.cart_list(mem_id);
	}

	@Override
	public void cart_amount_update(Long cart_code, int cart_amount) {
		// TODO Auto-generated method stub
		cartMapper.cart_amount_update(cart_code, cart_amount);
	}

	@Override
	public void cart_delete(Long cart_code) {
		// TODO Auto-generated method stub
		cartMapper.cart_delete(cart_code);
	}

	@Override
	public void cart_total_delete(String mem_id) {
		// TODO Auto-generated method stub
		cartMapper.cart_total_delete(mem_id);
	}
	
}
