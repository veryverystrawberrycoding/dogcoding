package com.gooddog.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;


import com.gooddog.domain.BlackVO;
import com.gooddog.domain.UserVO;
import com.gooddog.domain.UserVO;

@Mapper
public interface LogJoinMapper {
	 
 String idOkay(@Param("user_id") String user_id);
	 
	 String nickOkay(@Param("user_nick") String user_nick);
	 
	 UserVO login(@Param("user_id") String user_id, @Param("user_pwd") String user_pwd);
	 
	 int join(UserVO vo);  
	 
	 UserVO userSelect(UserVO vo);

		//유저 불러오기
		List<UserVO> getUserInfo();
		//블랙 유저 불러오기
		List<BlackVO> getBlackInfo();
	    
}           