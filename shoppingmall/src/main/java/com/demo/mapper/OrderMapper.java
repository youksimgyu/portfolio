package com.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.demo.domain.CartOrderInfo;
import com.demo.domain.OrderVO;

public interface OrderMapper {

	List<CartOrderInfo> cartOrderList(String mem_id);
	
	// 주문하기 기능 : 주문테이블, 주문상세테이블, 장바구니테이블
	// 1) 주문테이블 저장하기
	void orderSave(OrderVO vo);
	
	// 2) 주문상세테이블 저장하기
	void orderDetailSave(@Param("odr_code") Long odr_code, @Param("mem_id") String mem_id);
	
	// 3) 장바구니 테이블 삭제는 CartMapper에서 가져와서 이용
	
}
