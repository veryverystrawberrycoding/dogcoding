package com.gooddog.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gooddog.domain.PetVO;
import com.gooddog.domain.UserVO;
import com.gooddog.service.MypageService;

@RestController
public class MypageController {
	
	@Autowired
	private MypageService mypageService;
	
	@RequestMapping("/dogList") 
	public Map<String,Object> dogList(UserVO vo, HttpServletRequest req) {
		HttpSession session = req.getSession();
		UserVO sessionvo = (UserVO)session.getAttribute("user");
		vo.setUser_id(sessionvo.getUser_id()); 
		System.out.println("컨트롤러");
		Map <String,Object> map = new HashMap<String,Object>();
		List<PetVO> list = new ArrayList<PetVO>();
		
		list = mypageService.dogList(vo.getUser_id());
		map.put("doglist", list);  
		return map; 
	}
	
	
	@PostMapping("/dogModify")
	public void dogModify(PetVO vo) {
		mypageService.dogModify(vo);
	} 
	
	@PostMapping("/dogDelete")
	public void dogDelete(PetVO vo) {
		mypageService.dogDelete(vo);
	}
	
	@PostMapping("/passCheck")
	public int passCheck(UserVO vo) {
		return mypageService.passCheck(vo);
	}
	
}
