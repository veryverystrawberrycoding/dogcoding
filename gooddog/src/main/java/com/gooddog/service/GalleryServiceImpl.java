package com.gooddog.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gooddog.domain.GalleryVO;
import com.gooddog.domain.GalreVO;
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
	public List<Map<String, Object>> commentList(GalleryVO vo) {
		return galleryMapper.commentList(vo);
	}


	@Override
	public int commentCount(GalleryVO vo) {
		return galleryMapper.commentCount(vo);
	}


	@Override
	public List<GalleryVO> galSearch(String data) {
		return galleryMapper.galSearch(data);
		
	}


	@Override
	public void commentInsert(GalreVO vo) {
		galleryMapper.commentInsert(vo);
		
	}


	@Override
	public void commentDelete(GalreVO vo) {
		galleryMapper.commentDelete(vo);
	
	}


	@Override
	public void userlikeInsert(GalleryVO vo) {
		galleryMapper.userlikeInsert(vo);
		
	}


	@Override
	public void userlikeDelete(GalleryVO vo) {
		galleryMapper.userlikeDelete(vo);
		
	}


	@Override
	public int userlikeSelect(GalleryVO vo) {
		return galleryMapper.userlikeSelect(vo);
	}

}
