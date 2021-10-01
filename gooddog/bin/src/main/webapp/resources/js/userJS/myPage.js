$(function(){
	
	
	
	var user_pwCheck = RegExp(/^(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{8,16}$/);
	var user_idCheck = RegExp(/^[A-Za-z0-9]+@[A-Za-z0-9]+\.[A-Za-z0-9]/);
	var user_nickCheck = RegExp(/^[ㄱ-ㅎ|가-힣|a-z|A-Z]+$/);
	
	let nick_modify = true; 
	
	$("#user_nick_modify_click").on('click', function(){
		
		if(!user_nickCheck.test($("#user_nick_modify").val())){
			alert("닉네임은 한글/영문으로 입력해주세요")
			$("#user_nick_modify").val('');
			nick_modify = false;
		}else{
			$.ajax({
				type:'post',
				url:'../nickOkay',
				data:{
					user_nick: $("#user_nick_modify").val()
				},success: function(data){
				alert(data);
				if(data==$("#user_nick_modify").val()) {
					alert("중복 된 닉네임입니다.")
					nick_modify = false;
				}else {
					alert("사용 가능한 닉네임입니다.") 
					$("#user_nick_modify").prop('readonly', true);
					nick_modify = true;
				}  
			 } 
			}) 
		} 
	})
	
	$("#addrClick_modify").on('click', function(){
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
                
                } else {
                    document.getElementById("sample6_extraAddress_modify").value = '';
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample6_address_modify").value = addr;
				$("#sample6_extraAddress_modify").prop('readonly', false);
				$("#sample6_extraAddress_modify").focus();
                // 커서를 상세주소 필드로 이동한다.
	        }
	    }).open(); 
 		
		
		
	})
	
	
	//기타 변경
	$("#user_modify").on('click', function(){
		
			
						let adr = ''
						adr += $("#sample6_address_modify").val()
						adr += $("#sample6_extraAddress_modify").val()
							
						$.ajax({
							type:'post',
							url:'/noPwdModify',
							data: {
								user_nick : $("#modify_user_nick").val(),
								user_tel : $("#modify_user_tel").val(),
								user_addr : adr
									
								}, success:function(fd){
										alert("수정이 완료되었습니다.")
										location.href = "/mainPage"
								} 
								
							})
		
		
	})
	
	
	
	$("#join_submit").on('click', function(){
		if(idCheck==false){
			alert("아이디 중복체크 확인하세요")
		}else if(nickCheck==false){
			alert("닉네임 중복체크 확인하세요")	
		}else {
		let addrplus = '';
		addrplus += $("#sample6_address").val()
		addrplus += $("#sample6_extraAddress").val()
		
		var fileData = new FormData();
		fileData.append("file", $('#join_file')[0].files[0]);
		
		$.ajax({
			type:'post',
			url:'/joinImg',
			data : fileData,
			enctype: 'multipart/form-data',
    		processData: false,
   		    contentType: false,
			dataType: "json",
   		    cache: false,
			success: function(){
				
			}
			 
		})
		
		$.ajax({ 
			type : 'post',
			url : '/joinForm/join',
			data: {user_id : $("#user_id").val(),
				   user_pwd : $("#user_pwd").val(),
					user_name : $("#user_name").val(),
					user_birth : $("#user_birth").val(),
					user_gender : $(".user_gender").val(),
					user_addr : addrplus,
					user_tel : $("#user_tel").val(),
					user_nick : $("#user_nick").val(),
					user_img : document.getElementById("join_file").files[0].name
					}, success : function(data){
						alert('완료')
						location.href = "/mainPage" 
					} 
			 
			 
		})
		}
	})  
	
	
	
	
	
	
	
	
	
	$("#loginClick").on('click', function(){ 
		$.ajax({
			type: 'post',
			url: 'loginComplete',
			data: {user_id : $("#username").val(),
					user_pwd : $("#password").val()},
			success: function(data){
				if(data==''){ 
					$("#id_pwd_error").text("아이디, 비밀번호가 일치하지 않습니다.")
				}else {
				location.href = "/mainPage"  
				}
			}  
			 
		})
	})
	

	

	let idCheck = false; 
	
		$("#idClick").click(function(){
   		if($("#user_id").val()==''){
			alert("아이디를 입력해주세요.")
		}
		else if(!user_idCheck.test($("#user_id").val())){
			alert("이메일 형식으로 입력해주세요.")
		} else { 
		$.ajax({  
			type: 'post', 
			url: 'idOkay',    
			data: {user_id : $("#user_id").val()},
			success: function(data){
				alert(data);
				if(data==$("#user_id").val()) {
					alert("중복 된 아이디입니다")
				}else {
					alert("사용 가능한 아이디입니다") 
					$("#user_id").prop('readonly', true);
					idCheck = true;
				}  
			
			
			 }
			
		}) //ajax
		}
		 
		
		
	})//idOkay
	
