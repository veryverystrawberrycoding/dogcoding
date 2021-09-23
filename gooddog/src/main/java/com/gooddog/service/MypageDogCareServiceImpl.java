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
		
		
		return dogMapper.weightList(vo);
	}

}
