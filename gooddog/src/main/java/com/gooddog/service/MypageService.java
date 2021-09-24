package com.gooddog.service;

import java.util.List;

import com.gooddog.domain.PetVO;
import com.gooddog.domain.UserVO;

public interface MypageService {
	public List<PetVO> dogList(String user_id);
	
	public void dogModify(PetVO vo);
	
	public void dogDelete(PetVO vo);
	
	public int passCheck(UserVO vo);
} 
    