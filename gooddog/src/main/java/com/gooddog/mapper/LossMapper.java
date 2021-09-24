package com.gooddog.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gooddog.domain.BookVO;
import com.gooddog.domain.LossVO;


@Mapper
public interface LossMapper {
	
	public List<LossVO> lossList();
	
/////////////////////////////////////	
	public LossVO lossView(int no);
}
