package com.gooddog.domain;

import javax.persistence.Id;

import lombok.Data;


@Data
public class UserVO { 
	@Id
	//유저 아이디
	private String user_id;
	//유저 이름
	private String user_name; 
	//유저 닉네임
	private String user_nick; 
	//유저 비밀번호
	private String user_pwd;
	//유저 생일
	private String user_birth;
	//유저 성별
	private String user_gender;
	//유저 주소
	private String user_addr; 
	//유저 번호
	private String user_tel;
	//유저 가입일
	private String user_date;
	//좋아요 누른 게시판
	private String user_heart;
	//유저 프사
	private String user_img; 
	//유저 권한
	private String user_author;
	
	  
	
	 
}
