package com.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.demo.domain.OrderVO;
import com.demo.dto.Criteria;

public interface AdOrderMapper {

	List<OrderVO> getOrderList(Criteria cri);
	
	int getOrderTotalCount(Criteria cri);
	
	void orderStatusChange(@Param("odr_code") Long odr_code,@Param("odr_status") String odr_status);
	
	void orderDelete(Long ord_code);
	
}
