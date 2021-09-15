package com.gooddog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.gooddog.domain.UserVO;
import com.gooddog.service.LogJoinService;

@RestController
public class LogJoinController { 
	
	@Autowired
	private LogJoinService logJoinService;
	
	@PostMapping("/idOkay") 
	public String idOkay(UserVO vo) { 
		
		return logJoinService.idOkay(vo.getUser_id());
	}
 
} 
  