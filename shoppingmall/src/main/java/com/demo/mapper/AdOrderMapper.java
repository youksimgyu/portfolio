package com.demo.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.demo.domain.OrderVO;
import com.demo.domain.PaymentVO;
import com.demo.dto.Criteria;

public interface AdOrderMapper {

	List<OrderVO> getOrderList(@Param("cri") Criteria cri, @Param("startDate") String startDate,@Param("endDate") String endDate);
	
	int getOrderTotalCount(@Param("cri") Criteria cri, @Param("startDate") String startDate,@Param("endDate") String endDate);
	
	void orderStatusChange(@Param("odr_code") Long odr_code,@Param("odr_status") String odr_status);
	
	void orderDelete(Long odr_code);
	void orderDetailDelete(Long odr_code);
	void orderPaymentDelete(Long odr_code);
	
//	void orderListDelete(List<Long> ordCodeArr);
	
	// 주문정보
	OrderVO getOrderInfo(Long odr_code);
	// 결제정보
	PaymentVO getPaymentInfo(Long odr_code);
	// 주문상세
	List<Map<String, Object>> getOrderProductInfo(Long odr_code);
	
	// 주문상품 개별취소
	// 1) 주문상세테이블 주문개별상품 데이터 삭제
	void orderDetailProductDelete(@Param("odr_code") Long odr_code, @Param("pdt_num") Integer pdt_num);
	// 2) 주문테이블: 총주문가격 수정
	void orderTotalPriceChange(@Param("odr_code") Long odr_code, @Param("unit_price") int unit_price);
	// 3) 결제테이블 : 결제 총금액 수정
	void paymentTotalPriceChange(@Param("odr_code") Long odr_code, @Param("unit_price") int unit_price);
	// 디테일 상품에 모두 삭제되었는지 체크
	String restOrderCheck(Long odr_code);
}
