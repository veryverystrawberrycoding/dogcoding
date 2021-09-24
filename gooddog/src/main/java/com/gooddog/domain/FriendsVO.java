package com.gooddog.domain;

import javax.persistence.Id;

import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection="friends")
public class FriendsVO {
	 

	@Id
	private String id;
	
	private String followingId;
	
	private String followerId;
	private boolean checkFriend;
	
	public FriendsVO(String followingId, String followerId, boolean checkFriend) {
		this.followingId = followingId;
		this.followerId = followerId;
		this.checkFriend = checkFriend;
	} 
	
}