/*	$("#idClick").on('click', function(){
   		if($("#user_id").val()==''){
			alert("아이디를 입력해주세요.")
		}
		else if(!user_idCheck.test($("#user_id").val())){
			alert("이메일 형식으로 입력해주세요.")
		} else { 
		$.ajax({ 
			type: 'post', 
			url: '/joinForm/idOkay',    
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
		 
		
		
	})//idOkay*/
	
	
	
	var nickCheck = false;
	
	$("#nickOkay").on('click', function(){
   		if($("#user_nick").val()==''){ 
			alert("닉네임을입력해주세요.")
		}
		else if(!user_nickCheck.test($("#user_nick").val())){
			alert("한글/영어로 입력하세요")
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
					$("#user_nick").prop('readonly', true);
					nickCheck = true;
				} 
			
			
			 }
			
		}) //ajax
		}
		 
		
		
	})//nickOkay
	
	
	
	
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
	
	$("#user_pwd3").keyup(function(){
		if($("#user_pwd2").val()==$("#user_pwd3").val()){
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
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample6_address").value = addr;
				$("#sample6_extraAddress").prop('readonly', false);
				$("#sample6_extraAddress").focus();
                // 커서를 상세주소 필드로 이동한다.
	        }
	    }).open(); 
		 
	})
	
	
	
function dogList() {
		$.ajax({
			type:'post',
			url: '../dogList',
			success: function(data){
				let length = data.doglist.length
				$(".totalPetList").empty(); 
				for(var i=0; i<length; i++) {
					let list = ''
					list += '<div class="col-lg-3"></div>'
					list += '<div class="col-lg-4 mt-40 mt-lg-0">'
					list += '<img class="pet_img" src="#" style="width:300px; height:300px; margin: 3px; bottom:20px"></img></div>'
					list += '<div class=" col-lg-5">' 
					list += '<div class="form-group has-placeholder div_pet_name">이름&nbsp&nbsp<input style="height:40px; width:300px;" class="pet_name" type="text" value="'+data.doglist[i].pet_name+'"></div>'
					list += '<div class="form-group has-placeholder div_pet_birth">나이&nbsp&nbsp<input style="height:40px; width:300px;" class="pet_birth" type="text" value="'+data.doglist[i].pet_birth+'"></div>'
					list += '<div class="form-group has-placeholder div_pet_ident">번호&nbsp&nbsp<input style="height:40px; width:300px;" class="pet_ident" type="text" value="'+data.doglist[i].pet_ident+'"></div>' 
					list += '<div class="form-group has-placeholder div_pet_gender">성별&nbsp&nbsp<input style="height:40px; width:300px;" class="pet_gender" type="text" value="'+data.doglist[i].pet_gender+'"></div>'
					list += '<div class="form-group has-placeholder div_pet_spacies">종족&nbsp&nbsp<input style="height:40px; width:300px;" class="pet_spacies" type="text" value="'+data.doglist[i].pet_spacies+'"></div>'
					list += '<input type="hidden" class="hidden_pet_no" style="weight:10px;" value="'+data.doglist[i].pet_no+'">'  
					list += '<div class="form-group d-flex-row-reverse align-items-center flex-column flex-md-row mt-40">' 
					list += '<div class="container"><div class="row"><div class="col-md-12">'
					list += '<button type="submit" id="pet_modify_submit" name="contact_submit" class="btn btn-maincolor btn-xs pet_modify_btn">수정</button>'
					list += '<button type="submit" id="pet_modify_submit" name="contact_submit" class="btn btn-maincolor btn-xs pet_delete_btn">삭제</button></div></div></div></div></div>'
					$(".totalPetList").append(list); 
				}
				 
				
			}  
			  	 
			 
		})  
} 
dogList();

