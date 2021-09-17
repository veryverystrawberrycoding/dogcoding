package com.gooddog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gooddog.domain.UserVO;
import com.gooddog.service.LogJoinService;

@RestController
public class LogJoinController { 
	
	@Autowired
	private LogJoinService logJoinService;
	
	//아이디 중복검사
	@PostMapping("/idOkay") 
	public String idOkay(UserVO vo) { 
		
		return logJoinService.idOkay(vo.getUser_id());
	}
	
	//닉네임 중복검사
	@PostMapping("nickOkay")
	public String nickOkay(UserVO vo) {
		return logJoinService.nickOkay(vo.getUser_nick());
	}	 
	
	//로그인
	@PostMapping("/loginComplete")
	public String login(UserVO vo, HttpServletRequest req, RedirectAttributes red) {
		HttpSession session = req.getSession();
		
			UserVO info = logJoinService.login(vo);
			red.addFlashAttribute("msg", false); 
		if(info==null) { 
			session.setAttribute("user", null); 
			return "redirect:/board/mainPage";   
		} else {    
			session.setAttribute("user", info);
			return "redirect:/board/mainPage";  
		} 
		  
	}
	 
	//로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/board/mainPage";  
	}
	    
	//회원가입
	@PostMapping("/join")
	public String join(UserVO vo, HttpServletRequest req) {
		HttpSession session = req.getSession();
		logJoinService.join(vo);
		return "redirect:/board/mainPage";
	}
} 
  