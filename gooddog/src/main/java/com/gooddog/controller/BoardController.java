package com.gooddog.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@RequestMapping("/chartbox") //http://localhost:8082/board/list
	public void chatbox() {
		logger.info("chartbox");
	}
	
	//@@@@@@@@@@@@@@@@@나머지 컨트롤@@@@@@@@@@@@@@@@@@//
	@RequestMapping("/register") //http://localhost:8082/board/register
	public void registerForm() {
		logger.info("registerForm");
	}
	
	@RequestMapping("/list") //http://localhost:8082/board/list
	public void list() {
		logger.info("list");
	}
	
	@RequestMapping("/index") //http://localhost:8082/board/index
	public void view() {
		logger.info("index");
	}
	
	@RequestMapping("/chat") //http://localhost:8082/board/chat
	public void chat() {
		logger.info("chat");
	}
	
	@RequestMapping("/friend") //http://localhost:8082/board/friend
	public void friend() {
		logger.info("friend");
	}
//	@RequestMapping("/mapList") //http://localhost:8082/board/mapList
//	public void mapList() {
//		logger.info("mapList");
//	}
	
//	@RequestMapping("/mapView") //http://localhost:8082/board/mapView
//	public void mapView() {
//		logger.info("mapView");
//	}
	
	@RequestMapping("/mainPage") //http://localhost:8082/board/mainPage
	public void mainPage() {
		logger.info("mainPage");
	}
	
	@RequestMapping("/loginForm") //http://localhost:8082/board/loginForm
	public void loginForm() {
		logger.info("loginForm");
	}
	
	@RequestMapping("/joinForm") //http://localhost:8082/board/joinForm
	public void joinForm() {
		logger.info("joinForm");
	}
	

	
//	@RequestMapping("/galleryList") //http://localhost:8082/board/galleryList
//	public void galleryList() {
//		logger.info("galleryList");
//	}
	
//	@RequestMapping("/galleryView") //http://localhost:8082/board/galleryView
//	public void galleryView() {
//		logger.info("galleryView");
//	}
	
	@RequestMapping("/callingInsert") //http://localhost:8082/board/callingInsert
	public void callingInsert() {
		logger.info("callingInsert");
	}
	
	@RequestMapping("/callingList") //http://localhost:8082/board/callingList
	public void callingList() {
		logger.info("callingList");
	}
	
	@RequestMapping("/callingView") //http://localhost:8082/board/callingView
	public void callingView() {
		logger.info("callingView");
	}
	
	@RequestMapping("/bookList") //http://localhost:8082/board/bookList
	public void bookList() {
		logger.info("bookList");
	}
	
	@RequestMapping("/bookView") //http://localhost:8082/board/bookView
	public void bookView() {
		logger.info("bookView");
	}
	
	@RequestMapping("/mypageDog") //http://localhost:8082/board/mypageDog
	public void mypageDog() {
		logger.info("mypageDog");
	}
	
	@RequestMapping("/mypageFind") //http://localhost:8082/board/mypageFind
	public void mypageFind() {
		logger.info("mypageFind");
	}
	
	@RequestMapping("/mypageFriend") //http://localhost:8082/board/mypageFriend
	public void mypageFriend() {
		logger.info("mypageFriend");
	}
	
	@RequestMapping("/mypageModify") //http://localhost:8082/board/mypageModify
	public void mypageModify() {
		logger.info("mypageModify");
	}
}