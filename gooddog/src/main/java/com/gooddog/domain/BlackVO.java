package com.gooddog.domain;

import lombok.Data;

@Data
public class BlackVO {
	//블랙리스트 번호
	private int black_no;
	//블랙리스트 시작일
	private String black_start;
	//블랙리스트 끝나는 날짜
	private String black_end;
	//블랙리스트 이유
	private String black_content;
	
	//회원 아이디
	private String user_id;
	
	private int limitStart;
	private int listCount;
	  
}
