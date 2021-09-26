package com.gooddog.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	// 장소 목록 조회 - ajax로 필터링 키워드 값 받아옴 
	@ResponseBody
	@RequestMapping(value="/ajaxMapList")
	public Object ajaxMapList(Criteria criteria,Model m) throws Exception{
		String message = "통신완료지롱";
		System.out.println(criteria.getPlace_group());
		
//		if(criteria.getPlace_group().equals("5")) {
//			criteria.getPlace_group(" WHERE place_group = 5");
//		}
		
		// 장소 목록 개수 조회
		int placeCount = placeService.ajaxPlaceCount(criteria);
		
		// 페이징 객체 
		Paging paging = new Paging();
		paging.setCri(criteria);
		paging.setTotalCount(placeCount);
		

		// 장소 목록 조회 - 페이지 변수 입력
		List<Map<String, Object>> mapList = placeService.ajaxPlaceList(criteria);
		System.out.println(placeCount);
		

		System.out.println(mapList);

		System.out.println(paging);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mapList",mapList);
		map.put("placeCount",placeCount);
		map.put("paging",paging);
		
		return map;
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
		
		/* m.addAttribute("count", count); */
		
		Map<String, Object> map = new HashMap<>();
		map.put("total", count);
	
		m.addAttribute("total", map); //개수는 ${total.total}
		
		
		//리뷰 prevalue 검색
		//[{pre_value=positive, count=2}, {pre_value=negative, count=2}, {pre_value=neutral, count=1}]
		List<Map<String, Object>> prevalue= placeService.prevalue(vo); 
		m.addAttribute("prevalue",prevalue);
		
		//긍정 리뷰
		int positive = Integer.parseInt(prevalue.get(0).get("count").toString());
		float percent = ((float)positive/count)*100;
		m.addAttribute("percent",percent);
	

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
