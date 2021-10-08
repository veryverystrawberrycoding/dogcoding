package com.gooddog.service;

import java.util.List;
import java.util.Map;

import com.gooddog.domain.BookVO;
import com.gooddog.domain.BookreVO;
import com.gooddog.domain.GalleryVO;
import com.gooddog.domain.GalreVO;


public interface BookService {
	
	public List<BookVO>bookList(BookVO vo);

	public Map<String, Object> bookNoList(int no);
	
	public void bookInsert(BookVO vo);
	
	public void bookUpdate(BookVO vo);
	
	public void bookHeartUp(BookVO vo);
	
	public void bookHeartDown(BookVO vo);
	
	public void bookDelete(int no);
// 댓글 기능 
	public List<Map<String, Object>> commentList(int bookno);
	
	public List<Map<String, Object>> commentPaging(BookVO vo); //페이징처리된 댓글리스트

	public int commentCount(int bookno);

	public List<BookVO> bookSearch(BookVO vo);
	
	public List<BookVO> bookSelect(String tag);

	public void commentInsert(BookreVO vo);

	public void commentDelete(BookreVO vo);

	public void userlikeInsert(BookVO vo);

	public void userlikeDelete(BookVO vo);

	public int userlikeSelect(BookVO vo);

//	public void badContent(BookVO vo);

	public void bookcntup(int no);

	public int bookcount(); //총 게시글 수

	public int bookSearchcount(BookVO vo);
//////////////////////////////////////////////////////////


		
	}



	// 占쏙옙 占쏙옙占쏙옙
//	void updateBook(BookVO vo);

	// 占쏙옙 占쏙옙占쏙옙
//	void deleteBook(BookVO vo);

	// �긽�뭹 �긽�꽭 議고쉶

//////////////////////////////////////////	
	
	//////////////////////////////////////
	

