package com.gooddog.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gooddog.domain.BlackVO;
import com.gooddog.domain.BookVO;
import com.gooddog.domain.UserVO;


@Mapper
public interface AdminMapper {
	 
	 

		//유저 불러오기
		List<UserVO> getUserInfo();
		//블랙 유저 불러오기
		List<BlackVO> getBlackInfo();
	    
//////////////////////////수정///////////////////		
public List<BookVO>adminpost();
}           