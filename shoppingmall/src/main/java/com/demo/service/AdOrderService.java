package com.demo.service;

import java.util.List;
import java.util.Map;

import com.demo.domain.OrderVO;
import com.demo.domain.PaymentVO;
import com.demo.dto.Criteria;

public interface AdOrderService {
	
	List<OrderVO> getOrderList(Criteria cri, String startDate, String endDate);
	
	int getOrderTotalCount(Criteria cri, String startDate, String endDate);

	void orderStatusChange(Long odr_code, String odr_status);
	
	void orderDelete(Long odr_code);
	
//	void orderListDelete(List<Long> ordCodeArr);
	
	OrderVO getOrderInfo(Long odr_code);
	
	PaymentVO getPaymentInfo(Long odr_code);
	
	List<Map<String, Object>> getOrderProductInfo(Long odr_code);

}
