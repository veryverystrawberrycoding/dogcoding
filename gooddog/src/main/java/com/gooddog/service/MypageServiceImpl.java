package com.gooddog.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gooddog.domain.PetVO;
import com.gooddog.domain.UserVO;
import com.gooddog.mapper.MypageMapper;

@Service
public class MypageServiceImpl implements MypageService {
	
	@Autowired
	private MypageMapper mypageMapper;
	
	public List<PetVO> dogList(String user_id) {
		return mypageMapper.dogList(user_id);
	} 
	
	public void dogModify(PetVO vo) {
		System.out.println(vo.getPet_birth());
		mypageMapper.dogModify(vo); 
	}
	
	public void dogDelete(PetVO vo) {
		mypageMapper.dogDelete(vo);
		
	}
	
	public int passCheck(UserVO vo) {
		return mypageMapper.passCheck(vo);
	} 
	
	public void userModify(UserVO vo) {
		mypageMapper.userModify(vo); 
	}
	
	public void noPwdModify(UserVO vo) {
		mypageMapper.noPwdModify(vo);
	}
	
	public List<Map<String, Object>> myGalList(UserVO vo) {
		return mypageMapper.myGalList(vo);
	}  
	 
	public List<Map<String, Object>> myGalReply(UserVO vo) {
		return mypageMapper.myGalReply(vo);
	}
	
	public void petInput(PetVO vo) {
		mypageMapper.petInput(vo);  
	}
	 
	public void pwdModify(UserVO vo) {
		mypageMapper.pwdModify(vo);
	}
	
	public void modifyFile(UserVO vo) { 
		mypageMapper.modifyFile(vo);
	}
	
	public List<Map<String, Object>> lossList(UserVO vo){
		return mypageMapper.lossList(vo); 
	}
	
}
 