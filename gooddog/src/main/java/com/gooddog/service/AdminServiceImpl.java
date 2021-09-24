package com.gooddog.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.List;
import java.util.Map;

import com.gooddog.domain.BlackVO;
import com.gooddog.domain.BookVO;
import com.gooddog.domain.UserVO;
import com.gooddog.mapper.AdminMapper;

@Service
public class AdminServiceImpl implements AdminService {
	

	@Autowired
	AdminMapper AdminMapper;
	
	public List<UserVO> getUserList(UserVO vo) {
		
		List<UserVO> result = null;
		
		return AdminMapper.getUserInfo();
	}

	 
	public List<BlackVO> getBlackList(BlackVO vo) {
		
		List<BlackVO> result = null;
		
		return AdminMapper.getBlackInfo();
	}

	@Override
	public List<Map<String, String>> getTotal() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Map<String, String>> getMonth() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Map<String, String>> getDay() {
		// TODO Auto-generated method stub
		return null;
	}
//////////////////////////info book 정보 가져오기 /////////////////////	
@Override
public List<BookVO>adminpost(){

return  AdminMapper.adminpost();
}


}   
