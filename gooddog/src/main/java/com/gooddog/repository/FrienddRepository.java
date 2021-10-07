package com.gooddog.repository;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.gooddog.domain.FriendssVO;

public interface FrienddRepository extends MongoRepository<FriendssVO, String>{
	public String findByFollowerId(String followingId);
}
 