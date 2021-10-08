package com.gooddog.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gooddog.domain.BadcontentVO;
import com.gooddog.domain.BlackVO;
import com.gooddog.domain.BookVO;
import com.gooddog.domain.GalleryVO;
import com.gooddog.domain.GalreVO;
import com.gooddog.domain.LossVO;
import com.gooddog.domain.PetVO;
import com.gooddog.domain.UserVO;


@Mapper
public interface AdminMapper {
	  
	 

		//유저 불러오기
		List<UserVO> getUserInfo();
		//블랙 유저 불러오기
		List<BlackVO> getBlackInfo();
	     
		


		
		int userCount();
		
		List<UserVO> getUserInfo(UserVO vo);
	
		int blackCount();
		
		List<BlackVO> getBlackInfo(BlackVO vo);
	
		int getMenCount();
		
		int getWomenCount();
		
		public List<Map<String,String>> getDayCount();
		
		public List<Map<String,String>> getweekCount();

		//////////////////////////백과사전 리스트보기///////////////////		
public List<BookVO>adminpost(BookVO vo);

int bookCount();
////////백과사전 수정//////
//public BookVO bookModify(BookVO vo);

////////백과사전 삭제//////
public void bookDelete(BookVO vo);

// 블랙리스트 추가
public void addBlackList(BlackVO vo);



///////////////////////갤러리 리스트 보기 //////////////////////
public List<GalleryVO>adminpost2(GalleryVO vo);
public int galleryCount();
////////갤러리 삭제//////
public void galleryDelete(GalleryVO vo);
///////////////////////////////////////////
//////////////////////////////////////////
public List<BadcontentVO> badcontent(BadcontentVO vo);
public int badcontentCount();
//////////////////// 
public void badcontentDelete(BadcontentVO vo);
}
