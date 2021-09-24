package com.gooddog.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gooddog.domain.UserVO;
import com.gooddog.mapper.FriendMapper;

@Service
public class FriendServiceImpl implements FriendService {
	@Autowired
	private FriendMapper friendMapper;
	
	public List<HashMap<String,Object>> fdRecommend1(UserVO vo){
		
		return friendMapper.fdRecommend1(vo);
	}

}
