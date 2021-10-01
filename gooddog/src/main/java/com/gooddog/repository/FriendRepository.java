package com.gooddog.repository;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.gooddog.domain.FriendsVO;

public interface FriendRepository extends MongoRepository<FriendsVO, String> {
	public String findByFollowingId(String followingId);
}
