package com.gooddog.service;

import java.util.List;

import com.gooddog.domain.PetVO;
import com.gooddog.domain.WalkingVO;
import com.gooddog.domain.WeightVO;

public interface MypageDogCareService {
	
	// 반려견 체중 리스트 조회 
	public List<WeightVO> weightList(PetVO vo);
	
	// 반려견 체중 입력 
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
