package com.gooddog.service;

import java.util.List;
import java.util.Map;

import com.gooddog.domain.Criteria;
import com.gooddog.domain.PlaceVO;
import com.gooddog.domain.PlacereVO;

public interface PlaceService {
	
	// 장소 목록 조회
	public List<Map<String, Object>> placeList(Criteria criteria) throws Exception;
	
	// 장소 목록 개수 조회 
	public int placeCount();
	
	// 장소 상세 정보 조회 
	public PlaceVO placeView(PlaceVO vo);
	
	// 장소 추가 
	public void placeInsert(PlaceVO vo);
	
	// 장소 수정 
	public void placeUpdate(PlaceVO vo);
	
	// 장소 삭제 
	public void placeDelete(PlaceVO vo);
	
	// 리뷰 조회 
	public List<PlacereVO> reviewList(PlaceVO vo);
	
	// 리뷰 개수 조회 
	public int reviewCount(PlaceVO vo);
	

	public List<Map<String, Object>> prevalue(PlaceVO vo);
	
	// 장소 목록 조회 : ajax
	public List<Map<String, Object>> ajaxPlaceList(Criteria criteria) throws Exception;
	
	// 장소 목록 개수 조회 : ajax
	public int ajaxPlaceCount(Criteria criteria);
	
	
	

}
