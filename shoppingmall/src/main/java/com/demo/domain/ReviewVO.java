package com.demo.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {
	
	// TBL_REVIEW
	// RV_NUM, MEM_ID, PDT_NUM, RV_CONTENT, RV_SCORE, RV_DATE_REG
	// rv_num, mem_id, pdt_num, rv_content, rv_score, rv_date_reg
	// 시퀀스 SEQ_RV_NUM
	
	private Integer rv_num;
	private String mem_id;
	private Integer pdt_num;
	private String rv_content;
	private int rv_score;
	private Date rv_date_reg;
	
}
