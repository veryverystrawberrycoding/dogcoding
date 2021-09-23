package com.gooddog.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.gooddog.domain.PetVO;
import com.gooddog.domain.WeightVO;
import com.gooddog.service.MypageDogCareService;


@Controller
public class MypageDogCareController {
	
	@Autowired
	private MypageDogCareService dogCare; 
	
//	@RequestMapping(value="/mypageDogCare", method=RequestMethod.POST)
//	public String weightList(Model m, PetVO vo) {
	//public String weightList(HttpSession session, Model m) {
		//String user_id = (String) session.getAttribute("user_id");
//		String user_id = "a123";
//		int pet_no = 2;
//		List<WeightVO> weightList = dogCare.weightList(vo);
		
//		m.addAttribute("weightList" , weightList);
//		System.out.println("dddd");

//		return "mypageDogCare";
//	}
	
//	@RequestMapping(value="/mypageDogCare", method=RequestMethod.POST)
//	public String weightList(@RequestBody PetVO vo) throws Exception {
//		dogCare.weightList(vo);
//		return "mypageDogCare";
//	}

}
