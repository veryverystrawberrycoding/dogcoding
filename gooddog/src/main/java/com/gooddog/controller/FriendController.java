package com.gooddog.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gooddog.domain.UserVO;
import com.gooddog.service.FriendService;

@RestController
public class FriendController {
	
	@Autowired
	private FriendService friendService;
	
	@PostMapping("fdRecommend1")
	public List<HashMap<String,Object>> fdRecommend1(UserVO vo, HttpServletRequest req){
		 HttpSession session = req.getSession();
		 UserVO sessionvo = (UserVO)session.getAttribute("user");
	     vo.setUser_id(sessionvo.getUser_id());
	     
	     return friendService.fdRecommend1(vo);
		
	}

}
