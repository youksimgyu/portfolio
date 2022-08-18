package com.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.domain.OrderVO;
import com.demo.domain.PaymentVO;
import com.demo.dto.Criteria;
import com.demo.mapper.AdOrderMapper;

@Service
public class AdOrderServiceImpl implements AdOrderService {

	@Autowired
	private AdOrderMapper adOrderMapper;
	
	@Override
	public List<OrderVO> getOrderList(Criteria cri, String startDate, String endDate) {
		// TODO Auto-generated method stub
		return adOrderMapper.getOrderList(cri, startDate, endDate);
	}

	@Override
	public int getOrderTotalCount(Criteria cri, String startDate, String endDate) {
		// TODO Auto-generated method stub
		return adOrderMapper.getOrderTotalCount(cri, startDate, endDate);
	}

	@Override
	public void orderStatusChange(Long odr_code, String odr_status) {
		// TODO Auto-generated method stub
		adOrderMapper.orderStatusChange(odr_code, odr_status);
	}

	@Override
	public void orderDelete(Long odr_code) {
		// TODO Auto-generated method stub
		adOrderMapper.orderDelete(odr_code);
	}

	@Override
	public OrderVO getOrderInfo(Long odr_code) {
		// TODO Auto-generated method stub
		return adOrderMapper.getOrderInfo(odr_code);
	}

	@Override
	public PaymentVO getPaymentInfo(Long odr_code) {
		// TODO Auto-generated method stub
		return adOrderMapper.getPaymentInfo(odr_code);
	}

	

//	@Override
//	public void orderListDelete(List<Long> ordCodeArr) {
//		// TODO Auto-generated method stub
//		adOrderMapper.orderListDelete(ordCodeArr);
//	}

}
