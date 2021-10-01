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
		<div class="preloader_image pulse"></div>
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
			

			<section class="ls s-py-60 s-py-md-90 s-py-xl-120 c-mb-20 c-gutter-60">
				<div class="container">
					<div class="row mt--5"> 
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

						<div class="col-lg-4 mt-40 mt-lg-0 animate">
							<article class="post side-item content-padding ls box-shadow">
								<div class="row">
									<div class="col-xl-4 col-lg-5 col-md-5">
										<div class="item-media cover-image">
											<img src="images/gallery/15.jpg" alt="img" style="width:100px; height:100px;">
											<div class="media-links">
												<a class="abs-link" title="" href="event-single-full.html"></a>
											</div>
										</div>
									</div>

									<div class="col-xl-8 col-lg-7 col-md-6">
										<div class="item-content">

											<h5>
												<a href="event-single-full.html">Training</a>
											</h5>
 
											
											<p class="mb-10">
												1234 
											</p>

											<p class="links-maincolor more"><a href="event-single-full.html">read more</a></p>

										</div>
									</div>
								</div>
							</article>
							
						</div>    
						<!--.col-* -->	 
						<div data-animation="scaleAppear" class=" col-lg-5 animate">
						
							<div style="text-align:center; margin:0px;">글제목 : </div>
							<div style="text-align:center; margin:0px;">글쓴이 : </div>
							<div style="text-align:center;"> 
							<img src="#" style="width:200px; height:200px; text-align:center;"/>
							</div>
						</div>

					</div>
				</div>
				<div class="mb--25 d-none d-xl-block"></div>
				<div class="mb--20 hidden-above-xl"></div>
				<div class="mb--30 hidden-above-md"></div>
			</section>

			<%@ include file="./footer.jsp"%> 

		</div><!-- eof #box_wrapper --> 
	</div><!-- eof #canvas -->


	<script src="${path}/resources/js/compressed.js"></script>
	<script src="${path}/resources/js/main.js"></script>


</body>

</html>