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
	<link rel="stylesheet" href="${path}/resources/css/main.css" class="color-switcher-link">
	
	
		<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Single+Day&display=swap" rel="stylesheet">
	
	<script src="${path}/resources/js/vendor/modernizr-custom.js"></script>



<style >


p{font-family: 'Single Day', cursive;
font-size:40px;
}
p.a{font-weight:900;
}



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
				
					<h5 >friend</h5>
								
	 					<article class="post side-item content-padding ls box-shadow">
								<div class="row">
									<div class="col-xl-4 col-lg-5 col-md-5">
										<div class="item-media cover-image" style="background-image: url(&quot;images/gallery/15.jpg&quot;);">
											<img src="images/gallery/15.jpg" alt="img">
											<div class="media-links">
												<a class="abs-link" title="" href="event-single-left.html"></a>
											</div>
										</div>
									</div>

									<div class="col-xl-8 col-lg-7 col-md-6">
										<div class="item-content">

											<p class="a">친구목록</p>
											

											
									
											
											<div style="display: inline-block; margin:0 5px; float:right;">
											<button type="button" class="btn btn-info btn-xs" style="margin-left: 12%;">추가</button> <button type="button" class="btn btn-info btn-xs" style="margin-left: 12%;">삭제</button>
											</div>
										</div>

										
									</div>

									
								</div>


							</article>		
				
				
				
				
				
				
				
				
				</div>
				<div class="col-md-4" style = "text-align:center; font-size: 45px"></div>
 				<div class="col-md-4" style = "text-align:center; font-size: 40px">
 				
 					<h5>친구 추천</h5>
 				
 								<article class="post side-item content-padding ls box-shadow">
								<div class="row">
									<div class="col-xl-4 col-lg-5 col-md-5">
										<div class="item-media cover-image" style="background-image: url(&quot;images/gallery/15.jpg&quot;);">
											<img src="images/gallery/15.jpg" alt="img">
											<div class="media-links">
												<a class="abs-link" title="" href="event-single-left.html"></a>
											</div>
										</div> 
									</div>

									<div class="col-xl-8 col-lg-7 col-md-6">
										<div style="margin:1px">
 
											<div id="fore_friend_info">
												<label style="font-size:20px">이름 :</label><label id="fore_friend_name" style="font-size:20px">a</label><br>
												<label style="font-size:20px">지역 :</label><label id="fore_friend_addr" style="font-size:20px">b</label><br> 
												<label style="font-size:20px">펫 :</label><label id="fore_friend_pet" style="font-size:20px">c</label>  
											</div>    
									
											
											<div style="display: inline-block; margin:0 5px; float:left;">
											<button type="button" class="btn btn-info btn-xs" style="margin-left: 12%;">추가</button>
											</div> 
										</div>

										
									</div>

									
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


</body>

</html>