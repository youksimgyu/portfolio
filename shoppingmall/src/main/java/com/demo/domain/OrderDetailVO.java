package com.demo.domain;

import lombok.Data;

@Data
public class OrderDetailVO {

	// odr_code, pdt_num, odr_amount, odr_price
	
	private Long odr_code; // db : 시퀀스사용
	private Integer pdt_num; 
	private int odr_amount;
	private int odr_price; // 상품가격 * 수량
	
}
