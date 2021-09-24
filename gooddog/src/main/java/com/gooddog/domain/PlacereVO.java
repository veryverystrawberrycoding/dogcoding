package com.gooddog.domain;

import lombok.*;

@Getter
@Setter
public class PlacereVO {
	
	// 리뷰 번호 
	int pre_no;
	// 사용자 아이디 >>삭제
	//String user_id;
	// 장소 번호 
	int place_no;
	// 리뷰 내용 
	String pre_content;
	// 리뷰 평가 
	String pre_value;
	// 리뷰 작성일 
	String pre_date;
	
	// user 테이블 조인 후 컬럼
	// 사용자 별명
	String user_nick;
	// 사용자 프로필 이미지 
	String user_img;


}
