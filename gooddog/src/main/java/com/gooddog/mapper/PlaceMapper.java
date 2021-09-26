package com.gooddog.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gooddog.domain.Criteria;
import com.gooddog.domain.PlaceVO;
import com.gooddog.domain.PlacereVO;

@Mapper
public interface PlaceMapper {
	
	// 장소 목록 조회
	public List<Map<String, Object>> placeList(Criteria criteria) throws Exception;
	
	// 장소 목록 개수 조회 
	public int placeCount();
	
	// 장소 목록 조회 ajax
	public List<Map<String, Object>> ajaxPlaceList(Criteria criteria) throws Exception;
	
	// 장소 목록 개수 조회 ajax
	public int ajaxPlaceCount(Criteria criteria);
	
	// 장소 상세 정보 조회 
	public PlaceVO placeView(PlaceVO vo);
	
	// 리뷰 조회 
	public List<PlacereVO> reviewList(PlaceVO vo);
	
	// 리뷰 개수 조회 
	public int reviewCount(PlaceVO vo);
	
	public List<Map<String, Object>> prevalue(PlaceVO vo);

}