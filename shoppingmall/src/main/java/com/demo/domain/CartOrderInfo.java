package com.demo.domain;

import lombok.Data;

@Data
public class CartOrderInfo {

	// c.cart_code, c.pdt_num, c.mem_id, c.cart_amount,
    // p.pdt_name, p.pdt_price, p.pdt_discount, p.pdt_company, p.pdt_detail, p.pdt_img, p.pdt_img_folder, p.pdt_amount, p.pdt_buy
	
	private Integer pdt_num;
	private String mem_id;
	private int cart_amount;
	private String pdt_name;
	private int pdt_price;
	private int pdt_discount;
	private String pdt_company;
	private String pdt_detail;
	private String pdt_img;
	private String pdt_img_folder;
}
