package com.demo.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {

	// mem_id, mem_pw, mem_phone, mem_name,
    // mem_email, mem_date_join, mem_date_up, mem_date_login
	
	private String mem_id;
	private String mem_pw;
	private String mem_phone;
	private String mem_name;
	private String mem_email;
	private Date mem_date_join;
	private Date mem_date_up;
	private Date mem_date_login;
	
}
