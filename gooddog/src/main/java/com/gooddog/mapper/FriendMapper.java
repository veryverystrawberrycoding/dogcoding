package com.gooddog.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gooddog.domain.GalleryVO;
import com.gooddog.domain.UserVO;

@Mapper
public interface FriendMapper {
	public List<HashMap<String,Object>> fdRecommend1(UserVO vo);
	public List<HashMap<String,Object>> fdRecommend2(UserVO vo);
	public List<GalleryVO> fdGallery(String user_id); 
}
 