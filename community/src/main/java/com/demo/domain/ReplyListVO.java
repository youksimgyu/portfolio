package com.demo.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyListVO {

	private Long rep_num;
	private String mem_id;
	private String mem_name;
	private Integer boa_num;
	private String rep_content;
	private Date rep_date_reg;
}
