package com.gooddog.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gooddog.domain.BookVO;
import com.gooddog.domain.BookreVO;
import com.gooddog.domain.GalleryVO;
import com.gooddog.domain.GalreVO;


@Mapper
public interface BookMapper {
	
	public List<BookVO> bookList(BookVO vo);

	public Map<String, Object> bookNoList(int no);
	
	public void bookInsert(BookVO vo);
	
	public void bookUpdate(BookVO vo);
	
	public void bookHeartUp(BookVO vo);
	
	public void bookHeartDown(BookVO vo);
	
	public void bookDelete(int no);

	public List<Map<String, Object>> commentList(int dic_no);
	
	public List<Map<String, Object>> commentPaging(BookVO vo);

	public int commentCount(int dic_no);

	public List<BookVO> bookSearch(BookVO vo);

	public void commentInsert(BookreVO vo);

	public void commentDelete(BookreVO vo);

	public void userlikeInsert(BookVO vo);

	public void userlikeDelete(BookVO vo);

	public int userlikeSelect(BookVO vo);


	public void bookcntup(int no);

	public List<BookVO> bookSelect(String tag);

	public int bookcount(); //총게시글 수

	public int bookSearchcount(BookVO vo);
/////////////////////////////////////////////////////
	public List<BookVO> boSearch(String data);
	public List<BookVO> bookFilter(String data);
	public List<BookVO> boList();
	

}

