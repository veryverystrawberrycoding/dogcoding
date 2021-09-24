package com.gooddog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gooddog.domain.BookVO;

import com.gooddog.domain.LossVO;
import com.gooddog.mapper.GalleryMapper;
import com.gooddog.mapper.LossMapper;

@Service 
public class LossServiceImpl implements LossService {
	
	@Autowired
	private LossMapper lossMapper;
	
	
	public List<LossVO> lossList(){
		
		return lossMapper.lossList();
		
	}
	@Override 
	public LossVO lossView(int no) {
		return lossMapper.lossView(no);
	}

}
