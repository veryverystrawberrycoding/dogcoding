package com.gooddog.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gooddog.domain.PetVO;
import com.gooddog.domain.WalkingVO;
import com.gooddog.domain.WeightVO;

@Mapper
public interface MypageDogCareMapper {
	
	public List<WeightVO> weightList(PetVO vo); 
	
	// 반려견 몸무게 입력 
	public void insertWeight(WeightVO vo);
	
	// 반려견 체중 수정 
	public void modifyWeight(WeightVO vo);
	
	// 반려견 체중 삭제 
	public void deleteWeight(WeightVO vo);
	
	// 반려견 산책 리스트 조회
	public List<WalkingVO> walkList(WalkingVO vo);
	
	// 반려견 산책 입력
	public void insertWalk(WalkingVO vo);
	
	// 반려견 산책 수정 
	public void modifyWalk(WalkingVO vo);
	
	// 반려견 산책 삭제 
	public void deleteWalk(WalkingVO vo);

}
