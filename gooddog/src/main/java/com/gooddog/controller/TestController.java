package com.gooddog.controller;


import org.springframework.web.bind.annotation.*;
import lombok.*;
import com.gooddog.entity.TestEntity;
import com.gooddog.repository.TestRepository;
import java.util.List;


@RestController // JSON 형태 결과값을 반환해줌 (@ResponseBody가 필요없음)
@RequiredArgsConstructor // final 객체를 Constructor Injection 해줌. (Autowired 역할)
@RequestMapping("/v1") // version1의 API

public class TestController {

	private final TestRepository testRepository;
	
	/** * 멤버 조회
	  * * @return */
	
	@GetMapping("member")
	public List<TestEntity> findAllMember() {//SELECT
		return testRepository.findAll(); 
	}
	
	/** * 회원가입
	 *  * @return */
	
	@PostMapping("member")
	public TestEntity signUp() { //INSERT
		final TestEntity member = TestEntity.builder()
				.username("test_user@gmail.com")
				.name("test user")
				.build();
		return testRepository.save(member);
	}

}

//http://localhost:8082/v1/member
