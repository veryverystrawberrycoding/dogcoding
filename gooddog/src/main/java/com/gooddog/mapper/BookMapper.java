package com.gooddog.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gooddog.domain.BookVO;


@Mapper
public interface BookMapper {
	
	public List<BookVO> bookList();
	
/////////////////////////////////////	
	public BookVO bookView(int no);
	//////////////////////////
//	public void insertBook(BookVO vo);
	
//	public void updateBook(BookVO vo) ;

//	public void deleteBook(BookVO vo);


	
}
