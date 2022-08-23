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
	
	void orderUnitProductCancel(Long odr_code, Integer pdt_num, int unit_price);
	
	// 디테일 상품에 모두 삭제되었는지 체크
	String restOrderCheck(Long odr_code);
	// tbl_order, tbl_payment 삭제
	void restOrderDelete(Long odr_code);

}
