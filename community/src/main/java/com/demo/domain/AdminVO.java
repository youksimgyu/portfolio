package com.demo.domain;

import java.util.Date;

import lombok.Data;

@Data
public class AdminVO {

	//adm_id, adm_pw, adm_name, adm_date_login
	
	private String adm_id;
	private String adm_pw;
	private String adm_name;
	private Date adm_date_login;
}
