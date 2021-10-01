package com.gooddog.service;

import java.util.List;
import java.util.Map;

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
	
		///////info(book) 정보가져오기//////
		
		public List<BookVO>	 adminpost(BookVO bookVO);
////////////////////////////////////////////////
		//book수정////
//		public BookVO bookModify(BookVO vo);
	///////book 삭제/////////
		public void bookDelete(BookVO vo);
		////////////페이징/////
		public int bookCount(BookVO bookVO) throws Exception;
		
		
	//	void bookDelete(int dic_no);
////////////////////////////갤러리 정보 가져오기/////////////////////		
		public List<GalleryVO>	 adminpost2(GalleryVO galleryVO);
////////////////////////////////////////////////

///////book 삭제/////////
public void galleryDelete(GalleryVO vo);
////////////페이징/////
public int galleryCount(GalleryVO galleryVO) throws Exception;



////////////////////////////실종신고 정보 가져오기/////////////////////		
public List<LossVO>	 adminpost3(LossVO lossVO);
////////////////////////////////////////////////
//public void bookModify(BookVO vo);
///////book 삭제/////////
public void lossDelete(LossVO vo);
////////////페이징/////
public int lossCount(LossVO lossVO) throws Exception;

}

