<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="UTF-8">
	<title>chatpage</title> 

	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->

	<link rel="stylesheet" href="${path}/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="${path}/resources/css/animations.css">
	<link rel="stylesheet" href="${path}/resources/css/font-awesome.css">
	<link rel="stylesheet" href="${path}/resources/css/main.css" class="color-switcher-link">
	
	<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Single+Day&display=swap" rel="stylesheet">
	
	<script src="${path}/resources/js/vendor/modernizr-custom.js"></script>
  <link href="/resources/css/userCSS/start.css" rel="stylesheet" />
  
<style>

.start_items_title {
    display: block;
    font-size: 18px;
    font-weight: 600;
    color: #ffffff;
    margin-left:50px;
}
.start_items {
    position: relative;
    background-color: #00aeef;
    color: #ffffff;
    line-height: 1.8;
    word-wrap: break-word;
    border-radius: 3px;
    margin-top: 10px;
    margin-bottom: 10px;
    padding: 2%;
    padding-right: 25%;
}
.start_items_btn { 
   float: right;
    position: absolute;
    top: 50%;
    transform: translate(0, -50%);
 .small_margin {
  width:1px;
  height:10px;
}
 
   
    
}
</style>
	<!--[if lt IE 9]>
		<script src="js/vendor/html5shiv.min.js"></script>
		<script src="js/vendor/respond.min.js"></script>
		<script src="js/vendor/jquery-1.12.4.min.js"></script>
	<![endif]-->

</head>

<body>
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


			
			<!--eof topline-->
			 <!-- header start -->
    	 <%@ include file ="/WEB-INF/views/header.jsp" %>
  
 			<!-- header end --> 
		

		

		
		

		<section class="container">
		<div class="container"style="padding:50px;">
			<div class="container">
			
			<h3 class="text-left mb-35">
								Chat
							</h3>
			<!--  <button type="submit" id="contact_form_submit" name="contact_submit" class="btn btn-maincolor">방 만들기!</button>-->
				
			
				
				
				
				<div id="chat_wrap">
					<div class="start_items" sytle="margin-left:40px;">
					<span class="start_items_title"> 1:1 랜덤 채팅 </span>
					<span class="start_items_content" style="margin-left:50px;">랜덤한 상대와 1:1 채팅을 할 수 있습니다</span>
					<div class="small_margin"></div>
					<div class="start_items_btn">
					<i class="fa fa-chevron-circle-right fa-3x" aria-hidden="true" onclick="input_process('ㄱ');">
					</i>
					</div>
					</div>		
					
					<div class="start_items">
					<span class="start_items_title"> 방 채팅 </span>
					<span class="start_items_content" style="margin-left:50px;">채팅방을 만들어 여러 사람과 함께 채팅을 할 수 있습니다</span>
					<div class="small_margin"></div>
					<div class="start_items_btn"  >
					<i class=  "fa fa-chevron-circle-right fa-3x" aria-hidden="true" id="chat_list" >
					</i>
					</div>
					</div>		
				
						
				</div>
				</div>
				
			

						
							
						

				</div>
			</section>
			
  <!--   -------------------------------------------------------------------------------------------------- -->
	
<!-- footer start --> 
     <%@ include file ="/WEB-INF/views/footer.jsp" %>

</body>
<!-- footer end -->

</html>