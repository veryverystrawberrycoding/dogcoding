package com.gooddog.domain;

import java.time.LocalDateTime;


import javax.persistence.Id;

import org.springframework.data.mongodb.core.mapping.Document;

import lombok.Data;

@Data
@Document(collection="chat")
public class MultichatVO {
	  
 
	@Id
	private String id;
	 
	private String roomNum;
	  
	private String sender;  
	
	private String msg;
	
	private LocalDateTime createAt;


	
}
 