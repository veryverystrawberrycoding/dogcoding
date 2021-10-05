package com.gooddog.service;

import java.util.ArrayList;
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
	
	
	public List<GalleryVO> galleryList(GalleryVO vo){
		
		return galleryMapper.galleryList(vo);
		
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
	public List<Map<String, Object>> commentList(int gal_no) {
		return galleryMapper.commentList(gal_no);
	}
	
	@Override
	public List<Map<String, Object>> commentPaging(GalleryVO vo) {
		return galleryMapper.commentPaging(vo);
	}


	@Override
	public int commentCount(int gal_no) {
		return galleryMapper.commentCount(gal_no);
	}


	@Override
	public List<GalleryVO> galSearch(GalleryVO vo) {
		return galleryMapper.galSearch(vo);
		
	}
	
	@Override
	public List<GalleryVO> galSelect(String tag) {
		return galleryMapper.galSelect(tag);
		
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


	@Override
	public void badContent(GalleryVO vo) {
		galleryMapper.badContent(vo);
		
	}


	@Override
	public void galcntup(int no) {
		galleryMapper.galcntup(no);
		
	}

	//총 게시글 수
	@Override
	public int galcount() {
		return galleryMapper.galcount();
	}


	@Override
	public int galSearchcount(GalleryVO vo) {
		return galleryMapper.galSearchcount(vo);
	}


	@Override
	public List<GalleryVO> galtag() {
		return galleryMapper.galtag();
	}




}
