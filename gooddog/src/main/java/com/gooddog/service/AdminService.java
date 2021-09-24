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

		// 통계
		public List<Map<String, String>> getTotal();
		public List<Map<String, String>> getMonth();
		public List<Map<String, String>> getDay();
		
		///////info(book) 정보가져오기//////
		public List<BookVO>adminpost();
}
