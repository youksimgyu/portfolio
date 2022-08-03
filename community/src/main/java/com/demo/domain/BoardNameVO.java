package com.demo.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardNameVO {

	// boa_num, mem_name, cat_c, cat_name, cat_name_c, cat_p, boa_title, boa_content, boa_date_reg,
	// boa_date_up, eve_name, boa_hit, boa_rep_num, rep_up, rep_down, boa_up, boa_up
	private Integer boa_num;
	private String mem_name;
	private Integer cat_c;
	private String cat_name;
	private String cat_name_c;
	private Integer cat_p;
	private String boa_title;
	private String boa_content;
	private Date boa_date_reg;
	private Date boa_date_up;
	private String eve_name;
	private Integer boa_hit;
	private Integer boa_rep_num;
	private Integer rep_up;
	private Integer rep_down;
	private Integer boa_up;
	private Integer boa_down;
	
}
