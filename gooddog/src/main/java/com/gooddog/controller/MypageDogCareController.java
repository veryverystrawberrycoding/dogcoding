package com.gooddog.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

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
	
	@RequestMapping("/mypageFace") // http://localhost:8082/mypageFace ,method=RequestMethod.GET
	public void mypageFace() {
		
	}
	
	@RequestMapping(value="/mypageFace",method = RequestMethod.POST)
	@ResponseBody
	public void mypageFaceimg(@RequestParam("file") MultipartFile file) throws Exception {
		String basePath = "C:\\git\\dogcoding\\gooddog\\src\\main\\webapp\\resources\\images\\dogface";
		String filePath = basePath + "/" + file.getOriginalFilename();
		File dest = new File(filePath); file.transferTo(dest);
	}
	
	

}
