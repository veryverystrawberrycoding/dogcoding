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
	private String loss_name;
	//
	private int loss_age;
	//
	private String loss_gender;
	
	private String loss_img;
	
	private String loss_info;
	
	private int limitStart;
	private int listCount;
	
	

}