$(document).on('click', '.pet_modify_btn', function(){
	$.ajax({
		type:'post',
		url:'../dogModify',
		data: {pet_no : $(this).parent().parent().parent().parent().parent().find(".hidden_pet_no").val(),
			   pet_name : $(this).parent().parent().parent().parent().parent().find(".pet_name").val(),
			   pet_birth : $(this).parent().parent().parent().parent().parent().find(".pet_birth").val(),
			   pet_ident : $(this).parent().parent().parent().parent().parent().find(".pet_ident").val(),
			   pet_spacies : $(this).parent().parent().parent().parent().parent().find(".pet_spacies").val()},
		success: function(data) { 
			alert("수정이 완료됐습니다")
		} 
		
	})
	
}) 
  
$(document).on('click', '.pet_delete_btn', function(){
	if(confirm("정말로 삭제하시겠습니까?")){
	$.ajax({
		type:'post',
		url:'../dogDelete',
		data: {pet_no : $(this).parent().parent().parent().parent().parent().find(".hidden_pet_no").val()},
		success: function(data){
				dogList();
			
			
		}
	
	})
	} else {
		dogList();
	}
})


$(".logoutClick").click(function(){
	$.ajax({
		type:'post',
		url:'../logout',
		success: function(date){
			alert("로그아웃 하셨습니다.")
		}
		
		
		
	})
	
})


/*let modifyCheck = false;

$("#modify_user_pwd3").on('keyup', function(){
	if(!user_pwCheck.test($("#modify_user_pwd2").val())){
		$("#modify_test").text("비밀번호는 8~16자 영문/숫자/특수문자 조합입니다.")
	} else if($("#modify_user_pwd2").val()!=$("#modify_user_pwd3").val()){
		$("#modify_test").text("동일한 비밀번호를 입력해주세요")
	} else {
		$("#modify_test").text("비밀번호가 일치합니다.")
	}
})
*/




/*$("#user_modify").click(function(){
	
	
	$.ajax({
		type:'post',
		url:'../passCheck',
		data: {user_pwd : $("#modify_user_pwd").val()},
		success: function(data){
			if(data==null){
				alert("비밀번호를 확인해주세요")
			}else {
			
			$.ajax({
				type:'post',
				url: '../userModify',
				data: {
					user_pwd : $("modify_user_pwd3").val()
					
				}, success: function(data){
					
				}
			})//ajax
		}
		}
	
	})

})*/

$("#pwd_modify_btn").click(function(){
	if(!($("#modify_user_pwd")=='') || !($("#modify_user_pwd2")=='') || !($("#modify_user_pwd3")=='')){
				$("#modify_error").text("비밀번호를 입력해주세요.");
				return false;
	} else if(!user_pwCheck.test($("#modify_user_pwd2").val())){
				$("#modify_error").text("비밀번호 형식은 영문+숫자+특수문자 8~16자리입니다.");
				return false;
	} else if(!user_pwCheck.test($("#modify_user_pwd3").val())){
				$("#modify_error").text("비밀번호 형식은 영문+숫자+특수문자 8~16자리입니다.");
				return false;
	} else if($("#modify_user_pwd2")!=$("#modify_user_pwd3")){
				$("#modify_error").text("변경 할 비밀번호가 일치하지 않습니다.");
	} else {
	
	$.ajax({
		type:'post',
		url:'../pwdModify',
		data : {
			now_pwd : $("#modify_user_pwd").val(),
			user_pwd : $("#modify_user_pwd2").val()},
		success:function(pwd){
			if(pwd.pwd==0){
				alert("비밀번호 변경이 완료되었습니다. 다시 로그인 해주세요.")
				location.href = "/loginForm"
			} else{
				$("#modify_error").text("현재 비밀번호가 잘못되었습니다.")
			}
			 
		} 
		
		 
	})	
	}
})


