package com.gooddog.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.data.repository.query.Param;

import com.gooddog.domain.PetVO;
import com.gooddog.domain.UserVO;

@Mapper
public interface MypageMapper {
	List<PetVO> dogList(@Param("user_id") String user_id);
	
	void dogModify(PetVO vo);
	
	void dogDelete(PetVO vo);
	
	int passCheck(UserVO vo);
}  
 