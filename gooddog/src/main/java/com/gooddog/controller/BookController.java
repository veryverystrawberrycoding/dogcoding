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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gooddog.domain.BookVO;
import com.gooddog.domain.BookreVO;
import com.gooddog.domain.GalleryVO;
import com.gooddog.domain.GalreVO;
import com.gooddog.domain.UserVO;
import com.gooddog.service.BookService;


@Controller
public class BookController {
	
	@Autowired
	private BookService bookService;
	

		

	@RequestMapping(value="/bookList")
	public void bookList(BookVO vo,Model m,HttpServletRequest req) {
		vo.setSearchTag("Like");
		vo.setPnum(6);
		m.addAttribute("list",bookService.bookList(vo));
		m.addAttribute("num", 1); // 첫번째 페이지
		//총 페이지
		int count = bookService.bookcount(); //총 게시글 수

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
	}

///////////////////////////////////////////	
 //상세보기
	
	@RequestMapping(value="/bookView")
	public void bookView(Model m, BookVO vo,HttpServletRequest req) {
		
		//세션
		HttpSession session = req.getSession();
		UserVO sessionvo = (UserVO)session.getAttribute("user");
		if(sessionvo != null) {
			vo.setUser_id(sessionvo.getUser_id());
		}

		int no = vo.getDic_no(); 
		//게시글 내용
		Map<String, Object> result = bookService.bookNoList(no);
		m.addAttribute("item",result);
		
		//System.out.println(result.get("gal_tag"));
		
		//조회수 증가
		bookService.bookcntup(no);
		
		//해시태그 처리
		
		ArrayList<String> ta = new ArrayList<String>();
		String str = (String) result.get("dic_tag");
		String[] strArr = str.split("[,]");
		
		for(int i = 0; i < strArr.length; i++) {
			strArr[i]=strArr[i].replace("","");
			//System.out.println(strArr[i]);
			ta.add(strArr[i]);
			
		}
		m.addAttribute("tag",ta);
		
		// 댓글 조회 
		//List<Map<String, Object>> commentList=galleryService.commentList(vo.getGal_no());
		vo.setPnum(0); 
		List<Map<String, Object>> commentList=bookService.commentPaging(vo);
		
		m.addAttribute("commentList",commentList);
		
		//commentPaging
		
		// 댓글 개수 조회 
		int count = bookService.commentCount(vo.getDic_no());
				
		m.addAttribute("count", count);
		
		// 사용자 좋아요 여부 확인
		int userlike = bookService.userlikeSelect(vo);
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
	///////////////////////////야이거 건들지마 ////////////////////

	///////////////////////////////////////등록/////////////
	// 게시물 작성 페이지 띄우기 
	@RequestMapping(value="/bookForm")
	public void bookForm(Model m, BookVO vo,HttpServletRequest req) {
		
		int no = vo.getDic_no();
		System.out.println("get_dic_no 컨트롤러 작동한다");
		if(no != 0) {
			m.addAttribute("item",bookService.bookNoList(no));
		}
	
		
	}
    //게시글 넘기기
	@RequestMapping(value="/bookimg",method = RequestMethod.POST)
	@ResponseBody
	public String mypageFaceimg(@RequestParam("file") MultipartFile file) throws Exception {
		System.out.println("파일명"+file.getOriginalFilename());
		String basePath = "C:\\git\\dogcoding\\gooddog\\src\\main\\webapp\\resources\\images\\book";
		String filePath = basePath + "/" + file.getOriginalFilename();
		File dest = new File(filePath); file.transferTo(dest);
		
		return "완료";
	}

	//////////////////
	@RequestMapping(value="/bookOK")
	public String bookInsert(Model m, BookVO vo,HttpServletRequest req) {
		//세션
		HttpSession session = req.getSession();
		UserVO sessionvo = (UserVO)session.getAttribute("user");
	    vo.setUser_id(sessionvo.getUser_id());
	    
	    System.out.println("#####수정######");
	    if((vo.getDic_img()).equals("")){
	    	vo.setDic_img(null);
	    	
	    }
		
		
		int no = vo.getDic_no();
		//System.out.println(no);
		if(no != 0) {
			//게시글번호 있으면 update
			bookService.bookUpdate(vo);
			return "redirect:/bookView?dic_no="+no;
		}
		else {
			//게시글번호 없으면 insert
			//System.out.println(vo.getGal_img());
			bookService.bookInsert(vo);
			return "redirect:/bookList";
		}
		
	}
    
	///////////////////////하트 좋아요다////////////////
	@ResponseBody
	@RequestMapping(value="/bookHeartUp")
	public Object bookHeartUp(Model m, BookVO vo,@RequestParam int bookno,HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		UserVO sessionvo = (UserVO)session.getAttribute("user");
	    vo.setUser_id(sessionvo.getUser_id());
		
		vo.setDic_no(bookno);
		bookService.bookHeartUp(vo);
		bookService.userlikeInsert(vo);
		
		Map<String, Object> result = bookService.bookNoList(bookno); //게시글 좋아요 개수

		System.out.println("유저아이디 "+ vo.getUser_id());
		int userlike = bookService.userlikeSelect(vo); // 해당 user의 좋아요여부
		
		Map<String, Object> map = new HashMap<>();
		map.put("userlike", userlike);
		map.put("dic_heart", result.get("dic_heart"));
		
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value="/bookHeartDown")
	public Object bookHeartDown(Model m, BookVO vo,@RequestParam int bookno,@RequestParam String userid,HttpServletRequest req) {
		HttpSession session = req.getSession();
		UserVO sessionvo = (UserVO)session.getAttribute("user");
	    vo.setUser_id(sessionvo.getUser_id());
		
		vo.setDic_no(bookno);
		vo.setUser_id(userid);
		bookService.bookHeartDown(vo);
		bookService.userlikeDelete(vo);
		
		Map<String, Object> result = bookService.bookNoList(bookno); //게시글 좋아요 개수

		System.out.println("유저아이디 "+ vo.getUser_id());
		int userlike = bookService.userlikeSelect(vo); // 해당 user의 좋아요여부
		
		Map<String, Object> map = new HashMap<>();
		map.put("userlike", userlike);
		map.put("dic_heart", result.get("dic_heart"));
		
		
		return map;

	}
	
	@ResponseBody
	@RequestMapping(value="/bookDelete")
	public String bookDelete(Model m, BookVO vo,HttpServletRequest req,@RequestParam int bookno) {
		HttpSession session = req.getSession();
		UserVO sessionvo = (UserVO)session.getAttribute("user");
	    vo.setUser_id(sessionvo.getUser_id());

		bookService.bookDelete(bookno);
	System.out.println("삭제완료");
	
		return "게시글을 삭제했습니다";
	}
	
//	@ResponseBody
//	@RequestMapping(value="/badContent")
//	public String badContent(Model m, GalleryVO vo,HttpServletRequest req,@RequestParam int galno) {
//		HttpSession session = req.getSession();
//		UserVO sessionvo = (UserVO)session.getAttribute("user");
//    vo.setUser_id(sessionvo.getUser_id());
	    
//	    vo.setGal_no(galno);

//		galleryService.badContent(vo);
		
//		System.out.println("신고가 접수되었습니다");
//		return "신고가 접수되었습니다";
//	}
	
	//해시태그에서 넘어올 때 (갤러리 검색 enter치면 이리옴)
	@RequestMapping(value="/bookSearch")
	public String bookSearch(Model m, BookVO vo,@RequestParam String data,HttpServletRequest req) {
		
		System.out.println(data);
		vo.setSearchTag(data);
		vo.setPnum(6);
		
		m.addAttribute("list",bookService.bookSearch(vo));
		
		//HttpSession session = req.getSession();
		//UserVO sessionvo = (UserVO)session.getAttribute("user");
		m.addAttribute("user_id",vo.getUser_id());
		
		
		
		m.addAttribute("num", 1); // 첫번째 페이지
		
		
		//총 페이지 수 구하기
		int count = bookService.bookSearchcount(vo); //총 게시글 수

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
		
		return "/bookList";
	}


	
	//해시태그 클릭, 검색창 검색
	@ResponseBody
	@RequestMapping(value="/ajaxbookSearch")
	public Object ajaxbookSearch(Model m, BookVO vo,@RequestParam String tag,HttpServletRequest req) {
		
		Map<String, Object> map = new HashMap<>();
		List<BookVO> bookList;
		System.out.println(tag);
		int pagenum; //총 페이지 수
		int count;// 총 게시글 수
		vo.setSearchTag(tag);
		vo.setPnum(6);
		

		if((tag.equals("Like")) ||  (tag.equals("Hot")) ||  (tag.equals("New"))) {
			System.out.println(tag);
			
			//galList = galleryService.galSelect(tag);
			bookList = bookService.bookList(vo);
			
			//총 페이지 수 구하기
			count = bookService.bookcount(); //총 게시글 수
			
		}
		
		else {
			//System.out.println(tag);
			bookList = bookService.bookSearch(vo);
			//System.out.println(galList);
			
			//총 페이지 수 구하기
			count = bookService.bookSearchcount(vo); //총 게시글 수
			System.out.println(count);

		}

		if(count%6 == 0) {
			pagenum = count/6;
		}
		else {
			pagenum = (count/6)+1; //페이지 수
		}	
		
		map.put("bookList", bookList);
		map.put("num", 1);
		map.put("page", pagenum);
		map.put("tag", tag);
		
		
		return map;
	}
	
	

	
	
////////////////////////잠만 스	
	//댓글페이징
	@ResponseBody
	@RequestMapping(value="/ajaxbookcommentselect")
	public Object ajaxbookcommentselect(BookreVO vo, BookVO gvo, @RequestParam int bookno, @RequestParam int pnum, HttpServletRequest req ) {
		
		//ajax로 보낼거
		System.out.println(bookno);
		System.out.println((pnum-1)*5);
		gvo.setDic_no(bookno);
		gvo.setPnum((pnum-1)*5);
				
		//댓글 조회
		List<Map<String, Object>> commentList=bookService.commentPaging(gvo);
			
						
		// 댓글 개수 조회 
		int count = bookService.commentCount(bookno);
		
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
	
	///////////////////////////////댓글 입력/////////////////////확인해라그냥 댓글쪽 다시 다 봐 ///뭔가 이상해
	@ResponseBody
	@RequestMapping(value="/bookcommentInsert")
	public Object bookcommentInsert(BookreVO vo,BookVO gvo,@RequestParam String comment,@RequestParam int bookno,HttpServletRequest req) {
		HttpSession session = req.getSession();
		UserVO sessionvo = (UserVO)session.getAttribute("user");
	    vo.setUser_id(sessionvo.getUser_id());
		
		
		vo.setBookre_content(comment);
		vo.setDic_no(bookno);
		bookService.commentInsert(vo);
		System.out.println("댓글입력완료");
		
		
		//ajax로 보낼거
		
		gvo.setDic_no(bookno);
		gvo.setPnum(0);
		
		//댓글 조회
		List<Map<String, Object>> commentList=bookService.commentPaging(gvo);
	
				
		// 댓글 개수 조회 
		int count = bookService.commentCount(bookno);
		
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
	@RequestMapping(value="/bookcommentDelete")
	public Object bookcommentDelete(BookreVO vo,BookVO gvo,@RequestParam int bookno,@RequestParam int bookreno,HttpServletRequest req) {
		HttpSession session = req.getSession();
		UserVO sessionvo = (UserVO)session.getAttribute("user");
	    vo.setUser_id(sessionvo.getUser_id());
		
		
		vo.setBookre_no(bookreno);
		bookService.commentDelete(vo);
		System.out.println("삭제완료");
		
		//ajax로 보낼거
		
		gvo.setDic_no(bookno);
		gvo.setPnum(0);
		
		//댓글 조회
		List<Map<String, Object>> commentList=bookService.commentPaging(gvo);
			
						
		// 댓글 개수 조회 
		int count = bookService.commentCount(bookno);
		
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

}

