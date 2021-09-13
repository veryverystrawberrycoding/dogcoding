package com.gooddog.entity;

import javax.persistence.*;
import lombok.*;

@Getter // getter 메소드 생성
@Builder // 빌더를 사용할 수 있게 함
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Entity(name="member") // JPA를 사용할 클래스를 명시하며, 테이블과 매핑하는 역할을 한다.

public class TestEntity {
   @Id //기본키(Primary Key) 명시
   @GeneratedValue(strategy = GenerationType.IDENTITY) //키값의 자동생성 전략을 설정(default: GenerationType.AUTO)
   private int pid;
   
   @Column(nullable = false, unique = true, length = 30)
   private String username;
   
   @Column(nullable = false, length = 100)
   private String name;
   
   public TestEntity(String username, String name){
      this.username = username;
      this.name = name;
   }

   
}