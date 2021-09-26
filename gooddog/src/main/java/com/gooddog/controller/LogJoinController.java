package com.gooddog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.gooddog.domain.KakaoOAuthToken;
import com.gooddog.domain.KakaoProfile;
import com.gooddog.domain.UserVO;
import com.gooddog.service.LogJoinService;

@RestController
public class LogJoinController { 
	
	@Autowired
	private LogJoinService logJoinService;
	
	//아이디 중복검사
		@PostMapping("idOkay") 
		public String idOkay(UserVO vo) { 
			    
			return logJoinService.idOkay(vo.getUser_id());
		}  
		    
		//닉네임 중복검사  
		
		@PostMapping("nickOkay")
		public String nickOkay(UserVO vo) {
			return logJoinService.nickOkay(vo.getUser_nick());
		}	 
		  
		//로그인
		@PostMapping("/loginComplete")
		public String login(UserVO vo, HttpServletRequest req, RedirectAttributes red) {
			HttpSession session = req.getSession();
			
				UserVO info = logJoinService.login(vo);
				red.addFlashAttribute("msg", false); 
			if(info==null) { 
				//session.setAttribute("user", null); 
				return "redirect:/mainPage";   
			} else if(info.getUser_author()=="1"){
				return "redirect:/admin/admin_chart";
			}
				else {    
				session.setAttribute("user", info);
				return "redirect:/mainPage";
			} 
			  
		} 
		
		//카카오 로그인
		@RequestMapping("/oauthkakao")
		@ResponseBody
		public String oauthkakao(String code) throws JsonProcessingException {
			//post방식으로 key=value 데이터를 요청해야함 ( 카카오로 )
					//Retrofit2
					//OkHttp
					//RestTemplate
					//http방식(post임)으로 쉽게 요청 가능
					 
					
					RestTemplate rt = new RestTemplate();
					
					//HttpHeader 오브젝트 생성
					HttpHeaders headers = new HttpHeaders();
					headers.add("Content-type","application/x-www-form-urlencoded;charset=utf-8");
					 
					//HttpBody 오브젝트 생성
					MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
					params.add("grant_type", "authorization_code");
					params.add("client_id", "051d848d1ca964220e821cd809db3584");
					params.add("redirect_url", "http://localhost:8082/mainPage");
					params.add("code", code);
					
					//Http Header와 HttpBody를 하나의 오브젝트에 담기
					HttpEntity<MultiValueMap<String, String>> kakaoRequest = 
							new HttpEntity<>(params, headers);
					
					//exchange함수에 httpentity 객체를 넣어야해서
					//Http 요청하기 - post 방식으로 ~ 그리고 response 변수의 응답 받기
					//json parser 들어가기
					ResponseEntity<String> response = rt.exchange("https://kauth.kakao.com/oauth/token", HttpMethod.POST, kakaoRequest, String.class);
					//logger.info("mainPage");
					
					KakaoOAuthToken oauthToken = null;	 
					//Gson, Json Simple, ObjectMapper
					ObjectMapper objectMapper = new ObjectMapper();
					try { 
					oauthToken = objectMapper.readValue(response.getBody(), KakaoOAuthToken.class);
					} catch(JsonMappingException e) { 
						 e.printStackTrace(); 
					} catch(JsonProcessingException e) {
						 e.printStackTrace();  
					}
					//////////////////////////////////////////////////////////////////////
					
					RestTemplate rt2 = new RestTemplate(); 
					
					
					
					//HttpHeader 오브젝트 생성
					HttpHeaders headers2 = new HttpHeaders(); 
					headers2.add("Authorization", "Bearer "+oauthToken.getAccess_token());
					headers2.add("Content-type","application/x-www-form-urlencoded;charset=utf-8");
					 
					
					HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest = 
							new HttpEntity<>(headers2);  
					 
				
					ResponseEntity<String> response2 = rt2.exchange("https://kapi.kakao.com/v2/user/me", HttpMethod.POST, kakaoProfileRequest, String.class);
					
					  
					 System.out.println(response2.getBody());
					 
					 ObjectMapper objectMapper2 = new ObjectMapper();
					 KakaoProfile kakaoProfile = null;
					 try {  
						 kakaoProfile = objectMapper2.readValue(response2.getBody(), KakaoProfile.class);
					 } catch (JsonMappingException e) {
							e.printStackTrace();
					 } catch (JsonProcessingException e) {
							e.printStackTrace();
					 }
					 //System.out.println("카카오 아이디(번호) : "+kakaoProfile.getId());
					 //System.out.println("카카오 이메일 : "+kakaoProfile.getKakao_account().getEmail());
			
					 return "abcd";
		}
		
		  
//		//로그아웃
//		@RequestMapping("/logout")
//		//@GetMapping("/logout")
//		public String logout(HttpSession session) {
//			session.invalidate();
//			return "redirect:/mainPage";
//		}  
		    
		//회원가입
		@PostMapping("/joinForm/join")
		public String join(UserVO vo, HttpServletRequest req) {
			HttpSession session = req.getSession();
			logJoinService.join(vo);
			return "redirect:/mainPage";
		}
} 
  