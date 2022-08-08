package com.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.demo.domain.CartOrderInfo;
import com.demo.domain.OrderVO;
import com.demo.domain.PaymentVO;
import com.demo.mapper.CartMapper;
import com.demo.mapper.OrderMapper;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderMapper orderMapper;
	
	@Autowired
	private CartMapper cartMapper;
	
	@Override
	public List<CartOrderInfo> cartOrderList(String mem_id) {
		// TODO Auto-generated method stub
		return orderMapper.cartOrderList(mem_id);
	}

	@Transactional
	@Override
	public void orderbuy(OrderVO o_vo, PaymentVO p_vo) {

		// 1) 주문테이블 저장하기. 시퀀스값
		orderMapper.orderSave(o_vo);
		
		// 2) 주문상세테이블 저장하기 (장바구니테이블에서 이동작업)
		Long odr_code = o_vo.getOdr_code();
		String mem_id = o_vo.getMem_id();
		
		orderMapper.orderDetailSave(odr_code, mem_id);
		
		// 3) 장바구니 테이블 삭제. 직접구매 진행시 장바구니에 데이터가 존재하지 않아서, 실행은 되지만 영향 x
		cartMapper.cart_total_delete(mem_id);
		
		// 4) 결제 정보 저장하기
		p_vo.setOdr_code(odr_code);
		orderMapper.paymentSave(p_vo);
	}

	@Override
	public List<CartOrderInfo> directOrderList(Integer pdt_num, int odr_amount) {
		// TODO Auto-generated method stub
		return orderMapper.directOrderList(pdt_num, odr_amount);
	}

}
