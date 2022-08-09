package com.demo.service;

import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.demo.kakaopay.ApproveResponse;
import com.demo.kakaopay.ReadyResponse;

import lombok.extern.log4j.Log4j;

// 인터페이스 없음

@Log4j
@Service
public class KakaopayServiceImpl {
	
	public ReadyResponse payReady(int totalAmount) {
		
		String order_id = "100";
		String itemName = "테스트상품";
		int quantity = 1;
		
		// 카카오 pay가 요청한 결제요청 request정보를 구성한다
		// 컬렉션의 Map인터페이스의 특징은 key, value 구성. key 1개당 value 1개라는 특징. ex) map.put("key", "value");
		// MultiValueMap : key 1개당 여러개의 value를 갖는 구조의 스피링프레임워크에서 제공하는 Map
		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
		parameters.add("cid", "TC0ONETIME");
		parameters.add("partner_order_id", order_id);
		parameters.add("partner_user_id", "shoppingmall");
		parameters.add("item_name", itemName);
		parameters.add("quantity", String.valueOf(quantity));
		parameters.add("total_amount", String.valueOf(totalAmount));
		parameters.add("tax_free_amount", "0");
		parameters.add("approval_url", "http://localhost:9090/user/order/orderComplete");
		parameters.add("cancel_url", "http://localhost:9090/user/order/orderCancel");
		parameters.add("faul_url", "http://localhost:9090/user/order/orderFail");
		
		// HttpEntity<T> 클래스 : HttpHeader와 HttpBody를 포함하는 클래스
		// HttpEntity<T> 클래스를 상속받아 구현한 클래스가 있다. RequestEntity, ResponseEntity
		// ResponseEntity 클래스 : HttpHeader, HttpBody, HttpStatus 3가지 정보를 관리한다
		HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(parameters, this.getHeaders());
		
//		RestTemplate ? spring 3.0에서 지원. http통신에 사용하는 기능을 제공한다
		// Http서버와 통신을 단순화하고, Restfull 원칙을 지킨다
		// 특징? 기계적이고, 반복적인 코드를 최대한 줄여줌. Restfull형식, json or xml 형태로 응답을 받아, 쉽게 사용이 가능
		
		// 외부 URL통신
		RestTemplate template = new RestTemplate();
		String url = "http://kapi.kakao.com/v1/payment/ready";
		
		// 첫번쨰요청
		// 메인(핵심). 카카오페이에서 응답해준 json데이터를 객체로 변환해서 받음
		ReadyResponse readyResponse = template.postForObject(url, requestEntity, ReadyResponse.class);
		
		return readyResponse;
	}
	
	// 2)Kakaopay request Header 정보설정
	private HttpHeaders getHeaders() {
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization", "KakaoAK 282c5e6754c8ea66184619df2ac81ea1");
		headers.set("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		return headers;
	}
	
	// 두번재요청 : 결제승인요청 메서드
	public ApproveResponse payApprove(String tid, String pgToken) {
		
		String order_id = "100";
		
		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
		parameters.add("cid", "TC0ONETIME");
		parameters.add("tid", tid);
		parameters.add("partner_order_id", order_id);
		parameters.add("partner_user_id", "shoppingmall");
		parameters.add("pg_token", pgToken);
		
		HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(parameters, this.getHeaders());
		
		// 외부 URL통신
		RestTemplate template = new RestTemplate();
		String url = "http://kapi.kakao.com/v1/payment/approve";
		
		// 두번째요청(결제승인)
		// 메인(핵심). 카카오페이에서 응답해준 json데이터를 객체로 변환해서 받음
		ApproveResponse readyResponse = template.postForObject(url, requestEntity, ApproveResponse.class);
		
		return readyResponse;
	}
	
}
