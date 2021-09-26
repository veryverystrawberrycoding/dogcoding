package com.gooddog.service;

import java.util.List;
import java.util.Map;

import com.gooddog.domain.GalleryVO;
import com.gooddog.domain.GalreVO;
import com.gooddog.domain.PlacereVO;

public interface GalleryService {
	
	public List<GalleryVO>galleryList();

	public Map<String, Object> galNoList(int no);
	
	public void galInsert(GalleryVO vo);
	
	public void galUpdate(GalleryVO vo);
	
	public void galHeartUp(GalleryVO vo);
	
	public void galHeartDown(GalleryVO vo);
	
	public void galDelete(int no);

	public List<Map<String, Object>> commentList(GalleryVO vo);

	public int commentCount(GalleryVO vo);

	public List<GalleryVO> galSearch(String data);

	public void commentInsert(GalreVO vo);

	public void commentDelete(GalreVO vo);

	public void userlikeInsert(GalleryVO vo);

	public void userlikeDelete(GalleryVO vo);

	public int userlikeSelect(GalleryVO vo);
	
	

}
