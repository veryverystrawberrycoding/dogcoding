package com.gooddog.controller;


import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.gooddog.domain.PetVO;
import com.gooddog.domain.UserVO;
import com.gooddog.service.LogJoinService;
import com.gooddog.service.MypageService;

@Controller
public class MypageController {
	
	@Autowired
	private MypageService mypageService;
	
	@Autowired
	private LogJoinService logJoinService; 
	
	@RequestMapping("/dogList")
	@ResponseBody
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
	@ResponseBody
	public void dogModify(PetVO vo) {
		mypageService.dogModify(vo);
	} 
	
	@PostMapping("/dogDelete")
	@ResponseBody
	public void dogDelete(PetVO vo) {
		mypageService.dogDelete(vo);
	}
	
	@PostMapping("/passCheck")
	@ResponseBody
	public int passCheck(UserVO vo) {
		return mypageService.passCheck(vo);
	}
	
	@PostMapping("/userModify")
	@ResponseBody
	public void userModify(UserVO vo, HttpServletRequest req) {
		HttpSession session = req.getSession();
		UserVO sessionvo = (UserVO)session.getAttribute("user");
		vo.setUser_id(sessionvo.getUser_id()); 
		mypageService.userModify(vo);
	}
	
	@PostMapping("/noPwdModify")
	@ResponseBody
	public void noPwdModify(UserVO vo, HttpServletRequest req) {
		HttpSession session = req.getSession();
		UserVO sessionvo = (UserVO)session.getAttribute("user");
		vo.setUser_id(sessionvo.getUser_id());
		mypageService.noPwdModify(vo);
	}
	
	@PostMapping("/myGalList")
	@ResponseBody
	public List<Map<String, Object>> myGalList(UserVO vo, HttpServletRequest req) {
		HttpSession session = req.getSession();
		UserVO sessionvo = (UserVO)session.getAttribute("user");
		vo.setUser_id(sessionvo.getUser_id());
		return mypageService.myGalList(vo);
	}
	  
	@PostMapping("/myGalReply")
	@ResponseBody
	public List<Map<String, Object>> myGalReply(UserVO vo, HttpServletRequest req) {
		System.out.println("마이페이지댓글");
		HttpSession session = req.getSession();
		UserVO sessionvo = (UserVO)session.getAttribute("user");
		vo.setUser_id(sessionvo.getUser_id());
		System.out.println(mypageService.myGalReply(vo));
		return mypageService.myGalReply(vo);
	}
	
	@PostMapping("/pwdModify")
	@ResponseBody
	public Map<String, Object> pwdModify(@RequestParam("now_pwd") String now_pwd, UserVO vo, HttpServletRequest req){
		HttpSession session = req.getSession();
		UserVO sessionvo = (UserVO)session.getAttribute("user");
		vo.setUser_id(sessionvo.getUser_id());
		
		Map<String,Object> map = new HashMap<String,Object>();
		if(now_pwd.equals(sessionvo.getUser_pwd())) {
			mypageService.pwdModify(vo);
			map.put("pwd","0");
		}else {
			map.put("pwd","1");
		}
		return map; 
	}
	
	@PostMapping("/modifyFile")
	@ResponseBody
	public String modifyFile(@RequestParam("file") MultipartFile file) throws Exception {
		//System.out.println("파일명"+file.getOriginalFilename());
		String basePath = "C:\\git\\dogcoding\\gooddog\\src\\main\\webapp\\resources\\images\\userimg";
		String filePath = basePath + "/" + file.getOriginalFilename();
		File dest = new File(filePath); file.transferTo(dest);
		
		return "완료"; 
	}
	
	@PostMapping("/modifyImg")
	@ResponseBody
	public void modifyImg(UserVO vo, HttpServletRequest req) { 
		HttpSession session = req.getSession();
		UserVO sessionvo = (UserVO)session.getAttribute("user");
		vo.setUser_id(sessionvo.getUser_id());
		mypageService.modifyFile(vo);  
	} 
	
	
	@PostMapping("/petInput")
	@ResponseBody
	public void petInput(PetVO vo, HttpServletRequest req) {
		HttpSession session = req.getSession();
		UserVO sessionvo = (UserVO)session.getAttribute("user");
		vo.setUser_id(sessionvo.getUser_id());
		mypageService.petInput(vo); 
	}
	
	
	@RequestMapping(value="/uploadFile",method = RequestMethod.POST)
	@ResponseBody
	public String dogImg(@RequestParam("file") MultipartFile file) throws Exception {
		//System.out.println("파일명"+file.getOriginalFilename());
		String basePath = "C:\\git\\dogcoding\\gooddog\\src\\main\\webapp\\resources\\images\\userdog";
		String filePath = basePath + "/" + file.getOriginalFilename();
		File dest = new File(filePath); file.transferTo(dest);
		 
		return "완료"; 
	} 
	
	@RequestMapping(value="/joinImg",method = RequestMethod.POST)
	@ResponseBody
	public String UserImg(@RequestParam("file") MultipartFile file) throws Exception {
		//System.out.println("파일명"+file.getOriginalFilename());
		String basePath = "C:\\git\\dogcoding\\gooddog\\src\\main\\webapp\\resources\\images\\userimg";
		String filePath = basePath + "/" + file.getOriginalFilename();
		File dest = new File(filePath); file.transferTo(dest); 
		 
		return "완료"; 
	}
	@RequestMapping(value="/modifyFileDog",method = RequestMethod.POST)
	@ResponseBody
	public void modifyFileDog(@RequestParam("file") MultipartFile file) throws Exception {
		String basePath = "C:\\git\\dogcoding\\gooddog\\src\\main\\webapp\\resources\\images\\userdog";
		String filePath = basePath + "/" + file.getOriginalFilename();
		File dest = new File(filePath); file.transferTo(dest);
	}
	
	 
	@RequestMapping(value="/profile", method = RequestMethod.GET)
	public void profile(HttpServletRequest hsq, Model m) {
		String uid = hsq.getParameter("name");
		UserVO vo = new UserVO();
		vo.setUser_id(uid);
		UserVO uvo = logJoinService.userSelect(vo);
		List<PetVO> pvo = mypageService.dogList(uid);
		m.addAttribute("uvo", uvo); 
		m.addAttribute("pvo",pvo);
	}
	 
}
