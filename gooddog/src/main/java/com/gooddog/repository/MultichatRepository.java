package com.gooddog.repository;

import org.springframework.data.mongodb.repository.Query;
import org.springframework.data.mongodb.repository.ReactiveMongoRepository;
import org.springframework.data.mongodb.repository.Tailable;

import com.gooddog.domain.MultichatVO;

import reactor.core.publisher.Flux;

public interface MultichatRepository extends ReactiveMongoRepository<MultichatVO, String>{
	  @Tailable  
	  @Query("{roomNum : ?0}")   
	  Flux<MultichatVO> mFindByRoomNum(String roomNum);
}    
   