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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.gooddog.domain.GalleryVO;
import com.gooddog.domain.GalreVO;
import com.gooddog.domain.UserVO;
import com.gooddog.service.GalleryService;

@Controller
public class GalleryController {
	
	@Autowired
	private GalleryService galleryService;
	
	
	@RequestMapping(value="/galleryList")
	public void galleryList(GalleryVO vo,Model m,HttpServletRequest req) {
		m.addAttribute("list",galleryService.galleryList());
	
//		HttpSession session = req.getSession();
//		UserVO sessionvo = (UserVO)session.getAttribute("user");
//	    System.out.println(sessionvo.getUser_id());
		
	    //user id 값 넘기기
		//m.addAttribute("user_id",sessionvo.getUser_id());

		
	}
	
	@RequestMapping(value="/galleryView")
	public void galleryView(Model m, GalleryVO vo,HttpServletRequest req) {
		
		//세션
		HttpSession session = req.getSession();
		UserVO sessionvo = (UserVO)session.getAttribute("user");
		if(sessionvo != null) {
			vo.setUser_id(sessionvo.getUser_id());
		}

		int no = vo.getGal_no(); 
		//게시글 내용
		Map<String, Object> result = galleryService.galNoList(no);
		m.addAttribute("item",result);
		
		//System.out.println(result.get("gal_tag"));
		
		ArrayList<String> ta = new ArrayList<String>();
		String str = (String) result.get("gal_tag");
		String[] strArr = str.split("[,]");
		
		for(int i = 0; i < strArr.length; i++) {
			strArr[i]=strArr[i].replace("'","");
			//System.out.println(strArr[i]);
			ta.add(strArr[i]);
			
		}
		m.addAttribute("tag",ta);
		
		// 댓글 조회 
		List<Map<String, Object>> commentList=galleryService.commentList(vo);
		m.addAttribute("commentList",commentList);
		
		// 댓글 개수 조회 
		int count = galleryService.commentCount(vo);
				
		m.addAttribute("count", count);
		
		// 사용자 좋아요 여부 확인
		int userlike = galleryService.userlikeSelect(vo);
		Map<String, Object> map = new HashMap<>();
		map.put("userlike", userlike);
	
		m.addAttribute("userlike", map); //${userlike.userlike}

	

	}
	
	@RequestMapping(value="/galleryForm")
	public void galleryForm(Model m, GalleryVO vo,HttpServletRequest req) {
		
		int no = vo.getGal_no();
		//System.out.println(no);
		if(no != 0) {
			m.addAttribute("item",galleryService.galNoList(no));
		}
	
		
	}

	
	@RequestMapping(value="/galleryOK")
	public String galInsert(Model m, GalleryVO vo,HttpServletRequest req) {
		//세션
		HttpSession session = req.getSession();
		UserVO sessionvo = (UserVO)session.getAttribute("user");
	    vo.setUser_id(sessionvo.getUser_id());
		
		
		int no = vo.getGal_no();
		//System.out.println(no);
		if(no != 0) {
			//게시글번호 있으면 update
			galleryService.galUpdate(vo);
			return "redirect:/galleryView?gal_no="+no;
		}
		else {
			//게시글번호 없으면 insert
			//System.out.println(vo.getGal_img());
			galleryService.galInsert(vo);
			return "redirect:/galleryList";
		}
		
	}
	
	
	@ResponseBody
	@RequestMapping(value="/galHeartUp")
	public String galHeartUp(Model m, GalleryVO vo,@RequestParam int galno,HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		UserVO sessionvo = (UserVO)session.getAttribute("user");
	    vo.setUser_id(sessionvo.getUser_id());
		
		vo.setGal_no(galno);
		galleryService.galHeartUp(vo);
		galleryService.userlikeInsert(vo);
		return "좋아요♡";
	}
	
