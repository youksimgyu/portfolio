package com.demo.domain;

import java.util.Date;

import lombok.Data;

@Data
public class RecommendVO {

//	  rec_num       NUMBER      CONSTRAINT PK_REC_NUM PRIMARY KEY,
//    REC_ID          VARCHAR2(30) NOT NULL,
//    REC_UP          NUMBER,
//    REC_DOWN        NUMBER,
//    REGDATE         DATE DEFAULT SYSDATE
	
	private Long rec_num;
	private int boa_num;
	private String rec_id;
	private int rec_up;
	private int rec_down;
	private Date regdate;
	
	
}
