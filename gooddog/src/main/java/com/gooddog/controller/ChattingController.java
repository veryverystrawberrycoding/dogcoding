package com.gooddog.controller;

import java.time.LocalDateTime;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.gooddog.domain.ChatLog;
import com.gooddog.domain.MultichatVO;
import com.gooddog.domain.UserVO;
import com.gooddog.repository.ChatRepository;
import com.gooddog.repository.MultiRepository;

import lombok.RequiredArgsConstructor;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;
import reactor.core.scheduler.Schedulers;



@RequiredArgsConstructor
@RestController
public class ChattingController {
 
	private final ChatRepository chatRepository;
	private final MultiRepository multiRepository;
	 
	//귓속말 할 때 사용함
	@GetMapping(value="/chat/receiver/{receiver}", produces=MediaType.TEXT_EVENT_STREAM_VALUE) //SSE프로토콜
	public Flux<ChatLog> getMeg(UserVO vo, @PathVariable String receiver, HttpServletRequest req) {
		HttpSession session = req.getSession();  
		UserVO sessionvo = (UserVO)session.getAttribute("user");
		vo.setUser_id(sessionvo.getUser_id());
		String sender = vo.getUser_id();
		System.out.println("화긴");
		System.out.println(chatRepository.mFindBySender(sender, receiver).subscribeOn(Schedulers.boundedElastic()));
		return chatRepository.mFindBySender(sender, receiver) 
			.subscribeOn(Schedulers.boundedElastic());
	} 
	
	@CrossOrigin  
	@PostMapping("/chat") 
	public Mono<ChatLog> setMsg(@RequestBody ChatLog chat){
		chat.setCreateAt(LocalDateTime.now());
		return chatRepository.save(chat);
	}
	
	@CrossOrigin
	@PostMapping("/multiChat") 
	public Mono<MultichatVO> addMsg(@RequestBody MultichatVO vo, HttpServletRequest req){
		vo.setCreateAt(LocalDateTime.now());
		HttpSession session = req.getSession();  
		UserVO sessionvo = (UserVO)session.getAttribute("user");
		vo.setSender(sessionvo.getUser_id());
		vo.setRoomNum("one");  
		return multiRepository.save(vo);   
	}
	 
	@CrossOrigin
	@GetMapping(value="/chat/multi/{roomNum}", produces=MediaType.TEXT_EVENT_STREAM_VALUE) //SSE프로토콜
	public Flux<MultichatVO> findByRoomNum(@PathVariable String roomNum) {
		return multiRepository.mFindByRoomNum(roomNum)
			.subscribeOn(Schedulers.boundedElastic()); 
	} 
	
}
