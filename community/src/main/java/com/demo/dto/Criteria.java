package com.demo.dto;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class Criteria {

	private int pageNum; //현재페이지번호
	private int amount; // 게시물 출력개수
	
	private String type; // 검색종류(제목, 내용, 작성자 등)
	private String keyword; // 검색어
	
	//기본생성자 정의
	public Criteria() {
		this(1, 5);
	}

	//매개변수가 있는 생성자 정의
	public Criteria(int pageNum, int amount) {
		super();
		this.pageNum = pageNum;  // 1
		this.amount = amount;  // 10
	}
	
	//검색기능.xml mapper파일에서 사용될 메서드명. 메서드명의 규칙은 get이름() 형식이어야 한다.
	public String[] getTypeArr() {
		
		//   검색항목을 [제목 or 작성자] 선택시 전송온 값 :  "TW"
		return type == null? new String[] {} : type.split("");  // {"T", "W"}
	}
	
	//주소에 Criteria클래스 파라미터추가작업.  ?pageNum=값1&amount=값2&type=값3&keyword=값4
	public String getListLink() {
		
		// 메서드 체이닝문법.
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.getAmount())
				.queryParam("type", this.getType())
				.queryParam("keyword", this.getKeyword());

		return builder.toUriString();
	}
	
}
