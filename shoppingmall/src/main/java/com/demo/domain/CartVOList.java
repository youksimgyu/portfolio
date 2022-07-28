package com.demo.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@ToString
@Setter
public class CartVOList {
	
	// CartVO 클래스 참조
	private Long cart_code;
	private Integer pdt_num;
	private String mem_id;
	private int cart_amount;
	
	// ProductVO 클래스 참조
	private String pdt_img_folder;
	private String pdt_img;
	private String pdt_name;
	private int pdt_price;
	
	// MemberVO 클래스 참조
	private int mem_point;
	
}
