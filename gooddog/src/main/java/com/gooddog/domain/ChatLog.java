package com.gooddog.domain;

import org.springframework.data.annotation.Id;

import lombok.Data;

@Data
public class ChatLog {
	
	@Id
	private String id;
	
	private int chat_room;
	
	@Data
	public class chat{
		private String user_nick;
		private String chat;
		private String chat_date;
		
		
	}
	
	
	
}
