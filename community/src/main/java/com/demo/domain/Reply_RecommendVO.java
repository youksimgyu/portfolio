package com.demo.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Reply_RecommendVO {
	
	// REC_REC_NUM, REP_NUM, REP_ID, REP_UP, REP_DOWN, REPDATE
	// rec_rec_num, rep_num, rep_id, rep_up, rep_down, repdate
	
	private Long rec_rec_num;
	private Integer rep_num;
	private Integer boa_num;
	private String rep_id;
	private Integer rep_up;
	private Integer rep_down;
	private Date repdate;

}
