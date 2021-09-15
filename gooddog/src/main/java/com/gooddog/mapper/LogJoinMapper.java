package com.gooddog.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.gooddog.domain.UserVO;

@Mapper
public interface LogJoinMapper {
	 
	 String idOkay(@Param("user_id") String user_id);
}    
          