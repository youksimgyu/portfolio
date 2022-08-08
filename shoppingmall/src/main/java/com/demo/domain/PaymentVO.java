package com.demo.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PaymentVO {

	
	// pay_code, odr_code, pay_method, pay_date,
	// pay_tot_price, pay_rest_price, pay_nobank_price, pay_nobank_user, pay_nobank
	private Integer pay_code;
	private Long odr_code;
	private String pay_method;
	private Date pay_date;
	private int pay_tot_price;
	private int pay_rest_price;
	private int pay_nobank_price;
	private String pay_nobank_user;
	private String pay_nobank;
	
}
