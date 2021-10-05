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
	<script src="${path}/resources/js/vendor/modernizr-custom.js"></script>

	<!--[if lt IE 9]>
		<script src="js/vendor/html5shiv.min.js"></script>
		<script src="js/vendor/respond.min.js"></script>
		<script src="js/vendor/jquery-1.12.4.min.js"></script>
	<![endif]-->

</head>

<body> 
<script type="text/javascript">
function previewImage1(f){
 
	var file = f.files;
 
	// 확장자 체크
	if(!/\.(gif|jpg|jpeg|png)$/i.test(file[0].name)){
		alert('gif, jpg, png 파일만 선택해 주세요.\n\n현재 파일 : ' + file[0].name);

		// 선택한 파일 초기화
		f.outerHTML = f.outerHTML;

		document.getElementById('preview2').innerHTML = '';
 
	} 
	else { 

		// FileReader 객체 사용
		var reader = new FileReader();

		// 파일 읽기가 완료되었을때 실행
		reader.onload = function(rst){
			document.getElementById('preview2').innerHTML = '<img src="' + rst.target.result + '">';
		}

		// 파일을 읽는다
		reader.readAsDataURL(file[0]);

	} 
}


</script>

<%@ include file="./header.jsp"%> 
	<!--[if lt IE 9]>
		<div class="bg-danger text-center">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/" class="color-main">upgrade your browser</a> to improve your experience.</div>
	<![endif]-->

	<div class="preloader">
		<div class="preloader_image pulse"></div>
	</div>

	<!-- search modal -->
	

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


<%@ include file="./header.jsp" %>			

			<section class="ls s-py-60 s-py-md-90 s-py-xl-120 c-mb-20 c-gutter-60">
				<div class="container">
					<div class="row mt--5 totalPetView"> 
						<div class="col-lg-3">
							<nav class="woocommerce-MyAccount-navigation">
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
							</nav>
						</div>
							<div class="col-lg-4 mt-40 mt-lg-0 animate" data-animation="scaleAppear">
								<div id="preview2">
								</div>
							</div>  
						<!--.col-* -->	 
						<div data-animation="scaleAppear" class=" col-lg-5 animate">
							
							<form id="upload-file-form" class="contact-form c-mb-20 c-gutter-20" method="post" action="/">
								<input type="file" id="dog_file" name="dog_file" accept="image/*" onchange="previewImage1(this)" />
							 	  
								<div class="form-group has-placeholder">
									<div class="form-group has-placeholder div_pet_name">이름&nbsp&nbsp<input style="height:40px; width:300px;" class="pet_input_name" type="text" placeholder="강아지 이름을 입력하세요"></div>
								</div> 
  
								<div class="form-group has-placeholder">
									<div class="form-group has-placeholder div_pet_name">나이&nbsp&nbsp<input style="height:40px; width:300px;" class="pet_input_date" type="text" placeholder="강아지 나이를 입력하세요"></div>
								</div>

								<div class="form-group has-placeholder">
									<div class="form-group has-placeholder div_pet_name">번호&nbsp&nbsp<input style="height:40px; width:300px;" class="pet_input_number" type="text" placeholder="강아지 인식번호를 입력하세요"></div>
								</div>  
								<div class="form-group has-placeholder">
									<div style="width: 650px;">
										성별&nbsp&nbsp<b>암</b>&nbsp&nbsp&nbsp<input type="radio" value="1" class="pet_input_gender" name="pet_input_gender">&nbsp&nbsp&nbsp<b>수</b>&nbsp&nbsp&nbsp<input type="radio" value="2" class="pet_input_gender" name="user_gender"><br>
									</div>
								</div>
									<div class="form-group has-placeholder">
									<div class="form-group has-placeholder div_pet_name">종족&nbsp&nbsp<input style="height:40px; width:300px;" class="pet_input_spacies" type="text" placeholder="강아지 종을 입력하세요"></div>
									</div>
								<div class="form-group d-flex-row-reverse align-items-center flex-column flex-md-row mt-40">
								<div class="container">
								<div class="row">   
									<div class='col-md-12'>
									<div style="text-align:center; right:20px; margin:0px;">
									<button  type="button" class="pet_submit_btn" name="contact_submit" class="btn btn-maincolor btn-xs" >확인
									</button> 
									</div> 
									</div>
									</div>    
								</div>  
								</div> 
								</form>
							</div>
						 
						
						
						<div class="container">
						<div class="row mt--5 totalPetList">
						
						</div>
						</div> 
							<!--  --> 
							
							 
						
							
						
						</div>

					</div>
				</div>
				<div class="mb--25 d-none d-xl-block"></div>
				<div class="mb--20 hidden-above-xl"></div>
				<div class="mb--30 hidden-above-md"></div>
			</section>



<%@ include file="./footer.jsp" %>		

		</div><!-- eof #box_wrapper -->
	</div><!-- eof #canvas -->
 
	<script src="${path}/resources/js/compressed.js"></script>
	<script src="${path}/resources/js/main.js"></script>
	<script src="${path}/resources/js/userJS/myPage.js"></script>

	<!-- Google Map Script -->
	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?callback=templateInitGoogleMap&key=AIzaSyC0pr5xCHpaTGv12l73IExOHDJisBP2FK4"></script>
	
</body>

</html> 