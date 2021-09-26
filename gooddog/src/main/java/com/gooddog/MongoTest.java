package com.gooddog;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.gooddog.domain.FriendsVO;
import com.gooddog.repository.FriendRepository;

@SpringBootApplication
public class MongoTest implements CommandLineRunner {
	
	@Autowired
	private FriendRepository friendRepository;

	public static void main(String[] args) {
		SpringApplication.run(MongoTest.class, args);
	} 

	@Override
	public void run(String... args) throws Exception {
		FriendsVO vo1 = new FriendsVO("Kim", "Lee", true);
		FriendsVO vo2 = new FriendsVO("Kim", "choi", false);
		
		friendRepository.insert(Arrays.asList(vo1, vo2)); 
	}
 
} 
