<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="UTF-8">
	<title>Venator</title>

	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->

	<link rel="stylesheet" href="${path}/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="${path}/resources/css/animations.css">
	<link rel="stylesheet" href="${path}/resources/css/font-awesome.css">
<link rel="stylesheet" href="${path}/resources/css/userCSS/main-gooddog.css" class="color-switcher-link">	
	
		<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Single+Day&display=swap" rel="stylesheet">
	
	<script src="${path}/resources/js/vendor/modernizr-custom.js"></script>



<style >




</style>
	<!--[if lt IE 9]>
		<script src="js/vendor/html5shiv.min.js"></script>
		<script src="js/vendor/respond.min.js"></script>
		<script src="js/vendor/jquery-1.12.4.min.js"></script>
	<![endif]-->

</head>

<body>
<%@ include file="./header.jsp"%> 
		

	<!-- -----------------------------------------------------------------------------------------	-->	

		<section class="container" ,>
		
			<div class="row" style="padding:45px;">
			
				<div class="col-md-4" style = "text-align:center; font-size: 40px">
				
					<h5 >팔로잉</h5>
								
	 					<article class="post side-item content-padding ls box-shadow">
								<div class="row total_friend_view">
									
								</div>


							</article>		
				
				
				
				
				
				
				
				
				</div>
				<div class="col-md-4" style = "text-align:center; font-size: 45px"></div>
 				<div class="col-md-4" style = "text-align:center; font-size: 40px">
 				
 					<h5>친구 추천</h5>
 				
 								<article class="post side-item content-padding ls box-shadow">
								<div class="row total_friend_hi">
								</div>
								</article>
 				
 				
 				
 				
 				
 				
 				 
 				
 				</div>
			
			
			
			</div>
			
			</section>
 <!--  ---------------------------------------------------------------------------------------------------- --> 
		 

	 <%@ include file="./footer.jsp"%> 


		</div><!-- eof #box_wrapper -->
	</div><!-- eof #canvas -->


	<script src="${path}/resources/js/compressed.js"></script>
	<script src="${path}/resources/js/main.js"></script>
	<script src="${path}/resources/js/userJS/myPage.js"></script>
 

</body>

</html>