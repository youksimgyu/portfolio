package com.demo.domain;

import lombok.Data;

@Data
public class CategoryVO {

	// cat_num, cat_name, cat_boa_num, boa_up, boa_down
	
	private Integer cat_num;
	private String cat_name;
	private Integer cat_boa_num;
	private Integer boa_up;
	private Integer boa_down;
}
