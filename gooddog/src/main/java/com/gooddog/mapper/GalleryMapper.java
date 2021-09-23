package com.gooddog.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gooddog.domain.GallaryVO;

@Mapper
public interface GalleryMapper {
	
	// 갤러리 목록 조회
	public List<GallaryVO> galleryList();
	

}
