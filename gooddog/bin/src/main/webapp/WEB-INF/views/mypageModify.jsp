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
	<link rel="stylesheet" href="${path}/resources/css/main.css" class="color-switcher-link">
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

			<footer class="page_footer ds s-pb-35 s-pt-60 s-pb-md-70 s-pt-md-90 s-pb-xl-130 s-pt-xl-160 c-mb-20 c-gutter-30 container-px-0">

				<div class="container">
					<div class="row">
						<div class="col-lg-4 text-center text-lg-left animate" data-animation="fadeInUp">
							<div class="widget widget_twitter">
								<h3 class="widget-title">Twitter</h3>
								<div class="twitter-item">
									<div class="media">
										<div class="icon-styled color-main fs-18">
											<i class="fa fa-twitter" aria-hidden="true"></i>
										</div>
										<div class="media-body color_1">
											<p>
												Tamquam eligendi ex qui ex sea aliquam blandit has cum tacimates.
											</p>
											<a href="№">http://on.bcg.com/2enKlr7</a>
										</div>
									</div>
									<div class="media">
										<div class="icon-styled color-main fs-18">
											<i class="fa fa-twitter" aria-hidden="true"></i>
										</div>
										<div class="media-body color_1">
											<p>
												Tamquam eligendi ex qui ex sea aliquam blandit has cum tacimates.
											</p>
											<a href="№">http://on.bcg.com/2enKlr7</a>
										</div>
									</div>
								</div>
							</div>
						</div>
 
						<div class="col-lg-4 text-center text-lg-left animate" data-animation="fadeInUp">

							<div class="widget widget_icons_list">
								<h3 class="widget-title">Our Contacts</h3>

								<ul class="mb-10">
									<li class="icon-inline">
										<div class="icon-styled icon-top color-main4 fs-14">
											<i class="fa fa-map-marker"></i>
										</div>
										<p>3112 Stonecoal Road Toledo, OH 43602</p>
									</li>
									<li class="icon-inline">
										<div class="icon-styled icon-top color-main4 fs-14">
											<i class="fa fa-envelope"></i>
										</div>
										<a href="#">canis@support.com</a>
									</li>
									<li class="icon-inline">
										<div class="icon-styled icon-top color-main4 fs-14">
											<i class="fa fa-phone"></i>
										</div>
										<p>0 (800) 321 654</p>
									</li>
									<li class="icon-inline">
										<div class="icon-styled icon-top color-main4 fs-14">
											<i class="fa fa-clock-o"></i>
										</div>
										<p>Working hours: 9.00 - 20.00 </p>
									</li>
								</ul>

								<span class="social-icons">
									<a href="#" class="fa fa-twitter  rounded-icon color-bg-icon footer-icon" title="twitter"></a>
									<a href="#" class="fa fa-google  rounded-icon color-bg-icon footer-icon" title="google"></a>
									<a href="#" class="fa fa-facebook  rounded-icon color-bg-icon footer-icon" title="facebook"></a>
									<a href="#" class="fa fa-linkedin  rounded-icon color-bg-icon footer-icon" title="linkedin"></a>
								</span>
							</div>
						</div>

						<div class="col-lg-4 text-center text-lg-left animate" data-animation="fadeInUp">
							<div class="widget mb-0">

								<h3 class="widget-title">Newsletter</h3>

								<p class="color-font mb-3">
									Subscribe to our Newsletter to be updated,
									we promise not to spam.
								</p>

								<form class="signup" action="/">

									<input id="mailchimp_email" name="email" type="email" class="form-control mailchimp_email text-center text-lg-left" placeholder="Enter Email Address">

									<button type="submit" class="btn btn-maincolor mt-30">
										Subscribe
									</button>
									<div class="response"></div>
								</form>

							</div>
						</div>
					</div>
				</div>
			</footer>

			<section class="page_copyright ds s-py-5">
				<div class="container border-top-color">
					<div class="row align-items-center ">
						<div class="divider-20 d-none d-lg-block"></div>
						<div class="divider-10 d-none d-md-block d-lg-none"></div>
						<div class="col-md-12 text-center">
							<p>&copy; Copyright <span class="copyright_year">2018</span> All Rights Reserved</p>
						</div>
						<div class="divider-20 d-none d-lg-block"></div>
						<div class="divider-10 d-none d-md-block d-lg-none"></div>
					</div>
				</div>
			</section>


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