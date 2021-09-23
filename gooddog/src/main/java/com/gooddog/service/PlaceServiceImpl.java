package com.gooddog.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gooddog.domain.Criteria;
import com.gooddog.domain.PlaceVO;
import com.gooddog.domain.PlacereVO;
import com.gooddog.mapper.PlaceMapper;

@Service
public class PlaceServiceImpl implements PlaceService {
	
	@Autowired
	private PlaceMapper placeMapper;
	
	
	// 장소 목록 조회 
	@Override
	public List<Map<String,Object>> placeList(Criteria criteria) throws Exception{
		return placeMapper.placeList(criteria);
	}
	
	// 장소 목록 개수 조회 
	public int placeCount() {
		return placeMapper.placeCount();
	}
	
	//장소 상세 정보 조회 
	@Override
	public PlaceVO placeView(PlaceVO vo) {	
		return placeMapper.placeView(vo);
	}

	//장소 추가 
	@Override
	public void placeInsert(PlaceVO vo) {
		

	}

	//장소 수정
	@Override
	public void placeUpdate(PlaceVO vo) {
		

	}
	
	//장소 삭제
	@Override
	public void placeDelete(PlaceVO vo) {
		

	}
	
	// 리뷰 조회
	@Override
	public List<PlacereVO> reviewList(PlaceVO vo){
//		List<PlacereVO> result = placeMapper.reviewList(vo);
//		 System.out.println(result.get(0).getPre_content()); 
		return placeMapper.reviewList(vo);
	}
	
	// 리뷰 개수 조회 
	public int reviewCount(PlaceVO vo) {
		return placeMapper.reviewCount(vo);
	}

}