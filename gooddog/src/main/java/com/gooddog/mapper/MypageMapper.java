package com.gooddog.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.data.repository.query.Param;

import com.gooddog.domain.GalreVO;
import com.gooddog.domain.PetVO;
import com.gooddog.domain.UserVO;

@Mapper
public interface MypageMapper {
	List<PetVO> dogList(@Param("user_id") String user_id);
	
	void dogModify(PetVO vo);
	
	void dogDelete(PetVO vo);
	
	int passCheck(UserVO vo);
	
	void userModify(UserVO vo);
	
	void noPwdModify(UserVO vo);
	
	List<Map<String, Object>> myGalList(UserVO vo);
	
	List<Map<String, Object>> myGalReply(UserVO vo);
	
	void petInput(PetVO vo);
	
	void pwdModify(UserVO vo);
	
	void modifyFile(UserVO vo);
	
	List<Map<String, Object>> lossList(UserVO vo);
}      
   