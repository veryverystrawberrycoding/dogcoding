package com.gooddog.domain;

import lombok.*;

@Getter
@Setter
// 펫 몸무게
public class WeightVO {

	// 펫 몸무게 번호
	private int weight_no;
	// 펫 몸무게
	private int weight_content;
	// 몸무게 측정일시
	private String weight_date;
	// 펫 번호
	private int pet_no;
	
}
