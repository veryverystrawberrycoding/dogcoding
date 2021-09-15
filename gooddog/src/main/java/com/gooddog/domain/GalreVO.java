package com.gooddog.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class GalreVO {
	//갤러리댓글 번호
	private int galre_no;
	//갤러리댓글 부모 계층
	private int galre_parent;
	//갤러리대댓글 깊이 
	private int galre_depth;
	//갤러리대댓글 순서
	private int galre_order;
	//갤러리 댓글 내용
	private String galre_content;
	//갤러리 댓글 날짜
	private String galre_date;
	
	//게시글 번호
	private int gal_no;
	//회원 아이디
	private String user_id;
}
