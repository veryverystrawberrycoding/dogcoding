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
	<title>GoodDog</title>
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
	
	<style>
	.myInfo{
		padding : 50px;
	}
	.myInfo a{
		font-size : 20px;
	}

	.myInfo input[type="text"], .myInfo input[type="password"], .myInfo input[type="tel"]{
		border-radius : 25px;
		font-size : 20px;
	
	}
	
	#preview3{
		display: flex;
		justify-content: center;
	}
	
	#preview3 img {
		border-radius: 10px;
		height : 250px;
	 }


	.flex-box {
		display: flex;
		align-items: center;
	}
	
	.confirmBtn{
		display: flex;
		justify-content: center;
	}
	.btn.btn-info{
		height : 50px;
	}
	.btn.btn-outline-info{
		margin-left: 10px;
	
		
	}
	
	
	
	</style>

</head>

<body>
<%@ include file="./header.jsp"%> 
	<!--[if lt IE 9]>
		<div class="bg-danger text-center">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/" class="color-main">upgrade your browser</a> to improve your experience.</div>
	<![endif]-->

	<div class="preloader">
		<div class="preloader_image"></div>
	</div>

	<!-- search modal -->
	<div class="modal" tabindex="-1" role="dialog" aria-labelledby="search_modal" id="search_modal">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<div class="widget widget_search">
			<form method="get" class="searchform search-form" action="/">
				<div class="form-group">
					<input type="text" value="" name="search" class="form-control" placeholder="Search keyword" id="modal-search-input">
				</div>
				<button type="submit"></button>
			</form>
		</div>
	</div>

	<!-- Unyson messages modal -->
	<div class="modal fade" tabindex="-1" role="dialog" id="messages_modal">
		<div class="fw-messages-wrap ls p-normal">
			<!-- Uncomment this UL with LI to show messages in modal popup to your user: -->
			<!--
		<ul class="list-unstyled">
			<li>Message To User</li>
		</ul>
		-->

		</div>
	</div><!-- eof .modal -->

	<!-- wrappers for visual page editor and boxed version of template -->
	<div id="canvas">
		<div id="box_wrapper">

			<!-- template sections -->

	

			<!-- header with two Bootstrap columns - left for logo and right for navigation and includes (search, social icons, additional links and buttons etc -->
			

	

 
			<section class="ls s-py-60 s-pt-md-90 s-py-lg-90 s-py-xl-160">
				<div class="container">
					<div class="row">
<!-- 						<div class="col-lg-4">
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
						</div> -->
							
					 
						<main class="col-lg-7 col-xl-8 order-lg-2">
							<article class="post-with-author box-shadow vertical-item post type-post status-publish format-standard has-post-thumbnail">
								<div class="myInfo">
								<div >
									<h3 style="text-align: left;">회원 정보 수정</h3><br>
								</div>
								<div> 
									<div>   
										<form action="#">
											<div id="preview3">
												<img src="${path}/resources/images/userimg/${myvo.user_img}" style="height:200px; width:200px;">
											</div> 
											<br>
											<div  class="flex-box">
												<input type="file" class="btn btn-outline-info" id="modify_file" name="modify_file" accept="image/*" onchange="previewImage(this)" />
												<button class="btn btn-info" type="button" id="img_modify_btn">프로필 사진 저장</button> 
											</div>
											<br>
											<div>    
												<a>아이디 : </a><a>${myvo.user_id}</a>  
											</div>
											<br>
											<div> 
												<a>이름 : </a><a>${myvo.user_name}</a>
											</div>
											
											<div>
											<br>
											<div>
												<a>생년월일 : </a><a>${myvo.user_birth}</a>
											</div>
											<br>
											<div>
												<a>성별 : </a>
												<c:if test="${myvo.user_gender==1 or myvo.user_gender==3 }">
													<a>남</a>
												</c:if>
												<c:if test="${myvo.user_gender==2 or myvo.user_gender==4 }">
													<a>여</a>
												</c:if>
											
											</div>
											<hr>
											
											<br>
											<h3>비밀번호 변경</h3>
												<br>
												<a>현재 비밀번호</a>
												</div>
												<div>
													<input type="password" id="modify_user_pwd" name="modify_user_pwd" placeholder="********" ><a id="user_pwd_chk"></a><br><br>
												</div>
												<a>변경 할 비밀번호</a>  
												<div>
													<input type="password" id="modify_user_pwd2" name="modify_user_pwd2" placeholder="********" ><a id="user_pwd_chk2"></a><br><br>
												</div>
												<a>비밀번호 확인</a>  
												<div>
													<input type="password" id="modify_user_pwd3" name="modify_user_pwd3" placeholder="********" ><a id="user_pwd_chk2"></a><br><br>
												</div>
												<div id="modify_error"></div> 
												<br>
												<div class="confirmBtn" id="modify_test">
												<button type="button" class="btn btn-info" id="pwd_modify_btn">비밀번호 변경</button>
												</div>
												<br>
												<hr>
											
											<br>
											<h3>기타 정보 변경</h3>
											<br>
												<a>주소</a>
												<div>
												<div class="flex-box"> 
													<input type="text" id="sample6_address_modify" name="user_addr1" placeholder="주소"  value="${myvo.user_addr}" readonly>
													<button type="button" class="btn btn-outline-info" id="addrClick_modify" style="width:150px">주소찾기</button><br><br>   
												</div> 
												<br> 
												<a>나머지 주소</a>
													<input type="text" id="sample6_extraAddress_modify" name="user_addr1" placeholder="주소"  readonly><br><br>
												</div>
												<a>전화번호</a> 
												<div>       
													<input type="tel" maxlength="11" id="user_modify_tel" name="user_modify_tel" value="${myvo.user_tel}" placeholder="연락처" ><br><br>
												</div>
												<a>닉네임</a>
												<div class="flex-box"> 
													<input type="text" id="user_nick_modify" name="user_modify_nick" placeholder="${myvo.user_nick}" class="input-text" ">
													<button type="button" class="btn btn-outline-info" id="user_nick_modify_click">중복확인</button><br><br>
												</div>
												<br>
												<br>
											<div class="confirmBtn">  
											<button class="btn btn-info" type="button" id="user_modify" value="확인">확인</button>  
											</div> 
										</form>   
									</div>
								</div> 
								</div>
							</article>

						</main>
						<aside class="col-lg-2 col-xl-3 order-lg-1 mb-0">
							<div class="widget widget_categories">
							<%@ include file="./MypageCategories.jsp" %>
							</div>
						</aside>
						
					</div>

				</div>
			</section>

			
		<%@ include file="./footer.jsp"%> 

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