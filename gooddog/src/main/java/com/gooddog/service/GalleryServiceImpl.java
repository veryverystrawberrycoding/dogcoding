package com.gooddog.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gooddog.domain.GalleryVO;
import com.gooddog.domain.PlacereVO;
import com.gooddog.mapper.GalleryMapper;

@Service 
public class GalleryServiceImpl implements GalleryService {
	
	@Autowired
	private GalleryMapper galleryMapper;
	
	
	public List<GalleryVO> galleryList(){
		
		return galleryMapper.galleryList();
		
	}


	public Map<String, Object> galNoList(int no) {
		return galleryMapper.galNoList(no);
	}



	public void galInsert(GalleryVO vo) {
		galleryMapper.galInsert(vo);
		
	}


	@Override
	public void galUpdate(GalleryVO vo) {
		galleryMapper.galUpdate(vo);
		
	}


	@Override
	public void galHeartUp(GalleryVO vo) {
		galleryMapper.galHeartUp(vo);
	}


	@Override
	public void galHeartDown(GalleryVO vo) {
		galleryMapper.galHeartDown(vo);
	}


	@Override
	public void galDelete(int no) {
		galleryMapper.galDelete(no);
		
	}


	@Override
	public List<Map<String, Object>> reviewList(GalleryVO vo) {
		return galleryMapper.reviewList(vo);
	}


	@Override
	public int reviewCount(GalleryVO vo) {
		return galleryMapper.reviewCount(vo);
	}

}
