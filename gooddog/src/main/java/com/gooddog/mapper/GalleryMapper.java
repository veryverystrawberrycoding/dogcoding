package com.gooddog.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gooddog.domain.GallaryVO;

@Mapper
public interface GalleryMapper {
	
	public List<GallaryVO> galleryList();

}
