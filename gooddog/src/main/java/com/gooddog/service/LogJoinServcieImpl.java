package com.gooddog.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gooddog.domain.UserVO;
import com.gooddog.mapper.LogJoinMapper;



@Service
public class LogJoinServcieImpl implements LogJoinService {
	

	@Autowired
	LogJoinMapper logJoinMapper;
	
	public String idOkay(String user_id) {
		System.out.println(user_id);
		return logJoinMapper.idOkay(user_id); 
	}
	
	public String nickOkay(String user_nick) {
		System.out.println(user_nick);
		return logJoinMapper.nickOkay(user_nick); 
	}
  
	public UserVO login(UserVO vo) { 
		return logJoinMapper.login(vo.getUser_id(), vo.getUser_pwd());
	}  
	
	public int join(UserVO vo) {
		return logJoinMapper.join(vo); 
	}
	
	public UserVO userSelect(UserVO vo) {
		return logJoinMapper.userSelect(vo);
	} 
}   
 