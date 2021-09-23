package com.gooddog.domain;

import lombok.*;

@Getter
@Setter
//펫 VO
public class PetVO {

	// 펫 번호
	private int pet_no;
	// 펫 이름 
	private String pet_name;
	// 펫 사진
	private String pet_img;
	// 펫 성별
	private int pet_gender;
	// 펫 견종
	private String pet_spacies;
	// 펫 생일
	private String pet_birth;
	// 펫 인식번호
	private String pet_ident;
	// 회원 아이디 
	private String user_id;
	

	
		
}
