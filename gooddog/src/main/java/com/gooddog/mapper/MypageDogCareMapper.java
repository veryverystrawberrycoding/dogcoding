package com.gooddog.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gooddog.domain.PetVO;
import com.gooddog.domain.WeightVO;

@Mapper
public interface MypageDogCareMapper {
	
	public List<WeightVO> weightList(PetVO vo); 

}
