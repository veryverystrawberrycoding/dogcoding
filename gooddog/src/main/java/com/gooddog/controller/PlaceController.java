package com.gooddog.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gooddog.domain.Criteria;
import com.gooddog.domain.Paging;
import com.gooddog.domain.PlaceVO;
import com.gooddog.domain.PlacereVO;
import com.gooddog.service.PlaceService;

@Controller
public class PlaceController {
	
	@Autowired
	private PlaceService placeService;
	
	// 장소 목록 조회 
	@RequestMapping(value="/mapList")
	public String placeList(Criteria criteria,Model m) throws Exception{
		
		// 장소 목록 개수 조회
		int placeCount = placeService.placeCount();
		
		// 페이징 객체 
		Paging paging = new Paging();
		paging.setCri(criteria);
		paging.setTotalCount(placeCount);
		
		// 장소 목록 조회 - 페이지 변수 입력
		List<Map<String, Object>> mapList = placeService.placeList(criteria); 
		
		m.addAttribute("mapList", mapList);
		m.addAttribute("paging",paging);
		
		return "mapList";
	}
	
	// 장소 상세정보 조회 
	@RequestMapping(value="/mapView", method=RequestMethod.GET)
	public String placeView(PlaceVO vo, Model m) {
		
		// 장소 상세 정보 
		m.addAttribute("place", placeService.placeView(vo));
		
		// 리뷰 조회 
		List<PlacereVO> reviewList=placeService.reviewList(vo);
		m.addAttribute("reviewList",reviewList);
		
		// 리뷰 개수 조회 
		int count = placeService.reviewCount(vo);
		
		m.addAttribute("count", count);
		
		
		
		
		return "mapView";
	}
	
	
//	// 장소 추가 
//	public void placeInsert(PlaceVO vo);
//	
//	// 장소 수정 
//	public void placeUpdate(PlaceVO vo);
//	
//	// 장소 삭제 
//	public void placeDelete(PlaceVO vo);
	
	
	
	
	

}
