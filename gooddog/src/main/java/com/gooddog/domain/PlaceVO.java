package com.gooddog.domain;

import lombok.*;

@Getter
@Setter
public class PlaceVO {
	//장소 번호 
	int place_no;
	//장소 이름 
	String place_name;
	//장소 종류
	int place_group;
	//장소 사진
	String place_img; 
	//장소 주소 
	String place_addr;
	//장소 위도
	String place_x;
	//장소 경도
	String place_y;
	//장소 정보
	String place_content;
	//장소 조회수 
	int place_cnt;
	//장소 전화번호 
	String place_tel;
	
	String place_tag;


}
