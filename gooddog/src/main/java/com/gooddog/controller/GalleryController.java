package com.gooddog.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

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
		vo.setSearchTag("Like");
		vo.setPnum(6);
		m.addAttribute("list",galleryService.galleryList(vo));
		m.addAttribute("num", 1); // 첫번째 페이지
		
		
		//총 페이지 수 구하기
		int count = galleryService.galcount(); //총 게시글 수

		int pagenum; //총 페이지 수
		if(count%6 == 0) {
			pagenum = count/6;
		}
		else {
			pagenum = (count/6)+1; //페이지 수
		}	
		System.out.println(pagenum);
		
		m.addAttribute("page",pagenum);
		m.addAttribute("tag", "Like");
		
		
		
	
		HttpSession session = req.getSession();
		UserVO sessionvo = (UserVO)session.getAttribute("user");
//	    //System.out.println(sessionvo.getUser_id());
//		
//	    //user id 값 넘기기
//		m.addAttribute("user_id",sessionvo.getUser_id());

	}
	

	@RequestMapping(value="/test")
	public void test(Model m, GalleryVO vo,HttpServletRequest req) {
		m.addAttribute("name", "안녕");
		
		List<GalleryVO> galtag = galleryService.galtag();
		
		m.addAttribute("tag", galtag);
		
		//System.out.println(galtag.get(0).getGal_tag());
		
		//System.out.println(galtag.size()); //18
		
		String[] str = new String[galtag.size()];
		
		ArrayList<String> result = new ArrayList<String>();
		
		Map<String, Integer> tagSum = new HashMap<>();
		
		int value; //임시값
		
		for(int i = 0; i < galtag.size(); i++) {
			//System.out.println(galtag.get(i).getGal_tag());
			str[i] = galtag.get(i).getGal_tag();
		}
		
		for(int i = 0;i<str.length;i++) {
			//System.out.println(str[i]);
			
			for(int j=0 ; j<(str[i].split("[,]")).length;j++) {
				//System.out.println(((str[i].split("[,]"))[j]).replace("'","").trim());
				result.add(((str[i].split("[,]"))[j]).replace("'","").trim());
			}
		}
		
		for(int i=0; i<result.size(); i++) {
			if(!tagSum.containsKey(result.get(i))) {
				tagSum.put(result.get(i), 1);
			}
			else {
				//value = (int) tagSum.get(result.get(i)) +1;
				value = tagSum.get(result.get(i)) +1;
				tagSum.put(result.get(i), value);

			}
		}
		System.out.println(tagSum);
		
		
		
		
//		Map<String, Integer> tagTree = new TreeMap<>(tagSum);
//		
//		
//		for (String i : tagTree.keySet()) {
//		    System.out.println(i);
//		}
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
		
		//조회수 증가
		galleryService.galcntup(no);
		
		//해시태그 처리
		
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
		//List<Map<String, Object>> commentList=galleryService.commentList(vo.getGal_no());
		vo.setPnum(0); 
		List<Map<String, Object>> commentList=galleryService.commentPaging(vo);
		
		m.addAttribute("commentList",commentList);
		
		//commentPaging
		
		// 댓글 개수 조회 
		int count = galleryService.commentCount(vo.getGal_no());
				
		m.addAttribute("count", count);
		
		// 사용자 좋아요 여부 확인
		int userlike = galleryService.userlikeSelect(vo);
		Map<String, Object> map = new HashMap<>();
		map.put("userlike", userlike);
	
		m.addAttribute("userlike", map); //${userlike.userlike}
		
		//////////////페이징 관련////////////////
		int pagenum;
		if(count%5 == 0) {
			pagenum = count/5;
		}
		else {
			pagenum = (count/5)+1; //페이지 수
		}	
		System.out.println(pagenum);
		
		m.addAttribute("page",pagenum);

	}
	
	
	
	@RequestMapping(value="/galleryForm")
	public void galleryForm(Model m, GalleryVO vo,HttpServletRequest req) {
		
		int no = vo.getGal_no();
		//System.out.println(no);
		if(no != 0) {
			m.addAttribute("item",galleryService.galNoList(no));
		}
	
		
	}
	
	@RequestMapping(value="/galimg",method = RequestMethod.POST)
	@ResponseBody
	public String galimg(@RequestParam("file") MultipartFile file) throws Exception {
		//System.out.println("파일명"+file.getOriginalFilename());
		String basePath = "C:\\git\\dogcoding\\gooddog\\src\\main\\webapp\\resources\\images\\gallery";
		String filePath = basePath + "/" + file.getOriginalFilename();
		File dest = new File(filePath); file.transferTo(dest);
		
		return "완료";
	}

	
	@RequestMapping(value="/galleryOK")
	public String galInsert(Model m, GalleryVO vo,HttpServletRequest req) {
		//세션
		HttpSession session = req.getSession();
		UserVO sessionvo = (UserVO)session.getAttribute("user");
	    vo.setUser_id(sessionvo.getUser_id());
	    
	    if((vo.getGal_img()).equals("")){
	    	vo.setGal_img(null);
	    	
	    }
		
		
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
	public Object galHeartUp(Model m, GalleryVO vo,@RequestParam int galno,HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		UserVO sessionvo = (UserVO)session.getAttribute("user");
	    vo.setUser_id(sessionvo.getUser_id());
		
		vo.setGal_no(galno);
		galleryService.galHeartUp(vo);
		galleryService.userlikeInsert(vo);
		
		Map<String, Object> result = galleryService.galNoList(galno); //게시글 좋아요 개수

		System.out.println("유저아이디 "+ vo.getUser_id());
		int userlike = galleryService.userlikeSelect(vo); // 해당 user의 좋아요여부
		
		Map<String, Object> map = new HashMap<>();
		map.put("userlike", userlike);
		map.put("gal_heart", result.get("gal_heart"));
		
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value="/galHeartDown")
	public Object galHeartDown(Model m, GalleryVO vo,@RequestParam int galno,@RequestParam String userid,HttpServletRequest req) {
		HttpSession session = req.getSession();
		UserVO sessionvo = (UserVO)session.getAttribute("user");
	    vo.setUser_id(sessionvo.getUser_id());
		
		vo.setGal_no(galno);
		vo.setUser_id(userid);
		galleryService.galHeartDown(vo);
		galleryService.userlikeDelete(vo);
		
		Map<String, Object> result = galleryService.galNoList(galno); //게시글 좋아요 개수

		System.out.println("유저아이디 "+ vo.getUser_id());
		int userlike = galleryService.userlikeSelect(vo); // 해당 user의 좋아요여부
		
		Map<String, Object> map = new HashMap<>();
		map.put("userlike", userlike);
		map.put("gal_heart", result.get("gal_heart"));
		
		
		return map;

	}
	
	@ResponseBody
	@RequestMapping(value="/galDelete")
	public String galDelete(Model m, GalleryVO vo,HttpServletRequest req,@RequestParam int galno) {
		HttpSession session = req.getSession();
		UserVO sessionvo = (UserVO)session.getAttribute("user");
	    vo.setUser_id(sessionvo.getUser_id());

		galleryService.galDelete(galno);
		System.out.println("삭제완료");
	
		return "게시글을 삭제했습니다";
	}
	
	@ResponseBody
	@RequestMapping(value="/badContent")
	public String badContent(Model m, GalleryVO vo,HttpServletRequest req,@RequestParam int galno) {
		HttpSession session = req.getSession();
		UserVO sessionvo = (UserVO)session.getAttribute("user");
	    vo.setUser_id(sessionvo.getUser_id());
	    
	    vo.setGal_no(galno);

		galleryService.badContent(vo);
		
		System.out.println("신고가 접수되었습니다");
		return "신고가 접수되었습니다";
	}
	
	//해시태그에서 넘어올 때 (갤러리 검색 enter치면 이리옴)
	@RequestMapping(value="/galSearch")
	public String galSearch(Model m, GalleryVO vo,@RequestParam String data,HttpServletRequest req) {
		
		System.out.println(data);
		vo.setSearchTag(data);
		vo.setPnum(6);
		
		m.addAttribute("list",galleryService.galSearch(vo));
		
		//HttpSession session = req.getSession();
		//UserVO sessionvo = (UserVO)session.getAttribute("user");
		m.addAttribute("user_id",vo.getUser_id());
		
		
		
		m.addAttribute("num", 1); // 첫번째 페이지
		
		
		//총 페이지 수 구하기
		int count = galleryService.galSearchcount(vo); //총 게시글 수

		int pagenum; //총 페이지 수
		if(count%6 == 0) {
			pagenum = count/6;
		}
		else {
			pagenum = (count/6)+1; //페이지 수
		}	
		System.out.println(pagenum);
		
		m.addAttribute("page",pagenum);
		
		m.addAttribute("tag", data);
		
		return "/galleryList";
	}


	
	//해시태그 클릭, 검색창 검색
	@ResponseBody
	@RequestMapping(value="/ajaxgalSearch")
	public Object ajaxgalSearch(Model m, GalleryVO vo,@RequestParam String tag,HttpServletRequest req) {
		
		Map<String, Object> map = new HashMap<>();
		List<GalleryVO> galList;
		System.out.println(tag);
		int pagenum; //총 페이지 수
		int count;// 총 게시글 수
		vo.setSearchTag(tag);
		vo.setPnum(6);
		

		if((tag.equals("Like")) ||  (tag.equals("Hot")) ||  (tag.equals("New"))) {
			System.out.println(tag);
			
			//galList = galleryService.galSelect(tag);
			galList = galleryService.galleryList(vo);
			
			//총 페이지 수 구하기
			count = galleryService.galcount(); //총 게시글 수
			
		}
		
		else {
			//System.out.println(tag);
			galList = galleryService.galSearch(vo);
			//System.out.println(galList);
			
			//총 페이지 수 구하기
			count = galleryService.galSearchcount(vo); //총 게시글 수
			System.out.println(count);

		}

		if(count%6 == 0) {
			pagenum = count/6;
		}
		else {
			pagenum = (count/6)+1; //페이지 수
		}	
		
		map.put("galList", galList);
		map.put("num", 1);
		map.put("page", pagenum);
		map.put("tag", tag);
		
		
		return map;
	}
	
	
	//게시글 페이징
	
	@ResponseBody
	@RequestMapping(value="/ajaxgalselect")
	public Object ajaxgalselect(Model m, GalleryVO vo,@RequestParam String tag,@RequestParam int num,HttpServletRequest req) {

		Map<String, Object> map = new HashMap<>();
		List<GalleryVO> galList;
		vo.setPnum((num+1)*6);
		vo.setSearchTag(tag);
		
		int pagenum; //총 페이지 수
		int count; //총 게시글 수
		
		if((tag.equals("Like")) ||  (tag.equals("Hot")) ||  (tag.equals("New"))) {
			//System.out.println(tag);
			
			galList = galleryService.galleryList(vo);
			
			//총 페이지 수 구하기
			count = galleryService.galcount(); //총 게시글 수

		}
		else {
			//System.out.println(tag);
			galList = galleryService.galSearch(vo);
			//System.out.println(galList);
			
			//총 페이지 수 구하기
			count = galleryService.galSearchcount(vo); //총 게시글 수
			//System.out.println(count);
	
		}
		
		if(count%6 == 0) {
			pagenum = count/6;
		}
		else {
			pagenum = (count/6)+1; //페이지 수
		}	
		map.put("galList", galList);
		map.put("num", num+1);
		map.put("page", pagenum);
		map.put("tag", tag);
		
		return map;
	}
	
	//댓글페이징
	@ResponseBody
	@RequestMapping(value="/ajaxcommentselect")
	public Object ajaxcommentselect(GalreVO vo, GalleryVO gvo, @RequestParam int galno, @RequestParam int pnum, HttpServletRequest req ) {
		
		//ajax로 보낼거
		System.out.println(galno);
		System.out.println((pnum-1)*5);
		gvo.setGal_no(galno);
		gvo.setPnum((pnum-1)*5);
				
		//댓글 조회
		List<Map<String, Object>> commentList=galleryService.commentPaging(gvo);
			
						
		// 댓글 개수 조회 
		int count = galleryService.commentCount(galno);
		
		// 페이지 개수
		int pagenum;
		if(count%5 == 0) {
			pagenum = count/5;
		}
		else {
			pagenum = (count/5)+1; //페이지 수
		}	
				
				
		Map<String, Object> map = new HashMap<>();
		map.put("commentList", commentList);
		map.put("count", count);
		map.put("page",pagenum);
				
				
		//return map;
		return map;
	}
	
	//댓글 입력
	@ResponseBody
	@RequestMapping(value="/commentInsert")
	public Object commentInsert(GalreVO vo,GalleryVO gvo,@RequestParam String comment,@RequestParam int galno,HttpServletRequest req) {
		HttpSession session = req.getSession();
		UserVO sessionvo = (UserVO)session.getAttribute("user");
	    vo.setUser_id(sessionvo.getUser_id());
		
		
		vo.setGalre_content(comment);
		vo.setGal_no(galno);
		galleryService.commentInsert(vo);
		System.out.println("댓글입력완료");
		
		
		//ajax로 보낼거
		
		gvo.setGal_no(galno);
		gvo.setPnum(0);
		
		//댓글 조회
		List<Map<String, Object>> commentList=galleryService.commentPaging(gvo);
	
				
		// 댓글 개수 조회 
		int count = galleryService.commentCount(galno);
		
		// 페이지 개수
		int pagenum;
		if(count%5 == 0) {
			pagenum = count/5;
		}
		else {
			pagenum = (count/5)+1; //페이지 수
		}	
						
		
		Map<String, Object> map = new HashMap<>();
		map.put("commentList", commentList);
		map.put("count", count);
		map.put("page",pagenum);
		
		
		return map;

	}
	
	//댓글 삭제
	@ResponseBody
	@RequestMapping(value="/commentDelete")
	public Object commentDelete(GalreVO vo,GalleryVO gvo,@RequestParam int galno,@RequestParam int galreno,HttpServletRequest req) {
		HttpSession session = req.getSession();
		UserVO sessionvo = (UserVO)session.getAttribute("user");
	    vo.setUser_id(sessionvo.getUser_id());
		
		
		vo.setGalre_no(galreno);
		galleryService.commentDelete(vo);
		System.out.println("삭제완료");
		
		//ajax로 보낼거
		
		gvo.setGal_no(galno);
		gvo.setPnum(0);
		
		//댓글 조회
		List<Map<String, Object>> commentList=galleryService.commentPaging(gvo);
			
						
		// 댓글 개수 조회 
		int count = galleryService.commentCount(galno);
		
		// 페이지 개수
		int pagenum;
		if(count%5 == 0) {
			pagenum = count/5;
		}
		else {
			pagenum = (count/5)+1; //페이지 수
		}	
				
				
		Map<String, Object> map = new HashMap<>();
		map.put("commentList", commentList);
		map.put("count", count);
		map.put("page",pagenum);
				
				
		return map;
		
	}
	
	////////////////////////////견종판별 및 챗봇
	
	@RequestMapping("/breedCheck")
	public void mypageFace() {
		
	}
	
	@RequestMapping("/chatbot")
	public void chatbot() {
		
	}
	
	
	@RequestMapping(value="/breedCheck",method = RequestMethod.POST)
	@ResponseBody
	public void mypageFaceimg(@RequestParam("file") MultipartFile file) throws Exception {
		String basePath = "C:\\git\\dogcoding\\gooddog\\src\\main\\webapp\\resources\\images\\dogface";
		String filePath = basePath + "/" + file.getOriginalFilename();
		File dest = new File(filePath); file.transferTo(dest);
	}

}
