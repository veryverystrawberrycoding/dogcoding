package com.gooddog.service;

import com.gooddog.domain.UserVO;

public interface LogJoinService {
public String idOkay(String user_id);
	
	public String nickOkay(String user_nick);
	
	public UserVO login(UserVO vo);
  
	public int join(UserVO vo);
	
	public UserVO userSelect(UserVO vo);
	
	public void userLog(UserVO vo);
	
	public void userLogout(UserVO vo);
	
} 
        