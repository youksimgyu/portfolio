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
	
//	void orderListDelete(List<Long> ordCodeArr);
	
	// 주문정보
	OrderVO getOrderInfo(Long odr_code);
	// 결제정보
	PaymentVO getPaymentInfo(Long odr_code);
	// 주문상세
	List<Map<String, Object>> getOrderProductInfo(Long odr_code);
}
