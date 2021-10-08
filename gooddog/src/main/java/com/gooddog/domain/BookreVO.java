package com.gooddog.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BookreVO {
	//갤러리댓글 번호
	private int bookre_no;
	//갤러리댓글 부모 계층
	private int bookre_parent;
	//갤러리대댓글 깊이 
	private int bookre_depth;
	//갤러리대댓글 순서
	private int bookre_order;
	//갤러리 댓글 내용
	private String bookre_content;
	//갤러리 댓글 날짜
	private String bookre_date;
	
	//게시글 번호
	private int dic_no;
	//회원 아이디
	private String user_id;
}
