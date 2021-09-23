package com.gooddog.service;

import java.util.List;

import com.gooddog.domain.PetVO;
import com.gooddog.domain.WeightVO;

public interface MypageDogCareService {
	
	// 반려견 몸무게 리스트 조회 
	public List<WeightVO> weightList(PetVO vo);
}
