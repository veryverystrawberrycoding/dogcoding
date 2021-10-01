package com.gooddog.domain;

import java.util.List;

import javax.persistence.Id;

import org.bson.types.ObjectId;
import org.springframework.data.mongodb.core.mapping.Document;

import lombok.Data;

@Data
@Document(collection="following")
public class FriendsVO {
	 

	@Id
	private ObjectId _id;
	 
	private String followingId;
	
	private List<FrList> frList;
	
	 

	public FriendsVO(String followingId, List<FrList> frlist) {
		this.followingId = followingId;	
		this.frList = frlist;  
	}
	
	public FriendsVO() {
		
	}
	
}
