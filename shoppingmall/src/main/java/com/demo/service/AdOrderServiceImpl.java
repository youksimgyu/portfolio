package com.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.domain.OrderVO;
import com.demo.dto.Criteria;
import com.demo.mapper.AdOrderMapper;

@Service
public class AdOrderServiceImpl implements AdOrderService {

	@Autowired
	private AdOrderMapper adOrderMapper;
	
	@Override
	public List<OrderVO> getOrderList(Criteria cri) {
		// TODO Auto-generated method stub
		return adOrderMapper.getOrderList(cri);
	}

	@Override
	public int getOrderTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return adOrderMapper.getOrderTotalCount(cri);
	}

	@Override
	public void orderStatusChange(Long odr_code, String odr_status) {
		// TODO Auto-generated method stub
		adOrderMapper.orderStatusChange(odr_code, odr_status);
	}

	@Override
	public void orderDelete(Long ord_code) {
		// TODO Auto-generated method stub
		adOrderMapper.orderDelete(ord_code);
	}

}
