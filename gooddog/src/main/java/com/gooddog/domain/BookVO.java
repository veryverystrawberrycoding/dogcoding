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

	//백과사전 번호
	private int dic_no;
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
	
	private String dic_tag;

	private String dic_date;
//회원 아이디 
	private String user_id;
	
	// user 테이블 조인 후 컬럼
	// 사용자 별명
	private String user_nick;
	// 사용자 프로필 이미지 
	private String user_img;
	
	
	private int limitStart;
	private int listCount;
/////////////////////////////
	
	private int pnum; //페이지관련
	private String searchTag; //검색할 때 태그관련


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


