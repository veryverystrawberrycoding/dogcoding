package com.gooddog.service;

import java.util.List;

import com.gooddog.domain.BookVO;
import com.gooddog.domain.LossVO;


public interface LossService {
	
	public List<LossVO>lossList();

	public LossVO lossView(int no);
	
//////////////////////////////////////////	

}
