package com.gooddog.repository;

import org.springframework.data.mongodb.repository.Query;
import org.springframework.data.mongodb.repository.ReactiveMongoRepository;
import org.springframework.data.mongodb.repository.Tailable;

import com.gooddog.domain.ChatLog;

import reactor.core.publisher.Flux;
 
public interface ChatRepository extends ReactiveMongoRepository<ChatLog, String> {
	
  @Tailable //커서를 안닫고 계속 유지한다. 클라이언트와 서버사이에  HTTP가 아닌 SSE
  @Query("{ $or: [{sender : ?0, receiver : ?1}, {sender : ?1, receiver : ?0}]}")
  Flux<ChatLog> mFindBySender(String sender, String receiver); 
   
  @Tailable 
  @Query("{ $or :[{roomNum : ?0}, roomNum : ?0}]}")  
  Flux<ChatLog> mFindByRoomNum(Integer roomNum);
    
 }   
    
 
  