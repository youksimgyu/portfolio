package com.demo.kakaopay;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class ReadyResponse {

	private String tid;
	private String next_redirect_pc_url;
	private String partner_order_id;
}
