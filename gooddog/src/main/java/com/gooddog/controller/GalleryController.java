package com.gooddog.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.gooddog.domain.GalleryVO;
import com.gooddog.domain.PlacereVO;
import com.gooddog.service.GalleryService;

@Controller
public class GalleryController {
	
	@Autowired
	private GalleryService galleryService;
	
	@RequestMapping(value="/galleryList")//,method=RequestMethod.GET
	public void galleryList(Model m) {
		m.addAttribute("list",galleryService.galleryList());
		
	}
	
	@RequestMapping(value="/galleryView")
	public void galleryView(Model m, GalleryVO vo) {
		int no = vo.getGal_no(); 
		Map<String, Object> result = galleryService.galNoList(no);
		m.addAttribute("item",result);
		//System.out.println(vo.getGal_content());
		
		// 리뷰 조회 
		List<Map<String, Object>> reviewList=galleryService.reviewList(vo);
		m.addAttribute("reviewList",reviewList);
			
		// 리뷰 개수 조회 
		int count = galleryService.reviewCount(vo);
				
		m.addAttribute("count", count);
		
	}
	
	@RequestMapping(value="/galleryForm")
	public void galleryForm(Model m, GalleryVO vo) {
		
		int no = vo.getGal_no();
		System.out.println(no);
		if(no != 0) {
			m.addAttribute("item",galleryService.galNoList(no));
		}
	
		
	}

	
	@RequestMapping(value="/galleryOK")
	public String galInsert(Model m, GalleryVO vo) {
		// gal_name, gal_content 같은 내용 들어가게 하자.
		// gal_tag는 '','','' 형식으로 저장
		int no = vo.getGal_no();
		System.out.println(no);
		if(no != 0) {
			//게시글번호 있으면 update
			galleryService.galUpdate(vo);
			return "redirect:/galleryView?gal_no="+no;
		}
		else {
			//게시글번호 없으면 insert
			System.out.println(vo.getGal_img());
			galleryService.galInsert(vo);
			return "redirect:/galleryList";
		}
		
	}
	
	@RequestMapping(value="/galHeartUp")
	public void galHeartUp(Model m, GalleryVO vo) {
		galleryService.galHeartUp(vo);
	}
	
	@RequestMapping(value="/galHeartDown")
	public void galHeartDown(Model m, GalleryVO vo) {
		galleryService.galHeartDown(vo);
	}
	
	@RequestMapping(value="/galDelete")
	public String galDelete(Model m, GalleryVO vo) {
		galleryService.galDelete(vo.getGal_no());
		System.out.println("삭제완료");
		return "redirect:/galleryList";
	}
	
	@RequestMapping(value="/galimg",method = RequestMethod.POST)
	@ResponseBody
	public void mypageFaceimg(@RequestParam("file") MultipartFile file) throws Exception {
		String basePath = "C:\\git\\dogcoding\\gooddog\\src\\main\\webapp\\resources\\images\\gallery";
		String filePath = basePath + "/" + file.getOriginalFilename();
		File dest = new File(filePath); file.transferTo(dest);
	}
	
	
	
//	@ResponseBody
//	@PutMapping("/gallery/{gal_no}")
//	public String modify(GallaryVO vo,@RequestBody int gal_no,@RequestBody String gal_name,@RequestBody String gal_img ) {
//		vo.setGal_no(gal_no);
//		vo.setGal_name(gal_name);
//		vo.setGal_img(gal_img);
		
//		galleryService.galUpdate(vo);

//		return "ok"; //update는 return이 없어,,,
//	}
	
//	@ResponseBody
//	@PutMapping("/gallery/up/{gal_no}")
//	public void heartup (GallaryVO vo,@RequestBody int gal_no) {
//		vo.setGal_no(gal_no);
//		galleryService.galHeartUp(vo);

//	}
	
//	@ResponseBody
//	@PutMapping("/gallery/down/{gal_no}")
//	public void heartdown(GallaryVO vo,@RequestBody int gal_no) {
//		vo.setGal_no(gal_no);
//		galleryService.galHeartDown(vo);

//	}
	
	
	
	

}
