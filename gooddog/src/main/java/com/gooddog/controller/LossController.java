package com.gooddog.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gooddog.domain.BookVO;
import com.gooddog.domain.LossVO;
import com.gooddog.service.BookService;
import com.gooddog.service.LossService;


@Controller
public class LossController {
	
	@Autowired
	private LossService lossService;
	
	@RequestMapping(value="/lossList",method=RequestMethod.GET)
	public String lossList(Model m) {
		m.addAttribute("list",lossService.lossList());
		
		return "/lossList";
	
	}

///////////////////////////////////////////	
	@RequestMapping(value="/lossView",method=RequestMethod.GET)
	public String lossView(Model model,int no) {
		LossVO data =lossService.lossView(no);
		model.addAttribute("data", data);
		
		return "/lossView";
		
	}
	///////////////////////////////////////
}
