package com.gooddog.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.gooddog.domain.BadcontentVO;
import com.gooddog.domain.BlackVO;
import com.gooddog.domain.BookVO; 
import com.gooddog.domain.GalleryVO;
import com.gooddog.domain.LossVO; 
import com.gooddog.domain.UserVO;
import com.gooddog.service.AdminService;

import helper.PageHelper;
import helper.WebHelper;

@Controller
@Component
@ComponentScan("helper")
public class AdminController {

	@Autowired
	AdminService AdminService;
	
	@Autowired
	WebHelper web;
	
	@Autowired
	PageHelper page;
	
	   //로그아웃
	   @RequestMapping("/logout")
	   public String logout(HttpSession session) {
	      session.invalidate();
	      return "redirect:/mainPage";
	   }  
		
	   // 차트페이지 
		@RequestMapping(value="/admin/admin_chart.do",method = {RequestMethod.GET, RequestMethod.POST})
		public ModelAndView admin_chart(Model m, HttpServletResponse response) {
			//일별 데이터
			List<Map<String,String>> dayCount= AdminService.getDayCount();
			//주별 데이터
			List<Map<String,String>> weekCount= AdminService.getweekCount();
			//성별 데이터
			int womenCount = AdminService.getWomenCount();
	  		int menCount = AdminService.getMenCount();
	  
			// 전체 회원 수
	  		int totaluser = AdminService.totaluser();
			// 어제 가입자 수
	  		int dayuser = AdminService.dayuser();
			// 이번달 가입자 수
	  		int monthuser = AdminService.monthuser();
			// 올해 가입자 수
	  		int yearuser = AdminService.yearuser();
	  		// 모델에 각 데이터 담기 
	  	     m.addAttribute("totaluser",totaluser);
	  		 m.addAttribute("dayuser",dayuser);
	  		 m.addAttribute("monthuser",monthuser);
	  		 m.addAttribute("yearuser",yearuser);
	  		 m.addAttribute("dayCount",dayCount);
	         m.addAttribute("weekCount",weekCount);
	  		 m.addAttribute("menCount",menCount);
	         m.addAttribute("womenCount",womenCount); 
	         
//	         System.out.println(totaluser);
//	         System.out.println(dayuser);
//	         System.out.println(monthuser);
//	         System.out.println(yearuser); 
	         
			return new ModelAndView("/admin/admin_chart") ;
		}
		
	
	//관리자페이지 회원관리 페이지 
	@RequestMapping(value = "/admin/admin_table.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView admin_table(Model m, HttpServletResponse response) {

		return new ModelAndView("/admin/admin_table") ;
	}
	
