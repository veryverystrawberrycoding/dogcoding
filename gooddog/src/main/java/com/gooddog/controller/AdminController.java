package com.gooddog.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gooddog.domain.BlackVO;
import com.gooddog.domain.UserVO;
import com.gooddog.service.AdminService;

import helper.WebHelper;

@Controller
@Component
@ComponentScan("helper")
public class AdminController {

	@Autowired
	AdminService AdminService;
	
	@Autowired
	WebHelper web;
	
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

	
 		UserVO user = new UserVO();
		BlackVO black = new BlackVO();
		
		List<UserVO> list = null;
		List<BlackVO> list1 = null;
		
		list = AdminService.getUserList(user);
		list1 = AdminService.getBlackList(black);
		
		m.addAttribute("userList", list);
		m.addAttribute("blackList", list1);
		
		return new ModelAndView("/admin/admin_table") ;
		

	}
	@GetMapping("/admin_table/search")
	public String search(@RequestParam(value="keyword") String keyword, Model model) {
        
	    return "/admin/admin_table";
	}
	// 차트 
	@RequestMapping(value="/admin/admin_chart.do",method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView admin_chart(Model m, HttpServletResponse response) {
		//월별방문자
		List<Map<String,String>> list= AdminService.getTotal();
		//일별방문자
		List<Map<String,String>> list2= AdminService.getMonth();
		//성별 
		List<Map<String,String>> list3= AdminService.getDay();
		
		m.addAttribute("list",list);
		m.addAttribute("list2",list2);
		m.addAttribute("list3",list3);
		
		return new ModelAndView("/admin/admin_chart") ;
	}
	
	

	
	


	
	@RequestMapping(value="/admin/admin_black.do",method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView admin_black(Model m, HttpServletResponse response) {

		return new ModelAndView("/admin/admin_black") ;
	}
	
	/////////////////////////관리자 상세정보 페이지/////////
	
	@RequestMapping(value="/admin/admin_post.do",method = {RequestMethod.GET, RequestMethod.POST})
	public String adminpost(Model m) {
		m.addAttribute("list",AdminService.adminpost());
	
		return "/admin/admin_post" ;
	}
	////////////////////////
	
}
