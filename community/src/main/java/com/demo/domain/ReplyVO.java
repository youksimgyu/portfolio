package com.demo.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {

	// REP_NUM, MEM_ID, BOA_NUM, REP_CONTENT, REP_DATE_REG
	// rep_num, mem_id, boa_num, rep_content, rep_date_reg
	
	private Long rep_num;
	private String mem_id;
	private Integer boa_num;
	private String rep_content;
	private Date rep_date_reg;
	
}