////////////////////내 리스트 관련///////////////////////////
let onepage1 = 3;
let page1=1;
let maxpage1=0; 
let start1=0;
let end1=0; 

function myGalList() {
	$.ajax({
		type:'post',
		url:'../myGalList',
		success:function(data){
			
			let length = data.length
			
			if(length%onepage1==0){
				maxpage1 = length/onepage1
			} else {
				maxpage1 = length/onepage1 + 1
			}  
			$(".my_gal_list").empty();
			$(".gal_page").append('<li class="page-item"><a class="page-link pregal" style="cursor:pointer;">이전</a></li>')
			if(onepage1>length){
			for(var x=0; x<length; x++)
			{  
			glist = ''	 
			glist += '<div class="vertical-item text-center content-padding box-shadow ">'
			glist += '<div class="item-media"><img src="../resources/images/gallery/'+data[x].gal_img+'" alt="img" style="width:200px;height:200px;">'
			glist += '<div class="media-links"><a class="abs-link" title="" href="gallery-single.html"></a></div></div>'
			glist += '<div class="item-content"><h4 class="mt-3 mb-0"><a href="gallery-single.html">'+data[x].gal_name+'</a></h4></div></div>'
			$(".my_gal_list").append(glist);
			} 
			}else{ 
			for(var x=0; x<onepage1; x++){
			glist = ''	 
			glist += '<div class="vertical-item text-center content-padding box-shadow ">'
			glist += '<div class="item-media"><img src="../resources/images/gallery/'+data[x].gal_img+'" alt="img" style="width:200px;height:200px;">'
			glist += '<div class="media-links"><a class="abs-link" title="" href="gallery-single.html"></a></div></div>'
			glist += '<div class="item-content"><h4 class="mt-3 mb-0"><a href="gallery-single.html">'+data[x].gal_name+'</a></h4></div></div>'
			$(".my_gal_list").append(glist);	
			}
			}  
			for(var a=1; a<=maxpage1; a++){ 
				$(".gal_page").append('<li class="page-item"><a id=paging3'+a+' class="page-link paging3" style="cursor:pointer;">'+a+'</a></li>')
			}
				$(".gal_page").append('<li class="page-item"><a class="page-link nextgal" style="cursor:pointer;">다음</a></li>')
		}      
		  
	}) 
}  


$(document).on('click', '.paging3', function(){
	$(".paging3").css({
		"background":"none",
		"color": "#000000"
	})
	 
	
	$(this).css({
		"background":"orange",
		"color": "#ffffff"
	}) 
	
	
	page1 = parseInt($(this).text());
	start1 = onepage1*(page1-1);
	end1 = onepage1*page1;
	$.ajax({ 
		type:'post', 
		url:'../myGalList',
		success: function(data) {
			$(".my_gal_list").empty();
			if(data.length>=end1){
			for(var x=start1; x<end1; x++){
			glist = ''	
			glist += '<div class="vertical-item text-center content-padding box-shadow ">'
			glist += '<div class="item-media"><img src="../resources/images/gallery/'+data[x].gal_img+'" alt="img" style="width:200px;height:200px;">'
			glist += '<div class="media-links"><a class="abs-link" title="" href="gallery-single.html"></a></div></div>'
			glist += '<div class="item-content"><h4 class="mt-3 mb-0"><a href="gallery-single.html">'+data[x].gal_name+'</a></h4></div></div>'
			$(".my_gal_list").append(glist);
		}  
		} else { for(var x=start1; x<data.length; x++){
			glist = ''	
			glist += '<div class="vertical-item text-center content-padding box-shadow ">'
			glist += '<div class="item-media"><img src="../resources/images/gallery/'+data[x].gal_img+'" alt="img" style="width:200px;height:200px;">'
			glist += '<div class="media-links"><a class="abs-link" title="" href="gallery-single.html"></a></div></div>'
			glist += '<div class="item-content"><h4 class="mt-3 mb-0"><a href="gallery-single.html">'+data[x].gal_name+'</a></h4></div></div>'
			$(".my_gal_list").append(glist);
		}
			
		} 
		 
		} 
})
})

