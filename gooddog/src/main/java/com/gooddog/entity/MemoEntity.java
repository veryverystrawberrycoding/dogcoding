package com.gooddog.entity;

import javax.persistence.*;
import lombok.*;

@Entity
@Table(name = "tbl_memo")
@ToString
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor

public class MemoEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) //MySQL의 AUTO_INCREMENT를 사용
	private Long id;
	@Column(length = 200, nullable = false)
	private String memoText;
	
	//자동으로 아래 create문 만들어짐
	//create table tbl_memo (
    //id bigint not null auto_increment,
    //memo_text varchar(200) not null,
    //primary key (id)
    //)
}