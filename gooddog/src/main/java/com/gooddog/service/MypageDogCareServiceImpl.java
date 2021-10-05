package com.gooddog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gooddog.domain.PetVO;
import com.gooddog.domain.WeightVO;
import com.gooddog.mapper.MypageDogCareMapper;

@Service
public class MypageDogCareServiceImpl implements MypageDogCareService {
	
	@Autowired
	private MypageDogCareMapper dogMapper;

	@Override
	public List<WeightVO> weightList(PetVO vo) {
//		System.out.println("service "+vo.getUser_id());
		return dogMapper.weightList(vo);
	}
	
	// 반려견 체중 입력 
	@Override
	public void insertWeight(WeightVO vo) {
		dogMapper.insertWeight(vo);
	}
	
	
	// 반려견 체중 수정 
	public void modifyWeight(WeightVO vo) {
		dogMapper.modifyWeight(vo);
	}
	
	// 반려견 체중 삭제 
	public void deleteWeight(WeightVO vo) {
		dogMapper.deleteWeight(vo);
	}

}
