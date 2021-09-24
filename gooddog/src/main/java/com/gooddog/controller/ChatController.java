package com.gooddog.controller;
 
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.UnknownHostException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gooddog.chat.ChatServer;
import com.gooddog.service.AdminService;

import helper.WebHelper;


@Component
@ComponentScan("helper")
@Controller
public class ChatController {
 
	@Autowired
	WebHelper web;
	
	@Autowired
	AdminService AdminService;
	
	@RequestMapping(value = "/chatpage.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView chatpage(Model m, HttpServletResponse response) {
		 
		//  기능 툴	
		web.init(response);
		
		return new ModelAndView("/chatpage") ;
	}
	
	@RequestMapping(value = "/chatbox.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView chatbox(Model m, HttpServletResponse response) {
		 
		//  기능 툴	
		web.init(response);
		
		return new ModelAndView("/chatbox") ;
	}
	
	@RequestMapping(value = "/chatroom.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView chatroom(Model m, HttpServletResponse response) {
		 
		//  기능 툴	
		web.init(response);
		
		// 테스트용 
		web.setSession("username", "홍길홍길");
		return new ModelAndView("/chatroom") ;
	}
	
	
	/**
	 * 채팅룸 시작
	 * @param m
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/chatStart1.do", method = {RequestMethod.GET, RequestMethod.POST})
	public  ModelAndView chatStart1(Model m, HttpServletResponse response) {
		 
		//  기능 툴	
		web.init(response);
		
		String chatRoomName = web.getString("chatRoomName", "");		// 채팅방 이름
		String userName = web.getString("userName", "");				// 사용자 이름
		
		if(chatRoomName == "") {
			return web.redirect(null, "채팅방 이름을 입력하세요");
		}
		
		if(userName == "") {
			return web.redirect("loginForm", "로그인 후 사용가능합니다.");		// 로그인 페이지 넣을 곳 맞는지 낼 확인
		}
		
		System.out.println("사용자 세션값 확인" +web.getSession("username"));
	  
	    // 위 소켓에 사용자 접속 
	    Socket socket = null;
	    try {
	    	socket = new Socket("127.0.0.1", 7070);
			System.out.println("접속 확인");
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (socket != null) {
				try{
					socket.close();
					System.out.println("소켓닫음");

				}catch (IOException ex) {
					ex.printStackTrace();
					// 무시한다
				}
			}
		}



	
		
		System.out.println("채팅방 이름 :"+chatRoomName);
		System.out.println("사용자 이름  :"+userName);
		

		String url = web.getRootPath() + "/chatbox.do";
		return web.redirect(url, null);
	//	return new ModelAndView("/chatbox") ;
	}
	
	
		
		@RequestMapping(value = "/SocketStart.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView SocketStart(Model m, HttpServletResponse response) {
		 
		//  기능 툴	
		web.init(response);

		   try {
	           int socketPort = 7070; // 소켓 포트 설정용
	           ServerSocket serverSocket = new ServerSocket(socketPort); // 서버 소켓 만들기
	           // 서버 오픈 확인용
	           System.out.println("socket : " + socketPort + "으로 서버가 열렸습니다");

	           // 소켓 서버가 종료될 때까지 무한루프
	           while(true) {
		                Socket socketUser = serverSocket.accept(); // 서버에 클라이언트 접속 시
		                // Thread 안에 클라이언트 정보를 담아줌
		                
		                System.out.println("서버 접속 확인");
		                System.out.println("사용자 정보 :"+socketUser.getInetAddress()+"//"+socketUser.getLocalPort()+"//"+socketUser.getLocalAddress());
		                
		                Thread thd = new ChatServer(socketUser);
		                
		                thd.start(); // Thread 시작
				            }                 
				  
			} catch (IOException e) {
			e.printStackTrace(); // 예외처리
			}
		   
		return new ModelAndView("/chatroom") ;
	}
	
	@RequestMapping(value = "/chatAno.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView chatAno(Model m, HttpServletResponse response) {
		 
		//  기능 툴	
		web.init(response);
		
		return new ModelAndView("/chatAno") ;
	}
	
	@RequestMapping(value = "/chattest.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView chattest(Model m, HttpServletResponse response) {
		 
		//  기능 툴	
		web.init(response);
		
		return new ModelAndView("/chattest") ;
	}
}