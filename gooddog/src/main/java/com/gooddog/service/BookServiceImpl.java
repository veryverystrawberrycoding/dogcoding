package com.gooddog.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gooddog.domain.BookVO;
import com.gooddog.domain.BookreVO;
import com.gooddog.domain.BookVO;
import com.gooddog.domain.GalreVO;
import com.gooddog.mapper.BookMapper;
import com.gooddog.mapper.GalleryMapper;


@Service 
public class BookServiceImpl implements BookService {
	
	
	@Autowired
	private BookMapper bookMapper;
	
	
	public List<BookVO> bookList(BookVO vo){
		
		return bookMapper.bookList(vo);
		
	}


	public Map<String, Object> bookNoList(int no) {
		return bookMapper.bookNoList(no);
	}



	public void bookInsert(BookVO vo) {
		bookMapper.bookInsert(vo);
		
	}


	@Override
	public void bookUpdate(BookVO vo) {
		bookMapper.bookUpdate(vo);
		
	}


	@Override
	public void bookHeartUp(BookVO vo) {
		bookMapper.bookHeartUp(vo);
	}


	@Override
	public void bookHeartDown(BookVO vo) {
		bookMapper.bookHeartDown(vo);
	}


	@Override
	public void bookDelete(int no) {
		bookMapper.bookDelete(no);
		
	}


	@Override
	public List<Map<String, Object>> commentList(int dic_no) {
		return bookMapper.commentList(dic_no);
	}
	
	@Override
	public List<Map<String, Object>> commentPaging(BookVO vo) {
		return bookMapper.commentPaging(vo);
	}


	@Override
	public int commentCount(int dic_no) {
		return bookMapper.commentCount(dic_no);
	}


	@Override
	public List<BookVO> bookSearch(BookVO vo) {
		return bookMapper.bookSearch(vo);
		
	}
	
	@Override
	public List<BookVO> bookSelect(String tag) {
		return bookMapper.bookSelect(tag);
		
	}


	@Override
	public void commentInsert(BookreVO vo) {
		bookMapper.commentInsert(vo);
		
	}


	@Override
	public void commentDelete(BookreVO vo) {
		bookMapper.commentDelete(vo);
	
	}


	@Override
	public void userlikeInsert(BookVO vo) {
		bookMapper.userlikeInsert(vo);
		
	}


	@Override
	public void userlikeDelete(BookVO vo) {
		bookMapper.userlikeDelete(vo);
		
	}


	@Override
	public int userlikeSelect(BookVO vo) {
		return bookMapper.userlikeSelect(vo);
	}


//	@Override
//	public void badContent(BookVO vo) {
//		bookleryMapper.badContent(vo);
		
//	}


	@Override
	public void bookcntup(int no) {
		bookMapper.bookcntup(no);
		
	}

	//총 게시글 수
	@Override
	public int bookcount() {
		return bookMapper.bookcount();
	}


	@Override
	public int bookSearchcount(BookVO vo) {
		return bookMapper.bookSearchcount(vo);
	}	

	@Override
	public List<BookVO> boSearch(String data) {
		return bookMapper.boSearch(data);
	}
	
	@Override
	public List<BookVO> bookFilter(String data) {
		return bookMapper.bookFilter(data);
	}
	
	@Override
	public List<BookVO> boList(){
		return bookMapper.boList();
		
	}


///////////////////////////////////////////		
//상세보기


/////////////////////////////////////////

}
//////////////////////등록////////////////////	
	


