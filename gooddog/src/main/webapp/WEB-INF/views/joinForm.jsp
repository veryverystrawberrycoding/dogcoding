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

	<!--[if lt IE 9]>
		<script src="js/vendor/html5shiv.min.js"></script>
		<script src="js/vendor/respond.min.js"></script>
		<script src="js/vendor/jquery-1.12.4.min.js"></script>
	<![endif]-->
	<style>
	
	article{
		padding : 50px; 
	}
	a {
		font-size : 20px;
		font-weight : bold;
		padding-left : 10px;
	}

	
	#user_pwd_chk{
		font-size : 16px;
		font-weight : normal;
		color : red;
		padding-left : 10px;
	}
	.profile-box{
		text-align: center;
	}
	
 	#preview_join img{
		/* border-radius: 10px; */
		height: 300px;
	} 
	
	input[type="text"], input[type="password"], input[type="tel"], input[type="number"]{
		border-radius : 25px;
		font-size : 20px;
		margin-top : 5px;
	}
	
	lable {
		margin-right: 10px;
	}
	
	.flex-row{
		display: flex;
	}
	.gender-box{
		padding-left : 10px;
		font-size : 20px;
		font-weight : normal;
	}
	
	.btn.btn-info{
		height : 50px;
	}
	.btn.btn-outline-info{
		border-radius : 25px;
		margin-left: 10px;
		height : 50px;
		
	}
	
	.confirmBtn{
		display: flex;
		justify-content: center;
	}
	</style>
</head>

 
<body>
<script type="text/javascript">
function previewImage(f){
 
	var file = f.files;

	// 확장자 체크
	if(!/\.(gif|jpg|jpeg|png)$/i.test(file[0].name)){
		alert('gif, jpg, png 파일만 선택해 주세요.\n\n현재 파일 : ' + file[0].name);

		// 선택한 파일 초기화
		f.outerHTML = f.outerHTML;

		document.getElementById('preview_join').innerHTML = '';

	} 
	else {

		// FileReader 객체 사용
		var reader = new FileReader();

		// 파일 읽기가 완료되었을때 실행
		reader.onload = function(rst){
			document.getElementById('preview_join').innerHTML = '<img src="' + rst.target.result + '">';
		}

		// 파일을 읽는다
		reader.readAsDataURL(file[0]);

	} 
}

</script>


	<!--[if lt IE 9]>
		<div class="bg-danger text-center">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/" class="color-main">upgrade your browser</a> to improve your experience.</div>
	<![endif]-->

	<div class="preloader">
		<div class="preloader_image">
		</div>
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
			
<%@ include file="./header.jsp" %>



			<section class="ls s-py-60 s-py-md-90 s-py-xl-155">
				<div class="container">
					<div class="row">
						<div class="col-lg-2">
						
						</div> 
						<main class="col-lg-8">
							<article class="post-with-author box-shadow vertical-item post type-post status-publish format-standard has-post-thumbnail">
								<div >
									<h2 style="text-align: center;">회원 가입</h2><br>
								</div>
								
								<a>프로필 사진 </a><br>
								<div class="profile-box">
									<div id="preview_join"><img alt="" src="../../resources/images/userdog/defualt.png" ></div><br>
									<input type="file" name="join_file" id="join_file" accept="image/*" onchange="previewImage(this)" />
								 </div>
								<div> 
									<br> 
									<div>  
										<form action="#"> 
											<div id="image_container"">
											
											</div>
											
											<div>
											<a>아이디</a>
											</div>  
											<div class="flex-row">
												<input type="text" id="user_id" name="user_id" placeholder="아이디" class="input-text" ><button type="button" class="btn btn-outline-info" id="idClick">중복확인</button><br><br>
											</div>
											<br>
											<div> 
											<a>비밀번호</a>
											</div>
											<div>
												<input type="password" id="user_pwd" name="user_pwd" placeholder="비밀번호"><a id="user_pwd_chk"></a>
											</div>
											<br>
											<a>비밀번호 확인</a>  
											<div>
												<input type="password" id="user_pwd2" name="user_pwd2"placeholder="비밀번호 확인" ><a id="user_pwd_chk2"></a>
											</div>
											<br>
											<a>이름</a>
											<div> 
												<input type="text" id="user_name" name="user_name" placeholder="이름" >
											</div>
											<br>
											<a>생년월일</a> 
											<div>
												<input type="number" id="user_birth" name="user_birth" style="width: 150px;" min="1900" max="2010" ><label>&nbsp;년</label>
												<input type="number" id="user_birth" name="user_birth" style="width: 100px;" min="1" max="12"><label>&nbsp;월</label>
												<input type="number" id="user_birth" name="user_birth" style="width: 100px;" min="1" max="31"><label>&nbsp;일</label>
											</div>
											<br>
											<a>성별</a>
											<div class="gender-box">
											 	<a>남</a>&nbsp&nbsp&nbsp<input type="radio" value="1" class="user_gender" name="user_gender">&nbsp&nbsp&nbsp<a>여</a>&nbsp&nbsp&nbsp<input type="radio" value="2" class="user_gender" name="user_gender"><br><br>
											</div>
											<a>주소</a>
											<div class="flex-row">
												<input type="text" id="sample6_address" name="user_addr1" placeholder="주소"  readonly>
												<button type="button" class="btn btn-outline-info" id="addrClick">주소 찾기</button><br><br>   
											</div>
											<br>
											<div>
												<input type="text" id="sample6_extraAddress" name="user_addr1" placeholder="상세 주소"  readonly><br><br>
											</div>
											<a>전화번호</a>
											<div>      
												<input maxlength="11" type="tel" id="user_tel" name="user_tel" placeholder="연락처" ><br><br>
											</div>
											<a>닉네임</a>
											<div class="flex-row"> 
												<input type="text" id="user_nick" name="user_nick" placeholder="닉네임" class="input-text" >&nbsp&nbsp<button type="button" class="btn btn-outline-info" id="nickOkay">중복확인</button><br><br>
											</div>
											<br>
											<div class="confirmBtn">
												<button style="float:center" class="btn btn-info" type="button" id="join_submit" value="확인">확인</button>  
											</div>
										</form> 
									</div>
								</div>
								
							</article>

						</main>
						<div class="col-lg-2">
						</div>
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
	
	

</body>

</html>