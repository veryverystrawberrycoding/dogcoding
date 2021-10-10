package com.gooddog.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gooddog.domain.BlackVO;
import com.gooddog.domain.UserVO;
import com.gooddog.service.LogJoinService;

@RestController
public class LogJoinController { 
	
	@Autowired
	private LogJoinService logJoinService;
	
	//아이디 중복검사
		@PostMapping("idOkay") 
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
		    public String login(UserVO vo, HttpServletRequest req, RedirectAttributes red, Model m) throws ParseException {
		       HttpSession session = req.getSession();
		       
		          UserVO info = logJoinService.login(vo);
		          red.addFlashAttribute("msg", false); 
		       if(info==null) { 
		          //session.setAttribute("user", null); 
		          return "z"; 
		          
		       } else if(info.getUser_id().equals("smith_O")){
		          session.setAttribute("user", info);
		          logJoinService.userLog(vo);
		          return info.getUser_id();
		          
		       } else {//현재 시간을 비교하여 블랙리스트 로그인 차단
		    	  BlackVO bvo = logJoinService.blackCheck(vo.getUser_id());
		    	  SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		    	  Date nowdate = java.sql.Timestamp.valueOf(LocalDateTime.now());
		    	  if(bvo==null) { 
		          session.setAttribute("user", info);
		          logJoinService.userLog(vo);
		          return info.getUser_id();   
		       } else {
		    	  if(nowdate.before(fm.parse(bvo.getBlack_end()))) {
		    	  return "ban"; 
		    	  
		       } else {  
		    	  session.setAttribute("user", info);
				  logJoinService.userLog(vo); 
				  return info.getUser_id();   
		    		  }
		    	  }
		       }   
		          
		    }  
		

		    
		//회원가입
		@PostMapping("/joinForm/join")
		public String join(UserVO vo, HttpServletRequest req) {
			HttpSession session = req.getSession();
			logJoinService.join(vo);
			return "redirect:/mainPage";
		} 
		
		
		
} 
  