package com.gooddog.domain;

import org.springframework.data.mongodb.core.mapping.Document;

import lombok.Data;

@Data
@Document(collection="follower")
public class FrListt {
	
	private String following_id;
	private String following_name;
	private String following_nick; 
	private String following_img;
	 
	
	public FrListt(String following_id, String following_name, String following_nick, String following_img) {
		this.following_id = following_id;
		this.following_name = following_name;
		this.following_nick = following_nick; 
		this.following_img = following_img; 
	}
	public FrListt() {
		
	}

}
