package com.gooddog.domain;

import java.util.List;

import javax.persistence.Id;

import org.bson.types.ObjectId;
import org.springframework.data.mongodb.core.mapping.Document;

import lombok.Data;

@Data
@Document(collection="follower")
public class FriendssVO {
	
	@Id
	private ObjectId _id;
	 
	private String followerId;
	
	private List<FrListt> frListt;
	
	 

	public FriendssVO(String followerId, List<FrListt> frlistt) {
		this.followerId = followerId;	
		this.frListt = frlistt;  
	}
	
	public FriendssVO() {
		
	}
	

}