$(document).on('click', '.nextgal', function(){
	page1 = page1 + 1
	$(".paging3").css({
		"background":"none",
		"color": "#000000"
	})
	$("#paging3"+page1+"").css({
		"background":"orange",
		"color": "#ffffff"
	})
	
	
	if(page1>maxpage1){
		
	} 
	else{
	 
	 
	start1=onepage1*(page1)-onepage1;
	end1=onepage1*(page1+1)-onepage1;
	$.ajax({
		type : "post",
		url:'../myGalList',
		success: function(data) {
			$(".my_gal_list").empty();
			for(var x=start1; x<end1; x++){
			glist = ''	
			glist += '<div class="vertical-item text-center content-padding box-shadow ">'
			glist += '<div class="item-media"><img src="../resources/images/gallery/'+data[x].gal_img+'" alt="img" style="width:200px;height:200px;">'
			glist += '<div class="media-links"><a class="abs-link" title="" href="gallery-single.html"></a></div></div>'
			glist += '<div class="item-content"><h4 class="mt-3 mb-0"><a href="gallery-single.html">'+data[x].gal_name+'</a></h4></div></div>'
			$(".my_gal_list").append(glist);
		}   
		}  
	}); 
	 
	}
})
 
$(document).on('click', '.pregal', function(){
	page1 = page1-1
	$(".paging3").css({
		"background":"none",
		"color": "#000000"
	})
	$("#paging3"+page1+"").css({
		"background":"orange",
		"color": "#ffffff"
	})
	
	if(page1<1){
		
	}
	else{
	
	
	var start1 = onepage1*(page1)-onepage1;
	var end1 = onepage1*(page1+1)-onepage1;
	
	$.ajax({
		url:'../myGalList',
		type : "post",
		success: function(data) {
			$(".my_gal_list").empty();
			for(var x=start1; x<end1; x++){
			glist = ''	
			glist += '<div class="vertical-item text-center content-padding box-shadow ">'
			glist += '<div class="item-media"><img src="../resources/images/gallery/'+data[x].gal_img+'" alt="img" style="width:200px;height:200px;">'
			glist += '<div class="media-links"><a class="abs-link" title="" href="gallery-single.html"></a></div></div>'
			glist += '<div class="item-content"><h4 class="mt-3 mb-0"><a href="gallery-single.html">'+data[x].gal_name+'</a></h4></div></div>'
			$(".my_gal_list").append(glist);
		}   
		} 
	});
	
	}
})  

myGalList();

