package com.gooddog.service;

import java.util.List;
import java.util.Map;

import com.gooddog.domain.GalleryVO;
import com.gooddog.domain.GalreVO;
import com.gooddog.domain.PetVO;
import com.gooddog.domain.UserVO;

public interface MypageService {
	public List<PetVO> dogList(String user_id);
	
	public void dogModify(PetVO vo);
	
	public void dogDelete(PetVO vo);
	
	public int passCheck(UserVO vo);
	
	public void userModify(UserVO vo);
	
	public void noPwdModify(UserVO vo);
	
	public List<Map<String, Object>> myGalList(UserVO vo);
	
	public List<Map<String, Object>> myGalReply(UserVO vo);
	
	public void petInput(PetVO vo);
	
	public void pwdModify(UserVO vo);
	
	public void modifyFile(UserVO vo);
	
	public List<Map<String, Object>> lossList(UserVO vo);
}   
   
     