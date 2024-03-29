package com.gooddog.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.List;
import java.util.Map;

import com.gooddog.domain.BadcontentVO;
import com.gooddog.domain.BlackVO;
import com.gooddog.domain.BookVO;
import com.gooddog.domain.GalleryVO;
import com.gooddog.domain.LossVO;
import com.gooddog.domain.PetVO;
import com.gooddog.domain.UserVO;
import com.gooddog.mapper.AdminMapper;

@Service
public class AdminServiceImpl implements AdminService {
	
 
	@Autowired
	AdminMapper AdminMapper;
	
	public List<UserVO> getUserList(UserVO vo) {
		
		List<UserVO> result = null;
		
		return AdminMapper.getUserInfo(vo);
	} 
  
	 
	public List<BlackVO> getBlackList(BlackVO vo) {
		
		List<BlackVO> result = null;
		
		return AdminMapper.getBlackInfo();
	}



@Override
public int totaluser() {
	int result = 0;
	result = AdminMapper.totaluser();
	return result;
}


@Override
public int dayuser() {
	int result = 0;
	result = AdminMapper.dayuser();
	return result;
}


@Override
public int monthuser() {
	int result = 0;
	result = AdminMapper.monthuser();
	return result;
}


@Override
public int yearuser() {
	int result = 0;
	result = AdminMapper.yearuser();
	return result;
}


	@Override
	public int getMenCount() {
		int result = 0;
		result = AdminMapper.getMenCount();
		return result;
	}
   

	@Override 
	public int getWomenCount() {
		int result = 0;
		result = AdminMapper.getWomenCount();
		return result;
	}
	
	
	@Override
	public List<Map<String, String>> getDayCount() {
		
		return AdminMapper.getDayCount();	
	}


	@Override
	public List<Map<String, String>> getweekCount() {
		
		return AdminMapper.getweekCount();	
	}
			
				
				

		@Override
		public int getUserCount(UserVO userVO) throws Exception {
			
			int result = 0;
			result = AdminMapper.userCount();
			
			return result;
		}


		@Override
		public void userList(UserVO userVO) {
			// TODO Auto-generated method stub
			
		}


		@Override
		public int getblackCount(BlackVO blackVO) throws Exception {
			int result = 0;
			result = AdminMapper.blackCount();
			
			return result;
		}
		
	
		@Override
		public void blackList(BlackVO blackVO) {
			// TODO Auto-generated method stub
			
		}


		
//////////////////////////info book 정보 가져오기 /////////////////////	

@Override 
public int bookCount(BookVO bookVO) throws Exception {

int result = 0;
result = AdminMapper.bookCount();

return result;
}


@Override
public List<BookVO> adminpost(BookVO bookVO) {
return AdminMapper.adminpost(bookVO) ;
// TODO Auto-generated method stub

}
//////book 수정/////
//public BookVO bookModify(BookVO vo) {
//	System.out.println("엄, 수정imp");
//	return (BookVO)AdminMapper.bookModify(vo); 
		

//}
///////////////book 삭제 ///////////////
public void bookDelete(BookVO vo) {
	
	AdminMapper.bookDelete(vo);
	
}

//////////////////////////gallery 정보 가져오기 /////////////////////	

@Override 
public int galleryCount(GalleryVO galleryVO) throws Exception {

int result = 0;
result = AdminMapper.galleryCount();

return result;
}
@Override
public List<GalleryVO> adminpost2(GalleryVO galleryVO) {
return AdminMapper.adminpost2(galleryVO) ;
//TODO Auto-generated method stub
}
//////gallery 수정/////
//public void bookModify(BookVO vo) {
//System.out.println("엄");
//AdminMapper.bookModify(vo); 
//}
///////////////book 삭제 ///////////////
public void galleryDelete(GalleryVO vo) {
AdminMapper.galleryDelete(vo);

}
///////////////////////////badcontnet/////////////////////////
@Override
public List<BadcontentVO> badcontent(BadcontentVO badcontentVO) {
	return AdminMapper.badcontent(badcontentVO) ;

}


@Override
public void badcontentDelete(BadcontentVO vo) {
	AdminMapper.badcontentDelete(vo);
	
} 


@Override
public int badcontentCount(BadcontentVO badcontent) {
	
	int result = 0;
	result = AdminMapper.badcontentCount();

	return result;
	}







// 블랙리스트 등록

@Override
public void addBlackList(BlackVO vo) {

	AdminMapper.addBlackList(vo);
}

////블랙 리스트 삭제/////
@Override
public void blacklistDelete(BlackVO vo) {
	AdminMapper.blacklistDelete(vo);

	
}





}




