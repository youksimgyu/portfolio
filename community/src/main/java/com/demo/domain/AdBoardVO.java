package com.demo.domain;

import java.util.Date;

import lombok.Data;

@Data
public class AdBoardVO {

	// ad_boa_num, ad_boa_c, ad_boa_p, ad_boa_title, ad_boa_content, ad_boa_img,
	// ad_boa_img_folder, ad_boa_date_reg, ad_boa_date_up
	
	private Integer ad_boa_num;
	private Integer ad_boa_c;
	private Integer ad_boa_p;
	private String ad_boa_title;
	private String ad_boa_content;
	private Date ad_boa_date_reg;
	private Date ad_boa_date_up;
	
}
