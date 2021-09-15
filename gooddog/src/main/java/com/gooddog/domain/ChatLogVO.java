package com.gooddog.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ChatLogVO {
	//채팅 로그 번호
	private int chat_no;
	//채팅 로그 내용
	private String chat_content;
	//채팅 로그 날짜
	private String chat_date;
	
	//회원 아이디
	private String user_id;
} 
