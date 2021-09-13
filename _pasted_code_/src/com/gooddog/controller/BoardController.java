package com.gooddog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sun.org.slf4j.internal.LoggerFactory;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
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
	
	@RequestMapping("/chat") //http://localhost:8082/board/index
	public void chat() {
		logger.info("chat");
	}
	
	@RequestMapping("/friend") //http://localhost:8082/board/index
	public void friend() {
		logger.info("friend");
	}
	
}