package com.gooddog.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class GallaryVO {
	//갤러리 게시글 번호
	private int gal_no;
	//갤러리 게시글 이름
	private String gal_name;
	//갤러리 게시글 이미지
	private String gal_img;
	//갤러리 게시글 내용
	private String gal_content;
	//갤러리 게시글 태그
	private String gal_tag;
	//갤러리 게시 날짜
	private String gal_date;
	//갤러리 좋아요 수
	private int gal_heart;
	//갤러리 조회 수
	private int gal_cnt;
	
	
	//회원 아이디
	private String user_id;
}
