package com.gooddog.domain;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

//실종신고
@Data
public class LossVO {

	//
private int loss_no;
public int getdic_no() {
	return loss_no;
}
public void setdic_no(int loss_no) {
	this.loss_no = loss_no;
}	
	//private int loss_no;
	//
	private String user_id;
	private int pet_no;
	private String pet_name;
	//
	private int pet_age;
	//
	private String pet_gender;
	
	private String loss_img;
	
	private String loss_info;
	
	private int page;
	
	
public LossVO() {
		
		this.page = 1;
	
}
}