let onepage2 = 5;
let page2=1;
let maxpage2=0; 
let start2=0;
let end2=0; 
////////////////////////////내 댓글 리스트 관련//////////////////////////////////////
function myGalReply(){
	$.ajax({
		type:'post',
		url:'../myGalReply', 
		success:function(data){
			 
			let length = data.length
			if(length%onepage2==0){
				maxpage2 = length/onepage2
			} else {
				maxpage2 = length/onepage2 + 1
			} 
			 
			$(".my_galre_list").empty(); 
			$(".galre_page").append('<li class="page-item"><a class="page-link pregalre" style="cursor:pointer;">이전</a></li>')
			if(onepage2>length){
			for(var x=0; x<length; x++)
			{  
			glistss=''
			glistss += '<div class="vertical-item text-center content-padding box-shadow">'
			glistss += '<h4 class="mt-3 mb-0"><a href="gallery-single.html">'+data[x].gal_name+'</a></h4><p class="mt-4 px-lg-3">'+data[x].galre_content+'</p></div>'
			$(".my_galre_list").append(glistss)  
			}} else { 
			for(var x=0; x<onepage2; x++){
			glistss=''
			glistss += '<div class="vertical-item text-center content-padding box-shadow">'
			glistss += '<h4 class="mt-3 mb-0"><a href="gallery-single.html">'+data[x].gal_name+'</a></h4><p class="mt-4 px-lg-3">'+data[x].galre_content+'</p></div>'
			$(".my_galre_list").append(glistss) 
			}	
			}
			for(var a=1; a<=maxpage2; a++){ 
				$(".galre_page").append('<li class="page-item"><a id=paging2'+a+' class="page-link paging2" style="cursor:pointer;">'+a+'</a></li>')
			}
				$(".galre_page").append('<li class="page-item"><a class="page-link nextgalre" style="cursor:pointer;">다음</a></li>')   
		} 
	})
}

$(document).on('click', '.paging2', function(){
	$(".paging2").css({
		"background":"none",
		"color": "#000000"
	})
	 
	
	$(this).css({
		"background":"orange",
		"color": "#ffffff"
	}) 
	
	
	page2 = parseInt($(this).text());
	start2 = onepage2*(page2 - 1);
	end2 = onepage2*page2;
	$.ajax({ 
		type:'post',   
		url:'../myGalReply',
		success: function(data) {
			$(".my_galre_list").empty();
			if(data.length>=end2){ 
			for(var x=start2; x<end2; x++){
			glistss=''
			glistss += '<div class="vertical-item text-center content-padding box-shadow">'
			glistss += '<h4 class="mt-3 mb-0"><a href="gallery-single.html">'+data[x].gal_name+'</a></h4><p class="mt-4 px-lg-3">'+data[x].galre_content+'</p></div>'
			$(".my_galre_list").append(glistss);
		}  
		} else { for(var x=start2; x<data.length; x++){
			glistss=''
			glistss += '<div class="vertical-item text-center content-padding box-shadow">'
			glistss += '<h4 class="mt-3 mb-0"><a href="gallery-single.html">'+data[x].gal_name+'</a></h4><p class="mt-4 px-lg-3">'+data[x].galre_content+'</p></div>'
			$(".my_galre_list").append(glistss);
		}
			
		} 
		 
		} 
})
})

$(document).on('click', '.nextgalre', function(){
	page2 = page2 + 1
	$(".paging2").css({
		"background":"none",
		"color": "#000000" 
	})
	$("#paging2"+page2+"").css({
		"background":"orange",
		"color": "#ffffff"
	})
	
	
	if(page2>maxpage2){
		
	} 
	else{
	  
	 
	start2=onepage2*(page2)-onepage2;
	end2=onepage2*(page2+1)-onepage2;
	$.ajax({
		type : "post",
		url:'../myGalReply',
		success: function(data) {
			$(".my_galre_list").empty();
			for(var x=start2; x<end2; x++){
			glistss=''
			glistss += '<div class="vertical-item text-center content-padding box-shadow">'
			glistss += '<h4 class="mt-3 mb-0"><a href="gallery-single.html">'+data[x].gal_name+'</a></h4><p class="mt-4 px-lg-3">'+data[x].galre_content+'</p></div>'
			$(".my_galre_list").append(glistss);
		}   
		}  
	}); 
	 
	}
})
 
