package com.demo.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {

//	mem_id, mem_name, mem_pw, mem_zipcode, mem_addr, mem_addr_d, mem_phone, 
//	mem_nick, mem_email, mem_accept_e, mem_point, 
//	mem_date_sub, mem_date_up, mem_date_last, mem_authcode
	
	private String mem_id;
	private String mem_name;
	private String mem_pw;
	private String mem_zipcode;
	private String mem_addr;
	private String mem_addr_d;
	private String mem_phone;
	private String mem_nick;
	private String mem_email;
	private String mem_accept_e;
	private int mem_point;
	private Date mem_date_sub;
	private Date mem_date_up;
	private Date mem_date_last;
	private String mem_authcode;

}
