package com.gooddog.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.gooddog.domain.ChatLog;
import com.gooddog.domain.FrList;
import com.gooddog.domain.FrListt;
import com.gooddog.domain.FriendsVO;
import com.gooddog.domain.FriendssVO;
import com.gooddog.domain.UserVO;
import com.gooddog.repository.FriendRepository;
import com.gooddog.repository.FrienddRepository;
import com.gooddog.service.FriendService;

@RestController
public class FriendController {
	
	@Autowired
	private FriendRepository friendRepository;
	
	@Autowired
	private FrienddRepository frienddRepository;
	
	@Autowired
	
	private FriendService friendService;
	
	@Autowired
    MongoTemplate mongoTemplate;
	
	//랜덤 친구추천
	@PostMapping("fdRecommend1")
	public List<HashMap<String,Object>> fdRecommend1(UserVO vo, HttpServletRequest req){
		 HttpSession session = req.getSession();
		 UserVO sessionvo = (UserVO)session.getAttribute("user");
	     vo.setUser_id(sessionvo.getUser_id());
	      
	     List<HashMap<String,Object>> join = new ArrayList<>();
	     join.addAll(friendService.fdRecommend1(vo));
	     join.addAll(friendService.fdRecommend2(vo));
	     int i = 0;
	     int k = 0;
	     
	     for(i=0; i<join.size(); i++) {
	    	 if(join.get(i).get("user_id").equals(vo.getUser_id())) {
	    		 join.remove(i);
	    		 i--;
	    	 } else {
	    	 
	    	 
	    	 for(k=0; k<i; k++) {
	    		 if(join.get(i).get("user_id").equals(join.get(k).get("user_id"))) {
	    			 join.remove(i);
	    			 i--;
	    		 }
	    	 } 
	    	 
	    	 }
	     }
	     return join;
		 
	} 
	//팔로잉, 팔로워
	@PostMapping("fdAdd")
	public void fdAdd(UserVO vo, HttpServletRequest req) throws JsonProcessingException {
		HttpSession session = req.getSession();
		UserVO sessionvo = (UserVO)session.getAttribute("user");
		 
		ObjectMapper mapper = new ObjectMapper();
		System.out.println(vo.getUser_name());
		System.out.println(friendRepository.findByFollowingId(sessionvo.getUser_id()));
		FrList fd2 = new FrList(vo.getUser_id(), vo.getUser_name(), vo.getUser_nick(), vo.getUser_img());
		  //처음만들었을떄 리스트화
		ArrayList<FrList> list = new ArrayList<>();
	    list.add(fd2); 
	    
	    FrListt fdd2 = new FrListt(sessionvo.getUser_id(), sessionvo.getUser_name(), sessionvo.getUser_nick(), sessionvo.getUser_img());
	    ArrayList<FrListt> list2 = new ArrayList<>();
	    list2.add(fdd2);
	    
		if(friendRepository.findByFollowingId(sessionvo.getUser_id())==null) {
			
		     
		    //String jsonString = mapper.writeValueAsString(fd2); 
		     
		FriendsVO fd = new FriendsVO(sessionvo.getUser_id(), list);  
	    System.out.println(fd);
		friendRepository.insert(fd);   
		}  else {
		Update update = new Update();
		//frlist에 각각의 정보 저장 
	    //리스트 객체 생성  
	    System.out.println(fd2); 
	    update.push("frList").each(list);
	    Query query = new Query().addCriteria(Criteria.where( "followingId" ).is(sessionvo.getUser_id()));
	    mongoTemplate.updateFirst(query, update, "following");
	     
	    if(frienddRepository.findByFollowerId(vo.getUser_id())==null) {
	    	FriendssVO fdd = new FriendssVO(vo.getUser_id(), list2);
	    	frienddRepository.insert(fdd);
	    	
	    } else {
	    	Update update2 = new Update(); 	
	    	update2.push("frListt").each(list2);
	    	Query query2 = new Query().addCriteria(Criteria.where( "followerId" ).is(vo.getUser_id()));
	    	mongoTemplate.updateFirst(query2, update2, "follower");
	    }
	   
	    
	    
	    
		}  
	}
	 
	@PostMapping("followingList")
	public String followingList( HttpServletRequest req) throws JsonProcessingException{
		HttpSession session = req.getSession();
		UserVO sessionvo = (UserVO)session.getAttribute("user");
		return friendRepository.findByFollowingId(sessionvo.getUser_id());
		
	} 
	
	@PostMapping("followerList")
	public String followerList( HttpServletRequest req) throws JsonProcessingException{
		HttpSession session = req.getSession();
		UserVO sessionvo = (UserVO)session.getAttribute("user");
		return frienddRepository.findByFollowerId(sessionvo.getUser_id());
	} 
	
	
	@PostMapping("chatContent")
	public List<ChatLog> chatContent(@RequestParam("receiver") String receiver, HttpServletRequest req) throws JsonProcessingException{
		HttpSession session = req.getSession();
		UserVO sessionvo = (UserVO)session.getAttribute("user");
		Query query = new Query();
		Criteria criteria = new Criteria();
		Criteria criteria_arr[]  = new Criteria[1];
		criteria_arr[0] = new Criteria().andOperator(Criteria.where("sender").is(receiver), Criteria.where("receiver").is(sessionvo.getUser_id()));
		criteria_arr[1] = new Criteria().andOperator(Criteria.where("sender").is(sessionvo.getUser_id()), Criteria.where("receiver").is(receiver));
		query.addCriteria(criteria.orOperator(criteria_arr));
		return mongoTemplate.find(query, ChatLog.class, receiver);
	} 
	
	
}