package com.gooddog.domain;

import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

//백과사전 vo
@Data
public class BookVO {

//	private int dic_no;
//	public int getdic_no() {
//		return dic_no;
//	}
//	public void setdic_no(int dic_no) {
//		this.dic_no = dic_no;
//	}	
////////////////////////////	
	
	//백과사전 번호
	private String dic_no;
	//백과사전 이름
	private String dic_name;
	//백과사전 사진
	private String dic_img;
	//백과사전 내용
	private String dic_content;
	//백과사전 조회수
	private int dic_cnt;
	//백과사전 좋아요
	private int dic_heart;
	
	
	private int limitStart;
	private int listCount;
/////////////////////////////
	
	


}

///////////////////////////////////
//MultipartFile file;

//public MultipartFile getFile() {
 //  return file;
//}
//public void setFile( MultipartFile file) {
 //  this.file = file;

///if(!file.isEmpty()) {
 //  this.dic_img = file.getOriginalFilename();

//	   System.out.println("setFile >>>>>>>>>" + this.dic_img);
   
//File f = new File("C:\\springwork\\vanagloriarse\\src\\main\\webapp\\resources\\img"+this.dic_img);


   
//   try { 
 //     file.transferTo(f);
 //  }catch(IllegalStateException e) {
  //    e.printStackTrace();
//   }catch(IOException e) {
      
//      e.printStackTrace();
//   }
//}
//}
//}


