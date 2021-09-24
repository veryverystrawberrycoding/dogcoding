package com.gooddog.controller;


import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.gooddog.domain.BookVO;
import com.gooddog.service.BookService;


@Controller
public class BookController {
	
	@Autowired
	private BookService bookService;
	
	@RequestMapping(value="/bookList",method=RequestMethod.GET)
	public String bookList(Model m) {
		m.addAttribute("list",bookService.bookList());
		
		return "/bookList";
	
	}

///////////////////////////////////////////	
 //상세보기
	
	@RequestMapping(value="/bookView",method=RequestMethod.GET)
	public String bookView(Model model,int no) {
		BookVO data =bookService.bookView(no);
		model.addAttribute("data", data);
		
		return "/bookView";
		
	}
	
	}
	///////////////////////////////////////

