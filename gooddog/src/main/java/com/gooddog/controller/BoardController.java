package com.gooddog.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gooddog.entity.TestEntity;
import com.gooddog.service.JoinService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	private JoinService joinService;
	
	@RequestMapping("/register") //http://localhost:8082/board/register
	public void registerForm() {
		logger.info("registerForm");
	}
	
	@RequestMapping("/list")
	public void list() {
		logger.info("list");
	}
	 
	@RequestMapping("/index") //http://localhost:8082/board/index
	public void view() {
		logger.info("index");
	}
	 
	@PostMapping("/list/{pid}")
	public ResponseEntity<TestEntity> readTest (@PathVariable int pid) {
		System.out.println(pid);
		System.out.println(joinService.testJoin(pid));
		return ResponseEntity.ok(joinService.testJoin(pid)); 
	} 

}