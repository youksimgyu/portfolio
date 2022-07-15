package com.demo.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class AdminLoginDTO {

	private String admin_id;
	private String admin_pw;
	
}