	// 회원 목록 페이징 및 리스트
	/**
	 * 회원 목록
	 * @param UserVO
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value="/userList", method=RequestMethod.POST)
	public void userList(Locale locale, Model model, UserVO UserVO, HttpServletResponse response ){
		
		web.init(response); 
		response.setContentType("application/json");
		
		
 		UserVO user = new UserVO();
 		// 현재 페이지 번호를 가져옴, 없으면 1부터 시작
		int nowPage = web.getInt("page", 1);  		
		
		// 전체 사용자 수
		int userCount = 0;							
		try {
			userCount = AdminService.getUserCount(user);
		} catch (Exception e) {
			e.printStackTrace(); 
		}
	
		// 10개의 데이터 뿌리고 다음페이지 생성
		page.pageProcess(nowPage, userCount, 10, 5);		
		user.setLimitStart(page.getLimitStart());
		user.setListCount(page.getListCount());
		
		List<UserVO> list = null;
		list = AdminService.getUserList(user);		
			
		Map<String, Object> data = new HashMap<String, Object>();
		// 다음페이지
		int nextPage = page.getNextPage();	
		// 이전페이지
		int prevPage =page.getPrevPage();	
		int pageIn = page.getPage();
	
		data.put("list", list); 
		data.put("prevPage", prevPage);
		data.put("nextPage", nextPage);
		data.put("pageIn", pageIn);
		data.put("page", page);		
		
		
		ObjectMapper mapper = new ObjectMapper();
		try {
			mapper.writeValue(response.getWriter(), data);
		} catch (JsonGenerationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	//관리자페이지 블랙리스트 추가 페이지 
		@RequestMapping(value = "/admin/addblack.do", method = {RequestMethod.GET, RequestMethod.POST})
		public ModelAndView addblack(Model m, HttpServletResponse response) {
			  
		return new ModelAndView("/admin/addblack") ;
				
		}
		// 블랙리스트 추가
		@ResponseBody
		@RequestMapping(value = "/admin/blackadd.do" , method= { RequestMethod.POST})
		public String BlackListAdd(BlackVO vo,Model m,String term) {
		
			//가져온 정지기간을 date스타일로 변환
			String[] arr = term.split(" ");
			int termday = Integer.parseInt(arr[0]);
					
			Calendar cal = Calendar.getInstance();
			cal.setTime(new Date());
			DateFormat ddddd = new SimpleDateFormat("yyyy-MM-dd");
				
				
			// 현재 날짜
			vo.setBlack_start(ddddd.format(cal.getTime()));
			// 정지 기간 적용
			cal.add(Calendar.DATE, +termday);
			// 현재 날짜 + 정지 기간 적용
			vo.setBlack_end(ddddd.format(cal.getTime()));
					
			// vo 데이터 확인 user_id,black_start,black_end,black_content
		    // System.out.println("ID="+vo.getUser_id()+"///////START="+vo.getBlack_start()+"/////////END="+vo.getBlack_end()+"///////CONTENT="+vo.getBlack_content());
					
			AdminService.addBlackList(vo);

			return "ok";
		}
			

	//관리자페이지 블랙리스트 페이지 
	@RequestMapping(value = "/admin/admin_blacklist.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView admin_blacklist(Model m, HttpServletResponse response) {

		return new ModelAndView("/admin/admin_blacklist") ;
		
	}
	
	// 블랙리스트 목록 페이징 
	/**
	 * 블랙리스트 목록
	 * @param BlackVO
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value="/blackList", method=RequestMethod.POST)
	public void blackList(Locale locale, Model model, BlackVO BlackVO, HttpServletResponse response ){
		
		web.init(response); 
		response.setContentType("application/json");
		
		
		BlackVO black = new BlackVO();
		// 현재 페이지 번호를 가져옴, 없으면 1부터 시작
		int nowPage = web.getInt("page", 1);  		
		
		// 전체 사용자 수
		int blackCount = 0;							
		try {
			blackCount = AdminService.getblackCount(black);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		// 10개의 데이터 뿌리고 다음페이지 생성
		page.pageProcess(nowPage, blackCount, 10, 5);		
		black.setLimitStart(page.getLimitStart());
		black.setListCount(page.getListCount());
		
		List<BlackVO> list = null;
		list = AdminService.getBlackList(black);	
	
		Map<String, Object> data = new HashMap<String, Object>();
		// 다음페이지
		int nextPage = page.getNextPage();	
		// 이전페이지
		int prevPage =page.getPrevPage();
		int pageIn = page.getPage();
	
		data.put("list", list); 
		data.put("prevPage", prevPage);
		data.put("nextPage", nextPage);
		data.put("pageIn", pageIn);
		data.put("page", page);		
		
		
		ObjectMapper mapper = new ObjectMapper();
		try {
			mapper.writeValue(response.getWriter(), data);
		} catch (JsonGenerationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace(); 
		}
		
	}
	
	// 블랙리스트 해지
	@ResponseBody
	@PostMapping("/blacklistDelete")
	public void  blacklistDelete(BlackVO vo) {
			
		//System.out.println("배드 컨텐츠 작동 중");
		AdminService.blacklistDelete(vo);
				
		//vo.getUser_id();
		//System.out.println(	vo.getUser_id());
	}
	
	// 백과사전 페이지 
	@RequestMapping(value = "/admin/admin_post.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView admin_post(Model m, HttpServletResponse response) {
		
		return new ModelAndView("/admin/admin_post") ;
	}

	// 백과사전 페이징 및 리스트
	@ResponseBody
	@RequestMapping(value="/bookList", method=RequestMethod.POST)
	public void bookList(Locale locale, Model model, BookVO BookVO, HttpServletResponse response ){
		
		web.init(response); 
		response.setContentType("application/json");
		
		
 		BookVO book = new BookVO();
 	    // 현재 페이지 번호를 가져옴, 없으면 1부터 시작
		int nowPage = web.getInt("page", 1);  		
		
		// 전체 사용자 수
		int bookCount = 0;							
		try {
			bookCount = AdminService.bookCount(book);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
	 
		// 10개의 데이터 뿌리고 다음페이지 생성
		page.pageProcess(nowPage, bookCount, 10, 5);		
		book.setLimitStart(page.getLimitStart());
		book.setListCount(page.getListCount());
	
		List<BookVO> list = null;  
		list = AdminService.adminpost(book); 	

		Map<String, Object> data = new HashMap<String, Object>();
		// 다음페이지
		int nextPage = page.getNextPage();	
		// 이전페이지
		int prevPage =page.getPrevPage();	
		int pageIn = page.getPage();
	
		data.put("list", list); 
		data.put("prevPage", prevPage);
		data.put("nextPage", nextPage);
		data.put("pageIn", pageIn);
		data.put("page", page);		
		
		
		ObjectMapper mapper = new ObjectMapper();
		try {
			mapper.writeValue(response.getWriter(), data);
		} catch (JsonGenerationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	
	}

	// 백과사전 삭제 기능
	@ResponseBody
	@PostMapping("/bookDelete")
	public void bookDelete(BookVO vo) {
		//System.out.println(vo.getDic_no());
		AdminService.bookDelete(vo);
	}


	// 갤러리 관리 페이지 
	@RequestMapping(value = "/admin/admin_post2.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView admin_post2(Model m, HttpServletResponse response) {
	 
		return new ModelAndView("/admin/admin_post2") ;
		
	}
	
	// 갤러리 페이징 및 리스트
		@ResponseBody
		@RequestMapping(value="/galleryList", method=RequestMethod.POST)
		public void galleryList(Locale locale, Model model, GalleryVO GalleryVO, HttpServletResponse response ){
			
			web.init(response); 
			response.setContentType("application/json");
			
			
			GalleryVO gallery = new GalleryVO();
			// 현재 페이지 번호를 가져옴, 없으면 1부터 시작
			int nowPage = web.getInt("page", 1);  		
			
			// 전체 사용자 수
			int galleryCount = 0;						
			try {
				galleryCount = AdminService.galleryCount(gallery);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}  
		 
			// 10개의 데이터 뿌리고 다음페이지 생성
			page.pageProcess(nowPage, galleryCount, 10, 5);		
			gallery.setLimitStart(page.getLimitStart());
			gallery.setListCount(page.getListCount());
			
			
			List<GalleryVO> list = null;  
			list = AdminService.adminpost2(gallery); 	

			System.out.println(list+"list가져옴" );
			Map<String, Object> data = new HashMap<String, Object>();
			// 다음페이지
			int nextPage = page.getNextPage();
			// 이전페이지
			int prevPage =page.getPrevPage();	
			int pageIn = page.getPage();
		
			data.put("list", list); 
			data.put("prevPage", prevPage);
			data.put("nextPage", nextPage);
			data.put("pageIn", pageIn);
			data.put("page", page);		
			
			
			ObjectMapper mapper = new ObjectMapper();
			try {
				mapper.writeValue(response.getWriter(), data);
			} catch (JsonGenerationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonMappingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
		
		}

	// 갤러리 삭제 기능
	@ResponseBody
	@PostMapping("/galleryDelete")
	public void galleryDelete(GalleryVO vo) {
		//System.out.println(vo.getGal_no());
		AdminService.galleryDelete(vo);
	}
	
	
	//신고 관리 페이지
	@RequestMapping(value="/admin/admin_black.do",method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView admin_black(Model m, HttpServletResponse response) {

		return new ModelAndView("/admin/admin_black") ;
	}
	
	//신고관리 페이지 페이징 및 리스트
	@ResponseBody
	@RequestMapping(value="/badcontentList", method=RequestMethod.POST)
	public void badcontentList(Locale locale, Model model, BadcontentVO BadcontentVO, HttpServletResponse response ){
		
		web.init(response); 
		response.setContentType("application/json");
		
		BadcontentVO badcontent = new BadcontentVO();
		// 현재 페이지 번호를 가져옴, 없으면 1부터 시작
		int nowPage = web.getInt("page", 1);  		
		
		// 전체 사용자 수
		int badcontentCount = 0;						
		try {
			badcontentCount = AdminService.badcontentCount(badcontent);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
	 
		// 10개의 데이터 뿌리고 다음페이지 생성
		page.pageProcess(nowPage, badcontentCount, 10, 5);		
		badcontent.setLimitStart(page.getLimitStart());
		badcontent.setListCount(page.getListCount());
		
		List<BadcontentVO> list = null;  
		list = AdminService.badcontent(badcontent); 	

		Map<String, Object> data = new HashMap<String, Object>();
		// 다음페이지
		int nextPage = page.getNextPage();	
		// 이전페이지
		int prevPage =page.getPrevPage();	
		int pageIn = page.getPage();
	
		data.put("list", list); 
		data.put("prevPage", prevPage);
		data.put("nextPage", nextPage);
		data.put("pageIn", pageIn);
		data.put("page", page);		
		
		ObjectMapper mapper = new ObjectMapper();
		try {
			mapper.writeValue(response.getWriter(), data);
		} catch (JsonGenerationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	

	}

	//신고관리 삭제 기능
	@ResponseBody
	@PostMapping("/badcontentDelete")
		public void  badcontentDelete(BadcontentVO vo) {
		//System.out.println("배드 컨텐츠 작동 중");
		AdminService.badcontentDelete(vo);
	}		
}

