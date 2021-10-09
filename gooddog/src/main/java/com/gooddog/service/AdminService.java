package com.gooddog.service;

import java.util.List;
import java.util.Map;

import com.gooddog.domain.BadcontentVO;
import com.gooddog.domain.BlackVO;
import com.gooddog.domain.BookVO;
import com.gooddog.domain.GalleryVO;
import com.gooddog.domain.LossVO;
import com.gooddog.domain.PetVO;
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
		public List<Map<String,String>> getDayCount();
		public List<Map<String, String>> getweekCount();
//////블랙리스트 삭제////////// 
public void blacklistDelete(BlackVO vo);

///////info(book) 정보가져오기//////
		
public List<BookVO>	 adminpost(BookVO bookVO);
///////////book 삭제/////////
public void bookDelete(BookVO vo);
////////////book페이징/////
public int bookCount(BookVO bookVO) throws Exception;
		
////////////////////////////갤러리 정보 가져오기/////////////////////		
public List<GalleryVO>	 adminpost2(GalleryVO galleryVO);
////////////////////////////////////////////////
///////갤러리 삭제/////////
public void galleryDelete(GalleryVO vo);
////////////페이징/////
public int galleryCount(GalleryVO galleryVO) throws Exception;


////////////////////////게시글 신고 정보 가져오기 /////////////////////////
public List<BadcontentVO> badcontent(BadcontentVO badcontentVO);

////////////////////////badcount삭제///////////////////////
public void badcontentDelete(BadcontentVO vo);
//////////////////////////badcount페이징///////////////////////
public int badcontentCount(BadcontentVO badcontentVO) throws Exception;


//유저에서  블랙리스트 등록하기 
public void addBlackList(BlackVO vo);





}

