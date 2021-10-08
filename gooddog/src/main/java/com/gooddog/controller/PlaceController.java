package com.gooddog.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String placeList() throws Exception{
		
//		// 장소 목록 개수 조회
//		int placeCount = placeService.placeCount();
//		
//		// 페이징 객체 
//		Paging paging = new Paging();
//		paging.setCri(criteria);
//		paging.setTotalCount(placeCount);
//		
//		// 장소 목록 조회 - 페이지 변수 입력
//		List<Map<String, Object>> mapList = placeService.placeList(criteria); 
//		
//		m.addAttribute("mapList", mapList);
//		m.addAttribute("paging",paging);
		System.out.println("mapList 페이지 호출");
		return "mapList";
	}
	
	// 장소 목록 조회 - ajax로 필터링 키워드 값 받아옴 
	@ResponseBody
	@RequestMapping(value="/ajaxMapList", method=RequestMethod.POST)
	public Object ajaxMapList(Criteria criteria, PlaceVO vo, Model m) throws Exception{
		//String message = "통신완료지롱";
		System.out.println("place_group: "+criteria.getPlace_group());
		System.out.println("page: "+criteria.getPage());
		
		String keyword = criteria.getKeyword();
		System.out.println("keyword: "+keyword);
		//System.out.println("keyword isEmpty: "+keyword.isEmpty());
		//if (keyword.isEmpty()) {criteria.setKeyword(null);}
		//System.out.println("keyword: "+keyword);
		System.out.println("addr_1: "+criteria.getAddr_1());
		System.out.println("addr_2: "+criteria.getAddr_2());
		//System.out.println("addr_2 isEmpty: "+criteria.getAddr_2().isEmpty());
		// 장소 목록 개수 조회
		int placeCount = placeService.ajaxPlaceCount(criteria);
		//System.out.println("placeCount: "+placeCount);
		
		// 페이징 객체 
		Paging paging = new Paging();
		paging.setCri(criteria);
		paging.setTotalCount(placeCount);
		//System.out.println("startPage: "+paging.getStartPage());
		
		// 장소 목록 조회 - 페이지 변수 입력
		List<Map<String, Object>> mapList = placeService.ajaxPlaceList(criteria);
		
		System.out.println(mapList);
		System.out.println("paging: "+paging);
		
		List<Integer> countList = new ArrayList<Integer>();
		List<Float> percentList = new ArrayList<Float>();
		
		
		//mapList의 place_no를 통해서 리뷰 수와 리뷰 평가 값 가져오기 
		for (int i=0; i<mapList.size(); i++) {
			int place_no = Integer.parseInt(mapList.get(i).get("place_no").toString());
			System.out.println("place_no: "+ place_no);
			vo.setPlace_no(place_no);
			
			// 리뷰 개수 조회 
			int count = placeService.reviewCount(vo);
			
			//리뷰 prevalue 검색
			//[{pre_value=positive, count=2}, {pre_value=negative, count=2}, {pre_value=neutral, count=1}]
			List<Map<String, Object>> prevalue= placeService.prevalue(vo); 
			System.out.println(prevalue.isEmpty());	
			int positive;
			float percent;
			
			if (prevalue.isEmpty()) {
				percent = 0; 
			}
			else {
				//긍정 리뷰
				positive = Integer.parseInt(prevalue.get(0).get("count").toString());
				percent = ((float)positive/count)*100;
			}
			
			countList.add(count);
			percentList.add(percent);
			
		}
		
		System.out.println(countList);
		System.out.println(percentList);
		
		

		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mapList",mapList);
		map.put("place_group", criteria.getPlace_group());
		map.put("placeCount",placeCount);
		map.put("paging",paging);
		map.put("keyword", criteria.getKeyword());
		
		map.put("countList", countList);
		map.put("percentList",percentList);
		

		
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
