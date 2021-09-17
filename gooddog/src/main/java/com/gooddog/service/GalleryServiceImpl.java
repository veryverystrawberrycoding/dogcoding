package com.gooddog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gooddog.domain.GallaryVO;
import com.gooddog.mapper.GalleryMapper;

@Service 
public class GalleryServiceImpl implements GalleryService {
	
	@Autowired
	private GalleryMapper galleryMapper;
	
	
	public List<GallaryVO> galleryList(){
		
		return galleryMapper.galleryList();
		
	}

}
