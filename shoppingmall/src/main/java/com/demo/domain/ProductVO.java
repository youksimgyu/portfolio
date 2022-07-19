package com.demo.domain;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProductVO {
	
	// pdt_num, cg_num_1, cg_num_2, pdt_name, pdt_price, pdt_discount, pdt_company, pdt_detail,
	// pdt_img, pdt_amount, pdt_buy, pdt_date_sub, pdt_date_up

	private Integer pdt_num;
	private Integer cg_num_1;
	private Integer cg_num_2;
	private String pdt_name;
	private int pdt_price;
	private int pdt_discount;
	private String pdt_company;
	private String pdt_detail;
	private String pdt_img; // 상품이미지 파일이름.
	private String pdt_img_folder;
	private int pdt_amount;
	private String pdt_buy;
	private Date pdt_date_sub;
	private Date pdt_date_up;
	
	// 상품이미지 파일(업로드)
	// <input type="file" class="form-control" name="uploadFile" multiple>
	// name이 값을 가져옴
	private MultipartFile uploadFile;
	
}
