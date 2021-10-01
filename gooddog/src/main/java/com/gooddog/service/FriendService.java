package com.gooddog.service;

import java.util.HashMap;
import java.util.List;

import com.gooddog.domain.UserVO;

public interface FriendService {
	public List<HashMap<String,Object>> fdRecommend1(UserVO vo);
	
	public List<HashMap<String,Object>> fdRecommend2(UserVO vo);
} 
