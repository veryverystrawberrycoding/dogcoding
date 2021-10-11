package com.gooddog.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.gooddog.domain.PetVO;
import com.gooddog.domain.UserVO;
import com.gooddog.repository.FriendRepository;
import com.gooddog.repository.FrienddRepository;
import com.gooddog.service.FriendService;
import com.gooddog.service.LogJoinService;
import com.gooddog.service.MypageService;
import com.mongodb.BasicDBObject;

@RestController
public class FriendController {
	@Autowired
	private LogJoinService logJoinService;
	
	@Autowired
	private FriendRepository friendRepository;
	
	@Autowired
	private FrienddRepository frienddRepository;
	
	@Autowired
	private FriendService friendService;
	
	@Autowired
	private MypageService mypageService;
	 
	@Autowired
    MongoTemplate mongoTemplate;
	
	//랜덤 친구추천
	@PostMapping("fdRecommend1")
	public List<HashMap<String, Object>> fdRecommend1(UserVO vo, HttpServletRequest req) throws Exception {
		 HttpSession session = req.getSession();
		 UserVO sessionvo = (UserVO)session.getAttribute("user");
	     vo.setUser_id(sessionvo.getUser_id());
	     int i = 0;
	     int k = 0;
		 int x = 0;
		 int y = 0;
		 int a = 0;
	     List<HashMap<String,Object>> join = new ArrayList<>();
	     //지역 , 키우는 강아지의 견종이 유사한 데이터 결합
	     join.addAll(friendService.fdRecommend1(vo));
	     join.addAll(friendService.fdRecommend2(vo));
	     //팔로잉 목록 가져오기 ( 데이터 정제를 위해)
		Query query = new Query().addCriteria(Criteria.where( "followingId" ).is(sessionvo.getUser_id()));
		FriendsVO mvo = mongoTemplate.findOne(query, FriendsVO.class, "following");
		
		//지역과 강아지 견종이 모두 유사한 경우, 중복데이터 제거
		for(i=0; i<join.size(); i++) { 
			for(k=0; k<i; k++) {
				if(join.get(i).get("user_id").equals(join.get(k).get("user_id"))) {
					join.remove(i);
					i--;
				}
			} 
		}
		//팔로잉 목록에 들어있는 유저 제거
		if(mvo!=null) {
			List<FrList> flist = mvo.getFrList(); 
		for(x=0; x<flist.size(); x++) {
			for(y=0; y<join.size(); y++) {
				if(flist.get(x).getFollower_id().equals(join.get(y).get("user_id"))){
						join.remove(y); 
						y--;
				}
			}
		}
		}
	    //본인 제거
	    for(a=0; a<join.size(); a++) {
	    	if(join.get(a).get("user_id").equals(sessionvo.getUser_id())) {
	    		join.remove(a);
	    		a--; 
	    	}
	    }
	     return join;
		 
	}
	@PostMapping("profileAdd")
	public void profileAdd(UserVO vo, HttpServletRequest req) throws JsonProcessingException {
		HttpSession session = req.getSession();
		UserVO sessionvo = (UserVO)session.getAttribute("user");
		ObjectMapper mapper = new ObjectMapper();
		UserVO voo = logJoinService.userSelect(vo);
	
		FrList fd2 = new FrList(voo.getUser_id(), voo.getUser_name(), voo.getUser_nick(), voo.getUser_img());
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
	     
	    if(frienddRepository.findByFollowerId(voo.getUser_id())==null) {
	    	FriendssVO fdd = new FriendssVO(voo.getUser_id(), list2);
	    	frienddRepository.insert(fdd);
	    	 
	    } else {
	    	Update update2 = new Update(); 	
	    	update2.push("frListt").each(list2);
	    	Query query2 = new Query().addCriteria(Criteria.where( "followerId" ).is(voo.getUser_id()));
	    	mongoTemplate.updateFirst(query2, update2, "follower");
	    }
	   
	    
	    
	    
		}  
		
	}
	//팔로잉, 팔로워
	@PostMapping("fdAdd")
	public void fdAdd(UserVO voo, HttpServletRequest req) throws JsonProcessingException {
		HttpSession session = req.getSession();
		UserVO sessionvo = (UserVO)session.getAttribute("user");

		UserVO vo = logJoinService.userSelect(voo); 

		System.out.println(vo.getUser_name());
		System.out.println(friendRepository.findByFollowingId(sessionvo.getUser_id()));
		FrList fd2 = new FrList(vo.getUser_id(), vo.getUser_name(), vo.getUser_nick(), vo.getUser_img());
		  //처음만들었을떄 리스트화
		ArrayList<FrList> list = new ArrayList<>();
	    list.add(fd2); 
	    
	    FrListt fdd2 = new FrListt(sessionvo.getUser_id(), sessionvo.getUser_name(), sessionvo.getUser_nick(), sessionvo.getUser_img());
	    ArrayList<FrListt> list2 = new ArrayList<>();
	    list2.add(fdd2);
	 
	    //처음 팔로잉하거나 팔로우 당했을 때 새로운 도큐먼트를 생성
		if(friendRepository.findByFollowingId(sessionvo.getUser_id())==null) {
		FriendsVO fd = new FriendsVO(sessionvo.getUser_id(), list);  
	    System.out.println(fd);
		friendRepository.insert(fd);   
		}  else {
		//이미 도큐먼트가 있을 때 frList에 팔로우 정보 업데이트
		Update update = new Update();
		//frList에 각각의 정보 저장 
	    update.push("frList").each(list);
	    //쿼리 Criteria객체에 싣기
	    Query query = new Query().addCriteria(Criteria.where( "followingId" ).is(sessionvo.getUser_id()));//세션에 담긴 값
	    //following 컬렉션, query문으로 찾은 도큐먼트에서 업데이트(push=추가) 실행
	    mongoTemplate.updateFirst(query, update, "following");
	    //팔로워도 같은 방식으로, 세션값이 아닌 팔로우한 유저정보값 넘기기
	    
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
	
	@PostMapping("followDel")
	public void followDel(UserVO vo, HttpServletRequest req) throws JsonProcessingException{
		HttpSession session = req.getSession();
		UserVO voo = logJoinService.userSelect(vo);
		UserVO sessionvo = (UserVO)session.getAttribute("user");
		
		FrList fd2 = new FrList(voo.getUser_id(), voo.getUser_name(), voo.getUser_nick(), voo.getUser_img());
		ArrayList<FrList> list = new ArrayList<>();
	    list.add(fd2); 
	    
	    FrListt fdd2 = new FrListt(sessionvo.getUser_id(), sessionvo.getUser_name(), sessionvo.getUser_nick(), sessionvo.getUser_img());
	    ArrayList<FrListt> list2 = new ArrayList<>();
	    list2.add(fdd2);
		
	    Query query = new Query().addCriteria(Criteria.where( "followingId" ).is(sessionvo.getUser_id()));
	    Query query2 = new Query().addCriteria(Criteria.where( "followerId" ).is(vo.getUser_id()));
		Update update = new Update();
		Update update2 = new Update();
		
		//BasicDBObject에 key와 value를 싣고 리스트 내부 데이터 pull(당겨오기)
		update.pull("frList", new BasicDBObject("follower_id", voo.getUser_id()));
		update2.pull("frListt",new BasicDBObject("follower_id", sessionvo.getUser_id())); 
		//쿼리문 내부에서 update 실행, 팔로잉과 팔로워 동시 제거
		mongoTemplate.updateFirst(query, update, "following");
		mongoTemplate.updateFirst(query2, update2, "follower");
		
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
	
	@PostMapping("yourPet")
	public Map<String,Object> yourPet(UserVO vo){
		Map <String,Object> map = new HashMap<String,Object>();
		List<PetVO> list = new ArrayList<PetVO>();
		list = mypageService.dogList(vo.getUser_id());
		map.put("yourPet", list);   
		return map;  
	}
	
	@PostMapping("yourFollowing")
	public String yourFollowing(UserVO vo) throws JsonProcessingException {
		if(friendRepository.findByFollowingId(vo.getUser_id())==null) {
		return "fail";
		} else {
		return friendRepository.findByFollowingId(vo.getUser_id());
		} 
	}
	
	@PostMapping("yourFollower")
	public String yourFollower(UserVO vo) throws JsonProcessingException {
		
		if(frienddRepository.findByFollowerId(vo.getUser_id())==null) {
			return "fail";
			} else { 
			return frienddRepository.findByFollowerId(vo.getUser_id());
			} 
		
	}
	
	@PostMapping("profileTest")
	public List<FrList> profileTest(UserVO vo, HttpServletRequest req) throws JsonProcessingException {
		HttpSession session = req.getSession();
		UserVO sessionvo = (UserVO)session.getAttribute("user");
		Query query = new Query().addCriteria(Criteria.where( "followingId" ).is(sessionvo.getUser_id()));
		FriendsVO mvo = mongoTemplate.findOne(query, FriendsVO.class, "following");
		List<FrList> flist = mvo.getFrList();
	
		return flist;
		
	} 
	
	
	

	
}