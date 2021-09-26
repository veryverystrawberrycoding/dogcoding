package com.gooddog.service;

import java.util.List;
import java.util.Map;

import com.gooddog.domain.BlackVO;
import com.gooddog.domain.BookVO;
import com.gooddog.domain.GalleryVO;
import com.gooddog.domain.UserVO;

public interface AdminService {
	
	
		// 관리자 회원관리
		public List<UserVO> getUserList(UserVO vo);
		public List<BlackVO> getBlackList(BlackVO vo);

	
	 

		
		// 통계

		public void userList(UserVO userVO);
		public void blackList(BlackVO blackVO);

		public int getUserCount(UserVO userVO) throws Exception;
	
		public int getblackCount(BlackVO blackVO) throws Exception;
 
		public int getMenCount();
		
		public int getWomenCount();
	
		///////info(book) 정보가져오기//////
		
		public List<BookVO>	 adminpost(BookVO bookVO);
		
		public int bookCount(BookVO bookVO) throws Exception;
		
////////////////////////////갤러리 정보 가져오기/////////////////////		
		public List<GalleryVO>	adminpostgallery(GalleryVO galleryVO);
		
		public int galleryCount(GalleryVO galleryVO) throws Exception;	



}
