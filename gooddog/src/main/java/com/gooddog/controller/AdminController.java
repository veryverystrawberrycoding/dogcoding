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
	
	
	//관리자페이지 회원 뷰 
	@RequestMapping(value = "/admin/admin_table.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView admin_table(Model m, HttpServletResponse response) {
	 
	//  기능 툴	
	web.init(response);

	
 	
		
		return new ModelAndView("/admin/admin_table") ;
		
	}
	
	//관리자페이지 블랙리스트 뷰 
	@RequestMapping(value = "/admin/admin_blacklist.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView admin_blacklist(Model m, HttpServletResponse response) {
	 
	//  기능 툴	
	web.init(response);

	
 	
		
		return new ModelAndView("/admin/admin_blacklist") ;
		
	}
	
	//관리자페이지 블랙티스트 추가 페이지 
		@RequestMapping(value = "/admin/addblack.do", method = {RequestMethod.GET, RequestMethod.POST})
		public ModelAndView addblack(Model m, HttpServletResponse response) {
		  
		//  기능 툴	
		web.init(response);


			return new ModelAndView("/admin/addblack") ;
			
		}
		
		// 블랙리스트 추가
		@ResponseBody
		@RequestMapping(value = "/admin/blackadd.do" , method= { RequestMethod.POST})
		public String BlackListAdd(BlackVO vo,Model m,String term) {
	
			String[] arr = term.split(" ");
			int termday = Integer.parseInt(arr[0]);
			
			Calendar cal = Calendar.getInstance();
			cal.setTime(new Date());
			DateFormat ddddd = new SimpleDateFormat("yyyy-MM-dd");
			
//			System.out.println("날짜적용전");
//			System.out.println(ddddd.format(cal.getTime()));
//			System.out.println("id값="+vo.getUser_id());
//			System.out.println("사유="+vo.getBlack_content());
			
			vo.setBlack_start(ddddd.format(cal.getTime()));
			cal.add(Calendar.DATE, +termday);
			vo.setBlack_end(ddddd.format(cal.getTime()));
			
			// vo 데이터 확인 user_id,black_start,black_end,black_content
			System.out.println("ID="+vo.getUser_id()+"///////START="+vo.getBlack_start()+"/////////END="+vo.getBlack_end()+"///////CONTENT="+vo.getBlack_content());
			
			AdminService.addBlackList(vo);
			
//			System.out.println("날짜적용");
//			System.out.println(ddddd.format(cal.getTime()));
			
			// 아이디, 시작기간, 끝기간, 사유
			// 시작기간 now()
		    
						
			return "ok";
		}
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
		
		int nowPage = web.getInt("page", 1);  		// 현재 페이지 번호를 가져옴, 없으면 1부터 시작
		
		
		int userCount = 0;							// 전체 사용자 수
		try {
			userCount = AdminService.getUserCount(user);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace(); 
		}
	
		
		page.pageProcess(nowPage, userCount, 5, 5);		
		user.setLimitStart(page.getLimitStart());
		user.setListCount(page.getListCount());
		
		List<UserVO> list = null;
		list = AdminService.getUserList(user);		
			
		Map<String, Object> data = new HashMap<String, Object>();
		
		int nextPage = page.getNextPage();	// 다음페이지
		int prevPage =page.getPrevPage();	// 이전페이지
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

	/**
	 * 회원 목록
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
		
		int nowPage = web.getInt("page", 1);  		// 현재 페이지 번호를 가져옴, 없으면 1부터 시작
		
		
		int blackCount = 0;							// 전체 사용자 수
		try {
			blackCount = AdminService.getblackCount(black);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
		page.pageProcess(nowPage, blackCount, 5, 5);		
		black.setLimitStart(page.getLimitStart());
		black.setListCount(page.getListCount());
		
		List<BlackVO> list = null;
		list = AdminService.getBlackList(black);	
		System.out.println(nowPage);
		System.out.println(page.getListCount());
		System.out.println(blackCount);
		System.out.println(page.getLimitStart());
	    System.out.println(list);
	
		Map<String, Object> data = new HashMap<String, Object>();
		
		int nextPage = page.getNextPage();	// 다음페이지
		int prevPage =page.getPrevPage();	// 이전페이지
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
	
	@GetMapping("/admin_table/search")
	public String search(@RequestParam(value="keyword") String keyword, Model model) {
        
	    return "/admin/admin_table";
	}
	// 차트 
	@RequestMapping(value="/admin/admin_chart.do",method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView admin_chart(Model m, HttpServletResponse response) {
		//일별 
		List<Map<String,String>> dayCount= AdminService.getDayCount();
		//주별
		List<Map<String,String>> weekCount= AdminService.getweekCount();
		//성별
		int womenCount = AdminService.getWomenCount();
  		int menCount = AdminService.getMenCount();
  
		// 전체 가입자수
  		int totaluser = AdminService.totaluser();
		// 전체 가입자수
  		int dayuser = AdminService.dayuser();
		// 전체 가입자수
  		int monthuser = AdminService.monthuser();
		// 전체 가입자수
  		int yearuser = AdminService.yearuser();
  		 m.addAttribute("totaluser",totaluser);
  		 m.addAttribute("dayuser",dayuser);
  		 m.addAttribute("monthuser",monthuser);
  		 m.addAttribute("yearuser",yearuser);
  		 m.addAttribute("dayCount",dayCount);
         m.addAttribute("weekCount",weekCount);
  		 m.addAttribute("menCount",menCount);
         m.addAttribute("womenCount",womenCount); 
         System.out.println(totaluser);
         System.out.println(dayuser);
         System.out.println(monthuser);
         System.out.println(yearuser); 
         //\\String dayCount1 = new ObjectMapper().writeValueAsString(dayCount);
         
//         System.out.println(dayCount);
//         System.out.println(dayCount.get(0));
//         System.out.println(dayCount.get(1));
//         System.out.println("#############getValue##############");
//         System.out.println(dayCount.get(0).values());
//         System.out.println(dayCount.get(0).values().toArray()[0]);
// 
         
//        System.out.println(dayCount);
//         String weekCount1 = new ObjectMapper().writeValueAsString(weekCount);
//         System.out.println(weekCount1);
      
		return new ModelAndView("/admin/admin_chart") ;
	}
	


	
	

/////////관리자 black 페이지//////
	
	@RequestMapping(value="/admin/admin_black.do",method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView admin_black(Model m, HttpServletResponse response) {

		 
		//  기능 툴	
		web.init(response);
		return new ModelAndView("/admin/admin_black") ;
	}
///////////////////////////////관리자 book delete //////////////////	
		@ResponseBody
		@PostMapping("/badcontentDelete")
		public void  badcontentDelete(BadcontentVO vo) {
			System.out.println("배드 컨텐츠 작동 중");
			AdminService.badcontentDelete(vo);
		}		
		
		
	
///////////////관리자 black 페이징////////////
	@ResponseBody
	@RequestMapping(value="/badcontentList", method=RequestMethod.POST)
	public void badcontentList(Locale locale, Model model, BadcontentVO BadcontentVO, HttpServletResponse response ){
		
		web.init(response); 
		response.setContentType("application/json");
		
		
		BadcontentVO badcontent = new BadcontentVO();
		
		int nowPage = web.getInt("page", 1);  		// 현재 페이지 번호를 가져옴, 없으면 1부터 시작
		
		
		int badcontentCount = 0;							// 전체 사용자 수
		try {
			badcontentCount = AdminService.badcontentCount(badcontent);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
	 
		
		page.pageProcess(nowPage, badcontentCount, 5, 5);		
		badcontent.setLimitStart(page.getLimitStart());
		badcontent.setListCount(page.getListCount());
		
		System.out.println(badcontent+"북카운트가져옴" );
		List<BadcontentVO> list = null;  
		list = AdminService.badcontent(badcontent); 	

		System.out.println(list+"list가져옴" );
		Map<String, Object> data = new HashMap<String, Object>();
		
		int nextPage = page.getNextPage();	// 다음페이지
		int prevPage =page.getPrevPage();	// 이전페이지
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
	
	////////////////////////////////////////////////////////////
	/////////////////////////관리자 info 페이지/////////////////////
	////////////////////////////////////////////////////////////
	@RequestMapping(value = "/admin/admin_post.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView admin_post(Model m, HttpServletResponse response) {
	 
	//  기능 툴	
	web.init(response);

	
 	
		
		return new ModelAndView("/admin/admin_post") ;
		
	}

///////////////////////////////관리자 book delete //////////////////	
	@ResponseBody
	@PostMapping("/bookDelete")
	public void bookDelete(BookVO vo) {
		System.out.println(vo.getDic_no());
		AdminService.bookDelete(vo);
	}

	
///////////////////////admin_post 페이징////////////////////////////////
	@ResponseBody
	@RequestMapping(value="/bookList", method=RequestMethod.POST)
	public void bookList(Locale locale, Model model, BookVO BookVO, HttpServletResponse response ){
		
		web.init(response); 
		response.setContentType("application/json");
		
		
 		BookVO book = new BookVO();
		
		int nowPage = web.getInt("page", 1);  		// 현재 페이지 번호를 가져옴, 없으면 1부터 시작
		
		
		int bookCount = 0;							// 전체 사용자 수
		try {
			bookCount = AdminService.bookCount(book);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
	 
		
		page.pageProcess(nowPage, bookCount, 5, 5);		
		book.setLimitStart(page.getLimitStart());
		book.setListCount(page.getListCount());
		
		System.out.println(bookCount+"북카운트가져옴" );
		List<BookVO> list = null;  
		list = AdminService.adminpost(book); 	

		System.out.println(list+"list가져옴" );
		Map<String, Object> data = new HashMap<String, Object>();
		
		int nextPage = page.getNextPage();	// 다음페이지
		int prevPage =page.getPrevPage();	// 이전페이지
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
//00000000000000000000000000000000000000000admin_post20000000000000000000000000000000
	
	@RequestMapping(value = "/admin/admin_post2.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView admin_post2(Model m, HttpServletResponse response) {
	 
	//  기능 툴	
	web.init(response);

	
 	
		
		return new ModelAndView("/admin/admin_post2") ;
		
	}
	
//////////////////00000000000000000000000/admin_post2 삭제/0000000000000000000000000000/////////
	@ResponseBody
	@PostMapping("/galleryDelete")
	public void galleryDelete(GalleryVO vo) {
		System.out.println(vo.getGal_no());
		AdminService.galleryDelete(vo);
	}
	/////////////////////////관리자 갤러리  페이징/////////
	
	@ResponseBody
	@RequestMapping(value="/galleryList", method=RequestMethod.POST)
	public void galleryList(Locale locale, Model model, GalleryVO GalleryVO, HttpServletResponse response ){
		
		web.init(response); 
		response.setContentType("application/json");
		
		
		GalleryVO gallery = new GalleryVO();
		
		int nowPage = web.getInt("page", 1);  		// 현재 페이지 번호를 가져옴, 없으면 1부터 시작
		
		
		int galleryCount = 0;							// 전체 사용자 수
		try {
			galleryCount = AdminService.galleryCount(gallery);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
	 
		
		page.pageProcess(nowPage, galleryCount, 5, 5);		
		gallery.setLimitStart(page.getLimitStart());
		gallery.setListCount(page.getListCount());
		
		System.out.println(galleryCount+"북카운트가져옴" );
		List<GalleryVO> list = null;  
		list = AdminService.adminpost2(gallery); 	

		System.out.println(list+"list가져옴" );
		Map<String, Object> data = new HashMap<String, Object>();
		
		int nextPage = page.getNextPage();	// 다음페이지
		int prevPage =page.getPrevPage();	// 이전페이지
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
	//0000000000000000000000000000000000000000admin_post300000000000000000000000000000000000
//	@RequestMapping(value = "/admin/admin_post3.do", method = {RequestMethod.GET, RequestMethod.POST})
//	public ModelAndView admin_post3(Model m, HttpServletResponse response) {
	 
	//  기능 툴	
//	web.init(response);

	
 	
		
//		return new ModelAndView("/admin/admin_post3") ;
		
//	}
	
//////////////////00000000000000000000000/admin_post3 삭제/0000000000000000000000000000/////////
//	@ResponseBody
//	@PostMapping("/lossDelete")
//	public void lossDelete(LossVO vo) {
//		System.out.println(vo.getLoss_no());
//		AdminService.lossDelete(vo);
//	}
	/////////////////////////관리자 실종신고  페이징/////////
	

	

//			System.out.println(list+"list가져옴" );
//			Map<String, Object> data = new HashMap<String, Object>();
		
//			int nextPage = page.getNextPage();	// 다음페이지
//			int prevPage =page.getPrevPage();	// 이전페이지
//			int pageIn = page.getPage();
	
//			data.put("list", list); 
//			data.put("prevPage", prevPage);
//			data.put("nextPage", nextPage);
//			data.put("pageIn", pageIn);
//			data.put("page", page);		
		
		
//			ObjectMapper mapper = new ObjectMapper();
//			try {
//				mapper.writeValue(response.getWriter(), data);
//			} catch (JsonGenerationException e) {
			// TODO Auto-generated catch block
//				e.printStackTrace();
//			} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
//				e.printStackTrace();
//			} catch (IOException e) {
			// TODO Auto-generated catch block
//				e.printStackTrace();
//			}	
	 
} 
