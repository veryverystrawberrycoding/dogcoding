<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>

<head>
	<title>GoodDog_main</title>
	<meta charset="utf-8">
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->

	<link rel="stylesheet" href="${path}/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="${path}/resources/css/animations.css">
	<link rel="stylesheet" href="${path}/resources/css/font-awesome.css">
	<link rel="stylesheet" href="${path}/resources/css/userCSS/main-gooddog.css" class="color-switcher-link">
	<link rel="stylesheet" href="${path}/resources/css/userCSS/0joo.css" class="color-switcher-link">
	<script src="${path}/resources/js/vendor/modernizr-custom.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js" type="text/javascript"></script>
	<script src="${path}/resources/js/userJS/dogface.js"></script>
	<script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>
    <df-messenger intent="WELCOME" chat-title="GoodDog" agent-id="4ab8c97b-8e3d-4faf-8b14-b47c3493ccd7" language-code="ko"></df-messenger>
   
</head>

<body>


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
			<section id="offer" class="section-offers ls s-py-60 s-py-md-90 s-py-xl-160">
				<div class="top-right-menu">
<!-- 					<div><a href="loginForm">로그인</a></div>
					<div><a href="joinForm">회원가입</a></div> -->
					<c:if test="${empty sessionScope.user }">
					<div id="login-header" style="display:flex;">
						<div style=margin-left:30px;><a href="loginForm">로그인</a></div>
						<div style=margin-left:30px;><a href="joinForm">회원가입</a></div>
					</div>
					</c:if>
					<c:if test="${not empty sessionScope.user}">
					<div id="login-header" style="display:flex;">

						<div style=margin-left:30px;>${user.user_nick}</div>
						<div style=margin-left:30px;><a href="mypageDogCare">마이페이지</a></div>
						<div style=margin-left:30px;><a href="logout" id="session_logout">로그아웃</a></div>

					</div> 
					</c:if>
				</div>
			
				<div class="container">				
					<div class="row">
						<div class="col-12 col-xl-8 offset-xl-2 text-center mt--5">
							<div class="mt-100 hidden-below-xl"></div>
							<div class="mt-55 hidden-above-xl"></div>
						</div>
						<div class="row c-gutter-40">
							<div class="col-xl-4 col-md-6 left">
								<div class="media icon-special text-xl-right">
									<div class="media-body">
										<h5 class="links-darkgrey">
											<a class="main-menu" href="./mapList">Map</a>
										</h5>
										<p class="explain">
											강아지 동반<br/>
											장소 찾기									 
										</p>
									</div>
									<div class="icon-styled">
										<img src="../../resources/images/icons/04.png" alt="img">
									</div>
								</div>
								<div class="mt-55 hidden-below-lg"></div>
								<div class="mt-40 hidden-above-lg"></div>
								<div class="media icon-special mr-xl-4 text-xl-right">
									<div class="media-body">
										<h5 class="links-darkgrey">
											<a class="main-menu" href="./galleryList">Gallery</a>
										</h5>
										<p class="explain">
											강아지 <br/>
											자랑하기
										</p>
									</div>
									<div class="icon-styled">
										<img src="../../resources/images/icons/05.png" alt="img">
									</div>
								</div>
								<div class="mt-55 hidden-below-lg"></div>
								<div class="mt-40 hidden-above-lg"></div>
								<div class="media icon-special text-xl-right">
									<div class="media-body">
										<h5 class="links-darkgrey">
											<a class="main-menu" href="./bookList">Info</a>
										</h5>
										<p class="explain">
											강아지 <br/>
											백과사전
										</p>
									</div>
									<div class="icon-styled">
										<img src="../../resources/images/icons/06.png" alt="img">
									</div>
								</div>
							</div>
							<div class="col-xl-4 hidden-below-xl"></div>
							<div class="col-xl-4 col-md-6 mt-40 mt-md-0">
								<div class="media icon-special">
									<div class="icon-styled">
										<img src="../../resources/images/icons/01.png" alt="img">
									</div>
									<div class="media-body">
										<h5 class="links-darkgrey">
											<a class="main-menu" href="./callingList">Friend</a>
										</h5>
										<p class="explain">
											동네 친구 <br/>
											찾기
										</p>
									</div>
								</div>
								<div class="mt-55 hidden-below-lg"></div>
								<div class="mt-40 hidden-above-lg"></div>
								<div class="media icon-special ml-xl-4">
									<div class="icon-styled">
										<img src="../../resources/images/icons/02.png" alt="img">
									</div>
									<div class="media-body">
										<h5 class="links-darkgrey">
											<a class="main-menu" href="./chat">Chat</a>
										</h5>
										<p class="explain">
											친구랑<br/>
											이야기
										</p>
									</div>
								</div>
								<div class="mt-55 hidden-below-lg"></div>
								<div class="mt-40 hidden-above-lg"></div>
								<div class="media icon-special">
									<div class="icon-styled">
										<img src="../../resources/images/icons/03.png" alt="img">
									</div>
									<div class="media-body">
										<h5 class="links-darkgrey">

											<a class="main-menu" href="./callingList">Security Program</a>

										</h5>
										<p class="explain">
											실종신고
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="mt-80 hidden-below-xl"></div>
				</div>
				


			</section>
			<div class='mainFaceButton'>
		<!--  <img src="/resources/images/robotic.png" class="mainbotButton" id="mainbotButton" width="60px" height="60px"> -->
         <img src="/resources/images/dogdog.png" class="mainFaceButton" id="mainFaceButton" width="60px" height="60px">
         </div>
     

		<%@ include file="./footer.jsp"%> 


		</div><!-- eof #box_wrapper -->
	</div><!-- eof #canvas -->

 	<script src="${path}/resources/js/compressed.js"></script>
	<script src="${path}/resources/js/main.js"></script>



</body>
</html>