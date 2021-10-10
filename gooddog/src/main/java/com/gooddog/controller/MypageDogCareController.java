package com.gooddog.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gooddog.domain.PetVO;
import com.gooddog.domain.UserVO;
import com.gooddog.domain.WalkingVO;
import com.gooddog.domain.WeightVO;
import com.gooddog.service.LogJoinService;
import com.gooddog.service.MypageDogCareService;


@Controller
public class MypageDogCareController {
	
	@Autowired
	private MypageDogCareService dogCare; 
	
	@Autowired 
	LogJoinService logjoinService;
	
	@RequestMapping(value="/mypageDogCare")
	public String mypage(HttpSession session, PetVO vo, UserVO uvo, Model m) throws Exception {
		//세션 정보 받기 
		UserVO user = (UserVO) session.getAttribute("user");
		//System.out.println(user);
		if(user==null) {
			return "redirect:/loginForm";
		}  
		else {
		vo.setUser_id(user.getUser_id());
		UserVO myvo = logjoinService.userSelect(uvo);
		m.addAttribute("myvo", myvo); 
		
			return "/mypageDogCare"; 
		} 
		
//		//dogCare.weightList(vo);
//		return "mypageDogCare";
		
		
	}
	
	

	
	@RequestMapping(value="/weightList", method=RequestMethod.POST)
	@ResponseBody
	//public String weightList(Model m, PetVO vo) {
	public Object weightList(HttpSession session, PetVO vo) {
		
		//세션 정보 받기 
		UserVO user = (UserVO) session.getAttribute("user");

		//세션 정보 중 user_id 값 저장하기 
		vo.setUser_id(user.getUser_id());
		
		//vo.setUser_id("a123");
		//vo.setPet_no(2);
		System.out.println(vo.getUser_id()+","+ vo.getPet_no()+","+vo.getYear()+","+vo.getMonth());
		
		
		
		//강아지 체중 정보 리스트 조회 
		List<WeightVO> weightList = dogCare.weightList(vo);
		//System.out.println(weightList);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("weightList",weightList);

		return map;

	}
	

	// 반려견 체중 입력 
	@RequestMapping(value="/insertWeight", method=RequestMethod.POST) //
	@ResponseBody
	public String insertWeight(WeightVO vo) {
		String msg="통신 완료";
		System.out.println("insertWeight 호출" + vo.getPet_no());
		dogCare.insertWeight(vo);
		
		return msg;
	}
	
	
	// 반려견 체중 수정 
	@RequestMapping(value="/modifyWeight", method=RequestMethod.POST) //
	@ResponseBody
	public String modifyWeight(WeightVO vo) {
		String msg="통신 완료";
		System.out.println(vo.getPet_no());
		dogCare.modifyWeight(vo);
		
		return msg;
	}
	
	// 반려견 체중 삭제 
	@RequestMapping(value="/deleteWeight", method=RequestMethod.POST) //
	@ResponseBody
	public String deleteWeight(WeightVO vo) {
		String msg="통신 완료";
		System.out.println(vo.getPet_no());
		dogCare.deleteWeight(vo);
		
		return msg;
	}
	
	
	@RequestMapping(value="/walkList", method=RequestMethod.POST)
	@ResponseBody
	public Object walkList(HttpSession session, WalkingVO vo) {

		System.out.println(vo.getPet_no()+","+vo.getYear()+","+vo.getMonth());
		
		
		
		//강아지 체중 정보 리스트 조회 
		List<WalkingVO> walkList = dogCare.walkList(vo);
		System.out.println(walkList);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("walkList",walkList);

		return map;

	}
	
	
	// 반려견 산책 기록 
	@RequestMapping(value="/insertWalk", method=RequestMethod.POST) //
	@ResponseBody
	public String insertWalk(HttpServletRequest request, WalkingVO vo) {
		String msg="통신 완료";
		
		String[] pet_no_list = request.getParameterValues("pet_no");
		int size = pet_no_list.length;
		System.out.println("pet_no_list의 사이즈 : " + size);
		System.out.println("pet_no_list : "+pet_no_list);
		System.out.println(vo.getWalk_content());
		
		int[] int_pet_no_list = new int[size];

		// String 배열을 int 배열로 형변화
		for (int i = 0; i < size; i++) {
			int_pet_no_list[i] = Integer.parseInt(pet_no_list[i]);
		}
		
		// pet_no_list에 저장된 값만큼 insert 반복
		for (int i=0; i<size; i++) {
			vo.setPet_no(int_pet_no_list[i]);
			dogCare.insertWalk(vo); 
		}
		
		return msg;
	}	
	
	
//	@RequestMapping("/mypageFace") // http://localhost:8082/mypageFace ,method=RequestMethod.GET
//	public void mypageFace() {
//		
//	}
//	
//	@RequestMapping("/chatbot")
//	public void chatbot() {
//		
//	}
//	
//	
//	@RequestMapping(value="/mypageFace",method = RequestMethod.POST)
//	@ResponseBody
//	public void mypageFaceimg(@RequestParam("file") MultipartFile file) throws Exception {
//		String basePath = "C:\\git\\dogcoding\\gooddog\\src\\main\\webapp\\resources\\images\\dogface";
//		String filePath = basePath + "/" + file.getOriginalFilename();
//		File dest = new File(filePath); file.transferTo(dest);
//	}
//	
	

}
