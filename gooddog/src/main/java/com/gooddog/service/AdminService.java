package com.gooddog.service;

import java.util.List;
import java.util.Map;

import com.gooddog.domain.BlackVO;
import com.gooddog.domain.BookVO;
import com.gooddog.domain.UserVO;

public interface AdminService {
	
	
		// 관리자 회원관리
		public List<UserVO> getUserList(UserVO vo);
		public List<BlackVO> getBlackList(BlackVO vo);

	
	 
		///////info(book) 정보가져오기//////
		public List<BookVO>adminpost();
		
		// 통계

		public void userList(UserVO userVO);
		public void blackList(BlackVO blackVO);

		public int getUserCount(UserVO userVO) throws Exception;
	
		public int getblackCount(BlackVO blackVO) throws Exception;
 
		public int getMenCount();
		
		public int getWomenCount();
	
	
}
