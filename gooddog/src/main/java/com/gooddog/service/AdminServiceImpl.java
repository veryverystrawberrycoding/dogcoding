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
		
		return AdminMapper.getUserInfo(vo);
	}
 
	 
	public List<BlackVO> getBlackList(BlackVO vo) {
		
		List<BlackVO> result = null;
		
		return AdminMapper.getBlackInfo();
	}

//	//월별 총액
//		public List<Map<String, String>> getMonthSum() {
//			return AdminMapper.getMonthSum();
//		}
//		
//		//일별 총액
//		public List<Map<String, String>> getDaySum() {
//			return AdminMapper.getDaySum();
//		} 


	@Override
	public int getMenCount() {
		int result = 0;
		result = AdminMapper.getMenCount();
		return result;
	}
   

	@Override 
	public int getWomenCount() {
		int result = 0;
		result = AdminMapper.getWomenCount();
		return result;
	}
		
				
				
		//////////////////////////info book 정보 가져오기 /////////////////////흠	
		@Override
		public List<BookVO>adminpost(){
		
		return  AdminMapper.adminpost();
		}
		
		@Override
		public int getUserCount(UserVO userVO) throws Exception {
			
			int result = 0;
			result = AdminMapper.userCount();
			
			return result;
		}


		@Override
		public void userList(UserVO userVO) {
			// TODO Auto-generated method stub
			
		}


		@Override
		public int getblackCount(BlackVO blackVO) throws Exception {
			// TODO Auto-generated method stub
			return 0;
		}
		
	
		@Override
		public void blackList(BlackVO blackVO) {
			// TODO Auto-generated method stub
			
		}


		




}   
