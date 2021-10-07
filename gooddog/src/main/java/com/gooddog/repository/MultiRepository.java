package com.gooddog.repository;

import org.springframework.data.mongodb.repository.Meta;
import org.springframework.data.mongodb.repository.Query;
import org.springframework.data.mongodb.repository.ReactiveMongoRepository;
import org.springframework.data.mongodb.repository.Tailable;

import com.gooddog.domain.MultichatVO;

import reactor.core.publisher.Flux;

public interface MultiRepository extends ReactiveMongoRepository<MultichatVO, String> {
	  @Tailable 
	  @Query("{ $or: [{roomNum : ?0}, {roomNum : ?0}]}")  
	  @Meta(cursorBatchSize = 32)  
	  Flux<MultichatVO> mFindByRoomNum(String roomNum);
}
 