	@ResponseBody
	@RequestMapping(value="/galHeartDown")
	public String galHeartDown(Model m, GalleryVO vo,@RequestParam int galno,@RequestParam String userid,HttpServletRequest req) {
		HttpSession session = req.getSession();
		UserVO sessionvo = (UserVO)session.getAttribute("user");
	    vo.setUser_id(sessionvo.getUser_id());
		
		vo.setGal_no(galno);
		vo.setUser_id(userid);
		galleryService.galHeartDown(vo);
		
		galleryService.userlikeDelete(vo);
		return "좋아요 취소";
	}
	
	@RequestMapping(value="/galDelete")
	public String galDelete(Model m, GalleryVO vo,HttpServletRequest req) {
		HttpSession session = req.getSession();
		UserVO sessionvo = (UserVO)session.getAttribute("user");
	    vo.setUser_id(sessionvo.getUser_id());

		galleryService.galDelete(vo.getGal_no());
		System.out.println("삭제완료");
		
		return "redirect:/galleryList";
	}
	
	@RequestMapping(value="/galimg",method = RequestMethod.POST)
	@ResponseBody
	public String mypageFaceimg(@RequestParam("file") MultipartFile file) throws Exception {
		//System.out.println("파일명"+file.getOriginalFilename());
		String basePath = "C:\\git\\dogcoding\\gooddog\\src\\main\\webapp\\resources\\images\\gallery";
		String filePath = basePath + "/" + file.getOriginalFilename();
		File dest = new File(filePath); file.transferTo(dest);
		
		return "완료";
	}
	
	
	@RequestMapping(value="/galSearch")
	public String galSearch(Model m, GalleryVO vo,@RequestParam String data,HttpServletRequest req) {
		
		//System.out.println(data);
		
		m.addAttribute("list",galleryService.galSearch(data));
		
		m.addAttribute("user_id",vo.getUser_id());
		
		
		return "/galleryList";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/ajaxgalSearch")
	public void ajaxgalSearch(Model m, GalleryVO vo,@RequestParam String tag,HttpServletRequest req) {
		
		//System.out.println(tag);
		
		m.addAttribute("list",galleryService.galSearch(tag));
		
		m.addAttribute("user_id",vo.getUser_id());
		
		//String result = "완료";
		
		//return result;
	}
	
	//댓글 입력
	@ResponseBody
	@RequestMapping(value="/commentInsert")
	public String commentInsert(GalreVO vo,@RequestParam String comment,@RequestParam int galno,HttpServletRequest req) {
		HttpSession session = req.getSession();
		UserVO sessionvo = (UserVO)session.getAttribute("user");
	    vo.setUser_id(sessionvo.getUser_id());
		
		
		vo.setGalre_content(comment);
		vo.setGal_no(galno);
		galleryService.commentInsert(vo);
		System.out.println(comment);
		
		return "입력완료";
	}
	
	//댓글 삭제
	@ResponseBody
	@RequestMapping(value="/commentDelete")
	public String commentDelete(GalreVO vo,@RequestParam int galreno,HttpServletRequest req) {
		HttpSession session = req.getSession();
		UserVO sessionvo = (UserVO)session.getAttribute("user");
	    vo.setUser_id(sessionvo.getUser_id());
		
		
		vo.setGalre_no(galreno);
		galleryService.commentDelete(vo);
		System.out.println("삭제완료");
		
		return "삭제완료";
	}
	
	
	//댓글 보기
	@ResponseBody
	@RequestMapping(value="/commentShow")
	public List<Map<String, Object>> commentShow(GalleryVO vo,Model m,@RequestParam int galno,HttpServletRequest req) {
		
		
//		HttpSession session = req.getSession();
//		UserVO sessionvo = (UserVO)session.getAttribute("user");
//		sessionvo.getUser_id()
		vo.setGal_no(galno);
		
		List<Map<String, Object>> commentList=galleryService.commentList(vo);
		m.addAttribute("commentList",commentList);
				
		// 댓글 개수 조회 
		int count = galleryService.commentCount(vo);
						
		m.addAttribute("count", count);
		
		return commentList;
	}

}
