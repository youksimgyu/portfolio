package com.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.demo.domain.CartVO;
import com.demo.domain.CartVOList;

public interface CartMapper {

	// 장바구니 추가
	void cart_add(CartVO vo);
	
	// 장바구니 목록
	List<CartVOList> cart_list(String mem_id);
	
	// 장바구니 수량변경 업데이트
	void cart_amount_update(@Param("cart_code") Long cart_code, @Param("cart_amount") int cart_amount);
	
	// 장바구니 삭제
	void cart_delete(Long cart_code);
	
	// 장바구니 전체 삭제
	void cart_total_delete(String mem_id);
}
