$(function(){
	
	
	$("#join_submit").on('click', function(){
		if(idOkay==false){
			alert("아이디 중복체크 확인")
		}else if(nickOkay==false){
			alert("닉네임 중복체크 확인")	
		}else {
		let addrplus = '';
		addrplus += $("sample6_address").val()
		addrplus += $("#sample6_extraAddress").val()
		addrplus += $("#sample6_postcode").val() 
		addrplus += $("#sample6_detailAddress").val()
		
		$.ajax({
			type : 'post',
			url : '../join',
			data: {user_id : $("#user_id").val(),
				   user_pwd : $("#user_pwd").val(),
					user_name : $("#user_name").val(),
					user_birth : $("#user_birth").val(),
					user_gender : $(".user_gender").val(),
					user_addr : addrplus,
					user_tel : $("#user_tel").val(),
					user_nick : $("#user_nick").val()
					}, success : function(data){
						alert('완료')
						location.href = "/board/mainPage"
					} 
			
			
		})
		}
	})
	
	
	
	
	
	
	
	
	
	$("#loginClick").on('click', function(){
		$.ajax({
			type: 'post',
			url: '../loginComplete',
			data: {user_id : $("#username").val(),
					user_pwd : $("#password").val()},
			success: function(data){
				alert("일치")
				location.href = "/mainPage"
			}  
			 
		})
	})
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	var user_idCheck = RegExp(/^[A-Za-z0-9]+@[A-Za-z0-9]+\.[A-Za-z0-9]/);
	let idCheck = false; 
	
	$("#idOkay").on('click', function(){
   		if($("#user_id").val()==''){
			alert("아이디를 입력해주세요.")
		}
		else if(!user_idCheck.test($("#user_id").val())){
			alert("이메일 형식으로 입력해주세요.")
		} else {
		$.ajax({
			type: 'post',
			url: '../idOkay',
			data: {user_id : $("#user_id").val()},
			success: function(data){
				alert(data);
				if(data==$("#user_id").val()) {
					alert("중복 된 아이디")
				}else {
					alert("사용 가능한 아이디") 
					$("#user_id").prop('readonly', true);
					idCheck = true;
				} 
			
			
			 }
			
		}) //ajax
		}
		 
		
		
	})//idOkay
	
	var user_nickCheck = RegExp(/^[ㄱ-ㅎ|가-힣|a-z|A-Z]+$/);
	
	var nickCheck = false;
	
	$("nickOkay").on('click', function(){
   		if($("#user_nick").val()==''){
			alert("닉네임을입력해주세요.")
		}
		else if(!user_nickCheck.test($("#user_id").val())){
			alert("이메일 형식으로 입력해주세요.")
		} else {
		$.ajax({
			type: 'post',
			url: '../nickOkay',
			data: {user_nick : $("#user_nick").val()},
			success: function(data){
				alert(data);
				if(data==$("#user_nick").val()) {
					alert("중복 된 닉네임")
				}else {
					alert("사용 가능한 닉네임") 
					$("#user_id").prop('readonly', true);
					nickCheck = true;
				} 
			
			
			 }
			
		}) //ajax
		}
		 
		
		
	})//nickOkay
	
	
	
	var user_pwCheck = RegExp(/^(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{8,16}$/);
	
	$("#user_pwd").keyup(function(){
		if(!user_pwCheck.test($("#user_pwd").val())){
			$("#user_pwd_chk").text("비밀번호 형식은 영문소문자+숫자+특수문자 8자이상 16자이하")
			$("#user_pwd_chk2").text("") 
		} else {  
			$("#user_pwd_chk").text("올바른 비밀번호입니다.")
		}
	})
	
	$("#user_pwd2").keyup(function(){
		if($("#user_pwd2").val()==$("#user_pwd").val()){
			$("#user_pwd_chk2").text("올바른 비밀번호입니다.") 
		} else {  
			$("#user_pwd_chk2").text("비밀번호가 일치하지 않습니다.")
		}
	})
	
	$("#addrClick").on('click', function(){
	  
		new daum.Postcode({
	        oncomplete: function(data) {
                var addr = ''; // 주소 변수 
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
 
                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다. 
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
	        }
	    }).open(); 
		 
	})
	
	
	
	
	
	
})