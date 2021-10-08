package com.gooddog.domain;

import lombok.Data;

@Data
public class BadcontentVO {
	//신고 번호
	private int bad_no;
	//신고당한 갤러리
	private int gal_no;
	//신고 아이디 
	private String u_id;
	//신고받은 날짜
	private String date;
	
	//회원 아이디
	
	private int limitStart;
	private int listCount;
}
