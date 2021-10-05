<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
 
<head>
	<title>Venator</title>
	<meta charset="utf-8">
	<!--[if IE]>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<![endif]-->
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->

	<link rel="stylesheet" href="${path}/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="${path}/resources/css/animations.css">
	<link rel="stylesheet" href="${path}/resources/css/font-awesome.css">
	<link rel="stylesheet" href="${path}/resources/css/userCSS/main-gooddog.css" class="color-switcher-link">
	<link rel="stylesheet" href="${path}/resources/css/shop.css" class="color-switcher-link">
	<link rel="stylesheet" href="${path}/resources/js/vendor/jquery-3.3.1.min.js">
	<script src="${path}/resources/js/vendor/modernizr-custom.js"></script>

	<!--[if lt IE 9]>
		<script src="js/vendor/html5shiv.min.js"></script>
		<script src="js/vendor/respond.min.js"></script>
		<script src="js/vendor/jquery-1.12.4.min.js"></script>
	<![endif]-->

</head>

<body>
<%@ include file="./header.jsp" %>
 
			<section class="ls s-py-60 s-py-md-90 s-py-xl-155">
				<div class="container">
					<div class="row">
						<div class="col-lg-4">
								<ul>
									<li>
										<a href="../mypageModify">회원정보 관리</a>
									</li>
									<li> 
										<a href="../mypageDog">나의 펫 정보</a>
									</li>
									<li> 
										<a href="../list">나의 활동내역</a>
									</li>
									<li class="is-active">
										<a href="#">펫 실종신고</a>
									</li>
									<li>
										<a href="../mypageFind">친구 관리</a>
									</li>
									<li>
										<a class="logoutClick" href="../mainPage">회원탈퇴</a>
									</li>  
								</ul> 
						</div>
							
					 
						<main class="col-lg-8">
							<article>
								<div >
									<h4 style="text-align: left;">회원 정보 수정</h4><br>
								</div>
								<div> 
									<div>   
										<form action="#">
											<div id="preview3">
											<img src="${path}/resources/images/userimg/${myvo.user_img}" style="height:200px; width:200px;">
											</div> 
											<input type="file" id="modify_file" name="modify_file" accept="image/*" onchange="previewImage(this)" />
											<button type="button" id="img_modify_btn">수정하기</button> 
											<div>    
												<div><a>아이디</a></div><a>${myvo.user_id}</a>  
											</div>
											<br>
											<div> 
												<a>이름</a>
											</div>
											<a>${myvo.user_name}</a>
											<div>
											<br>
											<div>
												<div><a>생년월일</a></div>
												<a>${myvo.user_birth}</a>
											</div>
											<br>
											<div>
												<div><a>성별</a></div>
												<a>${myvo.user_gender}</a>
											</div>
											<hr>
											<h3>비밀번호 변경</h3>
											<a>현재 비밀번호</a>
											</div>
											<div>
												<input type="password" id="modify_user_pwd" name="modify_user_pwd" placeholder="********" style="width: 700px;"><a id="user_pwd_chk"></a><br><br>
											</div>
											<a>변경 할 비밀번호</a>  
											<div>
												<input type="password" id="modify_user_pwd2" name="modify_user_pwd2" placeholder="********" style="width: 700px;"><a id="user_pwd_chk2"></a><br><br>
											</div>
											<a>비밀번호 확인</a>  
											<div>
												<input type="password" id="modify_user_pwd3" name="modify_user_pwd3" placeholder="********" style="width: 700px;"><a id="user_pwd_chk2"></a><br><br>
											</div>
											<div id="modify_error"></div> 
											<br>
											<div id="modify_test">
											<button type="button" class="btn" id="pwd_modify_btn">비밀번호 변경</button>
											</div>
											<hr>
											<h3>기타 정보 변경</h3>
											<a>주소</a>
											<div> 
												<input type="text" id="sample6_address_modify" name="user_addr1" placeholder="주소" style="width:500px;" value="${myvo.user_addr}" readonly>
												<button type="button" class="btn btn-success btn-sm" id="addrClick_modify">주소입력</button><br><br>   
										
												<input type="text" id="sample6_extraAddress_modify" name="user_addr1" placeholder="주소" style="width:500px;" readonly><br><br>
											</div>
											<a>전화번호</a>
											<div>       
												<input type="tel" maxlength="11" id="user_modify_tel" name="user_modify_tel" value="${myvo.user_tel}" placeholder="연락처" style="width: 700px;"><br><br>
											</div>
											<a>닉네임</a>
											<div> 
												<input type="text" id="user_nick_modify" name="user_modify_nick" placeholder="${myvo.user_gender}" class="input-text" style="width: 550px;">&nbsp&nbsp<button type="button" class="btn btn-success btn-sm" id="user_nick_modify_click">중복확인</button><br><br>
											</div>
											<div style="float:center">  
											<button style="float:center" class="btn btn-success" type="button" id="user_modify" value="확인">확인</button>  
											</div> 
										</form>   
									</div>
								</div> 
								
							</article>

						</main>
						
					</div>

				</div>
			</section>

<%@ include file="./footer.jsp" %>


		</div><!-- eof #box_wrapper --> 
	</div><!-- eof #canvas -->


	<script src="${path}/resources/js/compressed.js"></script>
	<script src="${path}/resources/js/main.js"></script> 
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="${path}/resources/js/userJS/myPage.js"></script>
	 
	 
	<script type="text/javascript">
function previewImage(f){
 
	var file = f.files;

	// 확장자 체크
	if(!/\.(gif|jpg|jpeg|png)$/i.test(file[0].name)){
		alert('gif, jpg, png 파일만 선택해 주세요.\n\n현재 파일 : ' + file[0].name);

		// 선택한 파일 초기화
		f.outerHTML = f.outerHTML;

		document.getElementById('preview3').innerHTML = '';

	} 
	else { 

		// FileReader 객체 사용
		var reader = new FileReader();

		// 파일 읽기가 완료되었을때 실행
		reader.onload = function(rst){
			$("#preview3").empty(); 
			document.getElementById('preview3').innerHTML = '<img src="' + rst.target.result + '">';
		} 

		// 파일을 읽는다
		reader.readAsDataURL(file[0]);

	} 
}


</script>
	 
	

</body>

</html>