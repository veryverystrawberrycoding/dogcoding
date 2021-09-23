package com.gooddog.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gooddog.domain.GallaryVO;
import com.gooddog.service.GalleryService;

@Controller
public class GalleryController {
	
	@Autowired
	private GalleryService galleryService;
	
	@RequestMapping(value="/galleryList",method=RequestMethod.GET)
	public String galleryList(Model m) {
		m.addAttribute("list",galleryService.galleryList());
		
		return "/galleryList";
	}
	


}
