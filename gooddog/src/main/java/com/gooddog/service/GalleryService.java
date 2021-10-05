package com.gooddog.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.gooddog.domain.GalleryVO;
import com.gooddog.domain.GalreVO;
import com.gooddog.domain.PlacereVO;

public interface GalleryService {
	
	public List<GalleryVO>galleryList(GalleryVO vo);

	public Map<String, Object> galNoList(int no);
	
	public void galInsert(GalleryVO vo);
	
	public void galUpdate(GalleryVO vo);
	
	public void galHeartUp(GalleryVO vo);
	
	public void galHeartDown(GalleryVO vo);
	
	public void galDelete(int no);

	public List<Map<String, Object>> commentList(int galno);
	
	public List<Map<String, Object>> commentPaging(GalleryVO vo); //페이징처리된 댓글리스트

	public int commentCount(int galno);

	public List<GalleryVO> galSearch(GalleryVO vo);
	
	public List<GalleryVO> galSelect(String tag);

	public void commentInsert(GalreVO vo);

	public void commentDelete(GalreVO vo);

	public void userlikeInsert(GalleryVO vo);

	public void userlikeDelete(GalleryVO vo);

	public int userlikeSelect(GalleryVO vo);

	public void badContent(GalleryVO vo);

	public void galcntup(int no);

	public int galcount(); //총 게시글 수

	public int galSearchcount(GalleryVO vo);

	public List<GalleryVO> galtag();


	
	

}
