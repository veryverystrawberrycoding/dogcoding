package com.gooddog.controller;

import java.time.LocalDateTime;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.gooddog.domain.MultichatVO;
import com.gooddog.repository.MultichatRepository;

import lombok.RequiredArgsConstructor;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;
import reactor.core.scheduler.Schedulers;

@RequiredArgsConstructor
@Controller
public class MultichatController {
	
	private final MultichatRepository MultichatRepository;
	
	@CrossOrigin
	   @GetMapping(value="/Multichat/roomNum/{roomNum}", produces=MediaType.TEXT_EVENT_STREAM_VALUE) //SSE프로토콜
	   public Flux<MultichatVO> findByRoomNum(@PathVariable String roomNum) {
	    System.out.println("#######Multichat 컨트롤러 ##############");
	    System.out.println(MultichatRepository.mFindByRoomNum(roomNum)
	         .subscribeOn(Schedulers.boundedElastic()));
		return MultichatRepository.mFindByRoomNum(roomNum)
	         .subscribeOn(Schedulers.boundedElastic());   
	   }
	
	@CrossOrigin 
	   @PostMapping("/Multichat") 
	   public Mono<MultichatVO> setMsg(@RequestBody MultichatVO VO){
	      VO.setCreateAt(LocalDateTime.now());
	      System.out.println("#######Multichat save ##############");  
	      return MultichatRepository.save(VO);
	   }   
} 