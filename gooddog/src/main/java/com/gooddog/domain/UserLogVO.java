package com.gooddog.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserLogVO {
	//유저로그 번호
	private int log_no;
	//유저로그 기록내용
	private String log_content;
	//유저로그 날짜
	private String log_date;
	
	//회원 아이디
	private int user_id;
}
