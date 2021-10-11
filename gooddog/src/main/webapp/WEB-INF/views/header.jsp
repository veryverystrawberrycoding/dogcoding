<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<title>header</title>
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
	<link rel="stylesheet" href="${path}/resources/css/main-gooddog.css" class="color-switcher-link">
	<script src="${path}/resources/js/vendor/modernizr-custom.js"></script>

	<!--[if lt IE 9]>
		<script src="js/vendor/html5shiv.min.js"></script>
		<script src="js/vendor/respond.min.js"></script>
		<script src="js/vendor/jquery-1.12.4.min.js"></script>
	<![endif]-->

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

			<!-- template sections -->
			<section class="page_toplogo ls s-pt-45 s-pb-40 d-none d-lg-block">
				<div class="container-fluid">
					<div class="row align-items-center">
						<div class="col-lg-3">
							<div class="">
								<a href="./mainPage" class="logo">
									<img src="${path}/resources/images/logo2.png" alt="logo">
								</a>
							</div>
						</div>
						</div>
				</div>
			</section>

<!-- header with two Bootstrap columns - left for logo and right for navigation and includes (search, social icons, additional links and buttons etc -->			
 <header class="page_header ls bg-maincolor4 main-style">
            <div class="container-fluid">
               <div class="row align-items-center">
                  <div class="col-xl-12">
                     <div class="nav-wrap header-main">
                         <img src="${path}/resources/images/logo_white.png" alt="GoodDog">
                      
                        <!-- main nav start -->
                        <nav class="top-nav">
                           <ul class="nav sf-menu">
 	
<!--                              <li class="active">
                                 <a href="index.html">Home</a>
                                 <ul>
                                    <li>
                                       <a href="index.html">MultiPage</a>
                                    </li>
                                    <li>
                                       <a href="index_static.html">Static Intro</a>
                                    </li>
                                    <li>
                                       <a href="index_singlepage.html">Single Page</a>
                                    </li>
                                 </ul>
                              </li>  -->

                              <li>
                                 <a href="mapList">Map</a>
                              </li>
                              <li>
                                <a href="friend">Friend</a>
                              </li>
                              <li>
                              	<a href="chattingPage">Chat</a>
                              </li>
                              <li>
                                 <a href="mypageDogCare">DogCare</a>
                              </li>
                              <li>
                                  <a href="galleryList">Gallery</a>
                              </li>
                               <li>
                                	 <a href="bookList">Info</a>
                              </li>
                             
                           </ul>
				
                        </nav>
                <div id="login-header">	
					<c:if test="${empty sessionScope.user }">
					<div id="login-header" style="display:flex;">
						<div style=margin-left:30px;><a href="loginForm">로그인</a></div>
						<div style=margin-left:30px;><a href="joinForm">회원가입</a></div>
					</div>
					</c:if>
					<c:if test="${not empty sessionScope.user}">
  
					<div id="login-header" style="display:flex;">
						<%-- <img src="/resources/images/profile/${user.user_img}" width="30px" height="30px"> --%>
						<div style=margin-right:30px;>${user.user_nick}</div>
						<div style=margin-right:30px;><a href="mypageModify">마이 페이지</a></div>
						<div style=margin-right:30px;><a href="/logout" id="session_logout">로그아웃</a></div>

					</div> 
					</c:if>
				</div>
                        <!-- eof main nav -->
<!--       
                  <span class="mr-5">
							<a href="#" class="search_modal_button hidden-below-xl">
								<i class="fa fa-search"></i>
							</a>
						</span> 
-->
                        
                      </div>
                  </div>
               </div>
            </div>
            
            
            
            <!-- header toggler -->
            <span class="toggle_menu"><span></span></span>
         </header>
         
		</div><!-- eof #box_wrapper -->
	</div><!-- eof #canvas -->
 <!-- header end --> 
 
	<script src="${path}/resources/js/compressed.js"></script>
	<script src="${path}/resources/js/main.js"></script>
</body>
</html>