$(document).on('click', '.pregalre', function(){
	page2 = page2-1
	$(".paging2").css({
		"background":"none",
		"color": "#000000"
	})
	$("#paging2"+page2+"").css({
		"background":"orange",
		"color": "#ffffff"
	})
	
	if(page2<1){
		
	}
	else{
	
	
	start2 = onepage2*(page2)-onepage2;
	end2 = onepage2*(page2+1)-onepage2;
	
	$.ajax({
		url:'../myGalReply',
		type : "post",
		success: function(data) {
			$(".my_galre_list").empty();
			for(var x=start2; x<end2; x++){
			glistss=''
			glistss += '<div class="vertical-item text-center content-padding box-shadow">'
			glistss += '<h4 class="mt-3 mb-0"><a href="gallery-single.html">'+data[x].gal_name+'</a></h4><p class="mt-4 px-lg-3">'+data[x].galre_content+'</p></div>'
			$(".my_galre_list").append(glistss);
		}   
		} 
	});
	
	}
})  

 



myGalReply();

$("#img_modify_btn").click(function(){
	var fileData = new FormData();
	fileData.append("file", $('#modify_file')[0].files[0]);
	$.ajax({
		type:'post',
		url:'../modifyImg',
		data: {user_img : document.getElementById("modify_file").files[0].name},
		success:function(){
			
		}
	}) 
	$.ajax({
		type:'post',
		url:'../modifyFile',
		data: fileData,
		enctype:'multipart/form-data',
	    processData: false,
    	contentType: false,
		dataType: "json",
   		cache: false,
		success:function(data){
			alert("프로필사진 변경이 완료됐습니다.")
		} 
	})
})


$(".pet_submit_btn").click( function(){
	var fileData = new FormData();
	fileData.append("file", $('#dog_file')[0].files[0]);
	$.ajax({ 
    type: 'POST',
    url: '../uploadFile',
    data: fileData,
    enctype: 'multipart/form-data',
    processData: false, 
    contentType: false,
	dataType: "json",
    cache: false, 
    success: function () {
	alert("업로드호출") 
      // Handle upload success
      // ... 
    },
    error: function () {
      // Handle upload error
      // ...
    } 
 	 });

	$.ajax({
		type:'post',
		url:'../petInput',
		data:{
			pet_img : document.getElementById("dog_file").files[0].name,
			pet_name : $(".pet_input_name").val(),
			pet_birth : $(".pet_input_date").val(),
			pet_ident : $(".pet_input_number").val(),
			pet_gender : $(".pet_input_gender").val(),
			pet_spacies : $(".pet_input_spacies").val()
		}, 
		success:function(data){
			 
			
			
		}
		
		
	})
	
	
})


function lossList(){
	$.ajax({
		type:'post',
		url: '../lossList',
		success:function(data){
				$(".loss_alert").empty();
			for(let i=0; i<data.length; i++){
				alert(data[0].loss_no) 
				var loss = ''
				loss += '<div>펫 넘버 : '+data[i].loss_no+'</div>'
				loss += '<div>펫 이름 : '+data[i].pet_name+'</div>'
				loss += '<div>실종 이미지 : '+data[i].loss_img+'</div>'
				$(".loss_alert").append(loss);
			}
			
		}
		
		
	}) 

	
}
lossList(); 
	
///////////////////////////////////////////////////여기부터는 친구관련////////////////////////////////////////////////////




