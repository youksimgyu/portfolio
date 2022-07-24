package com.demo.domain;

import lombok.Data;

@Data
public class CategoryVO {

	//cat_c, cat_name, cat_p, cat_boa_num, boa_up, boa_down
	
	private Integer cat_c;
	private String cat_name;
	private Integer cat_p;
	private Integer cat_boa_num;
	private Integer boa_up;
	private Integer boa_down;
}
