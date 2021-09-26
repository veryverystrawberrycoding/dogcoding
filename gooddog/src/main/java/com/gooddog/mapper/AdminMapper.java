package com.gooddog.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gooddog.domain.BlackVO;
import com.gooddog.domain.BookVO;
import com.gooddog.domain.GalleryVO;
import com.gooddog.domain.UserVO;


@Mapper
public interface AdminMapper {
	  
	 

		//유저 불러오기
		List<UserVO> getUserInfo();
		//블랙 유저 불러오기
		List<BlackVO> getBlackInfo();
	     
		
	//	public List<Map<String,String>> getMonthSum();

//		public List<Map<String,String>> getDaySum();

		public List<Map<String,String>> getCateSum();
		
		int userCount();
		
		List<UserVO> getUserInfo(UserVO vo);
	
		int blackCount();
		
		List<BlackVO> getBlackInfo(BlackVO vo);
	
		int getMenCount();
		
		int getWomenCount();
		
//////////////////////////백과사전 리스트보기///////////////////		
public List<BookVO>adminpost(BookVO vo);

int bookCount();

/////////////////////////////////////////////////////
public List<GalleryVO>adminpostgallery(GalleryVO vo);


int galleryCount();
}