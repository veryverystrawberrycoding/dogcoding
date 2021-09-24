package com.gooddog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gooddog.domain.BookVO;

import com.gooddog.mapper.BookMapper;


@Service 
public class BookServiceImpl implements BookService {
	
	@Autowired
	private BookMapper bookMapper;
	
	
	public List<BookVO>bookList(){
		
		return  bookMapper.bookList();
		
	}	
	@Override 
	public BookVO bookView(int no) {
		return bookMapper.bookView(no);
	}
//////////////////////////////////////////	
//	public void insertBook(BookVO vo) {
//		bookMapper.insertBook(vo);
//	}

//	public void updateBook(BookVO vo) {
//		bookMapper.updateBook(vo);
//	}

//	public void deleteBook(BookVO vo) {
//		bookMapper.deleteBook(vo);
//	}
//	
	

///////////////////////////////////////////		
//상세보기



	

}