function fdRecommend1() {
	
	$.ajax({ 
		type:'post',
		url: '../fdRecommend1',
		success: function(data){
			$(".total_friend_hi").empty(); 
			for(var i=0; i<data.length; i++){
			//var i = Math.random() * data.length
			let fd = '' 
			fd += '<div class="col-xl-4 col-lg-5 col-md-5">'
			fd += '<div class="item-media cover-image" style="background-image: url(&quot;images/gallery/15.jpg&quot;);">'
			fd += '<img src="'+data[i].user_img+'" alt="img">'
			fd += '</div></div><br><br>' 
			fd += '<div class="col-xl-8 col-lg-7 col-md-7"><div style="margin:0px">'
			fd += '<input type="hidden" class="friend_id" value="'+data[i].user_id+'">'
			fd += '<input type="hidden" class="friend_nick" value="'+data[i].user_nick+'">'
			fd += '<input type="hidden" class="friend_name2" value="'+data[i].user_name+'">'
			fd += '<div style="font-size:20px; text-align:left">이름&nbsp&nbsp<a class="friend_name" style="color:black;">'+data[i].user_name+'</a></div>'
			fd += '<div style="font-size:20px; text-align:left"">지역&nbsp&nbsp<a class="friend_addr" style="color:black;">'+data[i].user_addr+'</a></div>'
			fd += '<div style="font-size:20px; text-align:left"">견종&nbsp&nbsp<a class="friend_spacies" style="color:black;">'+data[i].pet_spacies+'</a></div>'
			fd += '<div style="display: inline-block; margin:0 5px; float:left;">'
			fd += '<button type="button" class="btn btn-info btn-xs friend_click" style="margin-left: 12%;">추가</button></div></div></div><div></div>'  
			$(".total_friend_hi").append(fd); 
			}  
		} 
		 
		   
	})
	
} 
fdRecommend1()

function followingList() {
	$.ajax({
		type:'post',
		url: 'followingList',
		success: function(data){
			$(".total_friend_view").empty();
			const obj = JSON.parse(data);
			var list = obj.frList
			alert(list[0].follower_id)
			for(var i=0; i<list.length; i++){
			fdview=''
			fdview += '<div class="col-xl-4 col-lg-5 col-md-5">'
			fdview += '<div class="item-media cover-image" style="background-image: url(&quot;images/gallery/15.jpg&quot;);">'
			fdview += '<img class= "friend_img" src="'+list[i].follower_img+'" alt="img">'
			fdview += '</div></div><br><br>' 
			fdview += '<div class="col-xl-8 col-lg-7 col-md-7"><div style="margin:0px">'
			fdview += '<input type="hidden" class="friend_id" value="'+list[i].follower_id+'">'
			fdview += '<div style="font-size:20px; text-align:left">이름&nbsp&nbsp<a class="friend_name" style="color:black;">'+list[i].follower_name+'</a></div>'
			fdview += '<div style="font-size:20px; text-align:left"">닉네임&nbsp&nbsp<a class="friend_addr" style="color:black;">'+list[i].follower_nick+'</a></div>'
			fdview += '<div style="display: inline-block; margin:0 5px; float:left;">'
			fdview += '<button type="button" class="btn btn-info btn-xs friend_click" style="margin-left: 12%;">삭제</button></div></div></div><div></div>'  
			$(".total_friend_view").append(fdview);   
			} 
		}
	
	}) 

}

followingList();


 
$(document).on('click', '.friend_click', function(){
			$(this).html('추가되었습니다')
			$(this).attr("disabled", true)
	$.ajax({
		type:'post',  
		url: '../fdAdd', 
		data:{ 
			user_id : $(this).parent().parent().find('.friend_id').val(), 
			user_nick : $(this).parent().parent().find('.friend_nick').val(), 
			user_name : $(this).parent().parent().find('.friend_name2').val(),  
			user_img : $(this).parent().parent().parent().parent().find('img').attr("src")
			 
		},
		success: function(data){
			
			followingList();
		} 
	})  
	
})




/*$(".friend_click").on('click', function(){
	$.ajax({
		type:'post',
		url:'../fdFollow',
		data: {
			
		}
		
		
		
		
	})
	
})*/


/*<div class="col-xl-4 col-lg-5 col-md-5">
										<div class="item-media cover-image" style="background-image: url(&quot;images/gallery/15.jpg&quot;);">
											<img src="images/gallery/15.jpg" alt="img">
											<div class="media-links">
												<a class="abs-link" title="" href="event-single-left.html"></a>
											</div>
										</div>  
									</div>
									<div class="col-xl-8 col-lg-7 col-md-7">
										<div style="margin:0px">
											
										</div>
									</div>*/
	
	 
})