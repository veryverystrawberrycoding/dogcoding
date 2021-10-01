package com.gooddog.domain;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.mapping.Document;

import lombok.Data;

@Data
@Document(collection="following")
public class FrList {


	private String follower_id;
	private String follower_name;
	private String follower_nick; 
	private String follower_img;
	 
	
	public FrList(String follower_id, String follower_name, String follower_nick, String follower_img) {
		this.follower_id = follower_id;
		this.follower_name = follower_name;
		this.follower_nick = follower_nick; 
		this.follower_img = follower_img; 
	}
	public FrList() {
		
	}
}  