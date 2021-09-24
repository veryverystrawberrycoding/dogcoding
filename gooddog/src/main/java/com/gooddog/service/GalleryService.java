package com.gooddog.service;

import java.util.List;
import java.util.Map;

import com.gooddog.domain.GalleryVO;
import com.gooddog.domain.PlacereVO;

public interface GalleryService {
	
	public List<GalleryVO>galleryList();

	public Map<String, Object> galNoList(int no);
	
	public void galInsert(GalleryVO vo);
	
	public void galUpdate(GalleryVO vo);
	
	public void galHeartUp(GalleryVO vo);
	
	public void galHeartDown(GalleryVO vo);
	
	public void galDelete(int no);

	public List<Map<String, Object>> reviewList(GalleryVO vo);

	public int reviewCount(GalleryVO vo);
	
	

}
