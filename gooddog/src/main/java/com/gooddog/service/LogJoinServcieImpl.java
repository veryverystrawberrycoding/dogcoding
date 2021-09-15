package com.gooddog.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gooddog.mapper.LogJoinMapper;



@Service
public class LogJoinServcieImpl implements LogJoinService {
	

	@Autowired
	LogJoinMapper logJoinMapper;
	
	public String idOkay(String user_id) {
		System.out.println(user_id);
		return logJoinMapper.idOkay(user_id); 
	}

	    
}   
