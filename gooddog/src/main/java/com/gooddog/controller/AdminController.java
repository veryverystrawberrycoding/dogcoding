package com.gooddog.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.gooddog.domain.BlackVO;
import com.gooddog.domain.BookVO;
import com.gooddog.domain.GalleryVO;
import com.gooddog.domain.LossVO;
import com.gooddog.domain.PetVO;
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
	
	
	//관리자페이지 회원,블랙리스트 뷰 
	@RequestMapping(value = "/admin/admin_table.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView admin_table(Model m, HttpServletResponse response) {
	 
	//  기능 툴	
	web.init(response);

	
 	
		
		return new ModelAndView("/admin/admin_table") ;
		
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
//		//월별
//		List<Map<String,String>> list= AdminService.getMonthSum();
//		//일별
//		List<Map<String,String>> list2= AdminService.getDaySum();
		//성별
		int womenCount = AdminService.getWomenCount();
  		int menCount = AdminService.getMenCount();
  		
  		HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("menCount",menCount);
        map.put("womenCount",womenCount);
        
        
      
		System.out.println("menCount="+menCount  + "womenCount="+womenCount);
//		m.addAttribute("list",list);
//		m.addAttribute("list2",list2);
	
		
		return new ModelAndView("/admin/admin_chart") ;
	}
	
	

	
	


	
	@RequestMapping(value="/admin/admin_black.do",method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView admin_black(Model m, HttpServletResponse response) {

		return new ModelAndView("/admin/admin_black") ;
	}
	
	/////////////////////////관리자 info 페이지///////////
	
	@RequestMapping(value = "/admin/admin_post.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView admin_post(Model m, HttpServletResponse response) {
	 
	//  기능 툴	
	web.init(response);

	
 	
		
		return new ModelAndView("/admin/admin_post") ;
		
	}
	
/////////////////////////관라자 book 수정/////////////
//	@PostMapping("/bookModify")
//	public void bookModify(BookVO vo) {
//		System.out.println("컨트롤키 작동");
//		AdminService.bookModify(vo);
//	} 
//	@RequestMapping(value = "/bookModify", method ={RequestMethod.GET, RequestMethod.POST})
//	public void bookModify(BookVO vo, Model model) {
//		System.out.println("컨트롤키 작동");
//		model.addAttribute("bookModify",AdminService.bookModify(vo)); // => 모델로 넘겨야함
//	}
	

///////////////////////////////관리자 book delete //////////////////	
	@ResponseBody
	@PostMapping("/bookDelete")
	public void bookDelete(BookVO vo) {
		System.out.println(vo.getDic_no());
		AdminService.bookDelete(vo);
	}
//	@RequestMapping(value = "/admin/admin_post.do", method = RequestMethod.GET)
//	public String delete(@ModelAttribute("BookVO")  @RequestParam("dic_no") int dic_no, RedirectAttributes redirect , Model model) {		
//		try {
			
//			AdminService.bookDelete(dic_no);
//			redirect.addFlashAttribute("msg", "삭제가 완료되었습니다.");
			
//		} catch (Exception e) {
//			redirect.addFlashAttribute("msg", "오류가 발생되었습니다.");
			
//		}
		
//		return "redirect:/admin/admin_post";
//	}
	
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
	@RequestMapping(value = "/admin/admin_post3.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView admin_post3(Model m, HttpServletResponse response) {
	 
	//  기능 툴	
	web.init(response);

	
 	
		
		return new ModelAndView("/admin/admin_post3") ;
		
	}
	
//////////////////00000000000000000000000/admin_post3 삭제/0000000000000000000000000000/////////
	@ResponseBody
	@PostMapping("/lossDelete")
	public void lossDelete(LossVO vo) {
		System.out.println(vo.getLoss_no());
		AdminService.lossDelete(vo);
	}
	/////////////////////////관리자 실종신고  페이징/////////
	
	@ResponseBody
	@RequestMapping(value="/lossList", method=RequestMethod.POST)
	public void lossList(Locale locale, Model model, LossVO LossVO, HttpServletResponse response ){
		
		web.init(response); 
		response.setContentType("application/json");
		
		
		LossVO loss = new LossVO();
		
		int nowPage = web.getInt("page", 1);  		// 현재 페이지 번호를 가져옴, 없으면 1부터 시작
		
		
		int lossCount = 0;							// 전체 사용자 수
		try {
			lossCount = AdminService.lossCount(loss);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
	 
		
		page.pageProcess(nowPage, lossCount, 5, 5);		
		loss.setLimitStart(page.getLimitStart());
		loss.setListCount(page.getListCount());
		
		System.out.println(lossCount+"북카운트가져옴" );
		List<LossVO> list = null;  
		list = AdminService.adminpost3(loss); 	

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
}
