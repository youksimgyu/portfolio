package com.demo.service;

import java.util.List;

import com.demo.domain.OrderVO;
import com.demo.dto.Criteria;

public interface AdOrderService {
	
	List<OrderVO> getOrderList(Criteria cri);
	
	int getOrderTotalCount(Criteria cri);

	void orderStatusChange(Long odr_code, String odr_status);
	
	void orderDelete(Long ord_code);

}
