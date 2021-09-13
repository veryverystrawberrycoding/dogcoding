package com.gooddog.service;

import java.util.Optional;

import javax.persistence.EntityNotFoundException;

import org.springframework.stereotype.Service;

import com.gooddog.entity.TestEntity;
import com.gooddog.repository.TestRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class JoinService {
	private final TestRepository testRepository;
	
	
	public TestEntity testJoin(int pid) {
		Optional<TestEntity> test = testRepository.findById(pid);
		if(test.isPresent()) {
			return test.get();  
		} 
		 
		throw new EntityNotFoundException(
				"Cant find any test under given ID"
				);
		
	} 
}
