package com.gooddog.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gooddog.domain.GalleryVO;
import com.gooddog.domain.GalreVO;
import com.gooddog.domain.PlacereVO;

@Mapper
public interface GalleryMapper {
	
	public List<GalleryVO> galleryList(GalleryVO vo);

	public Map<String, Object> galNoList(int no);
	
	public void galInsert(GalleryVO vo);
	
	public void galUpdate(GalleryVO vo);
	
	public void galHeartUp(GalleryVO vo);
	
	public void galHeartDown(GalleryVO vo);
	
	public void galDelete(int no);
	
	public List<Map<String, Object>> commentList(int gal_no);
	
	public List<Map<String, Object>> commentPaging(GalleryVO vo);

	public int commentCount(int gal_no);

	public List<GalleryVO> galSearch(GalleryVO vo);

	public void commentInsert(GalreVO vo);

	public void commentDelete(GalreVO vo);

	public void userlikeInsert(GalleryVO vo);

	public void userlikeDelete(GalleryVO vo);

	public int userlikeSelect(GalleryVO vo);

	public void badContent(GalleryVO vo);

	public void galcntup(int no);

	public List<GalleryVO> galSelect(String tag);

	public int galcount(); //총게시글 수

	public int galSearchcount(GalleryVO vo);

	public List<GalleryVO> galtag();


}
