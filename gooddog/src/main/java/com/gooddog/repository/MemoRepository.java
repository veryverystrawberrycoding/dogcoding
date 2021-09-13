package com.gooddog.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.gooddog.entity.MemoEntity;

@Repository
public interface MemoRepository extends JpaRepository<MemoEntity, Long> {
	
}
  