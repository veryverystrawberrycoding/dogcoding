<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html class="no-js">
<head>
	<title>Venator</title>
	<meta charset="utf-8">
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="stylesheet" href="${path}/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="${path}/resources/css/animations.css">
	<link rel="stylesheet" href="${path}/resources/css/font-awesome.css">
	<link rel="stylesheet" href="${path}/resources/css/userCSS/0joo.css" class="color-switcher-link">
	<link rel="stylesheet" href="${path}/resources/css/userCSS/main-gooddog.css" class="color-switcher-link">
	<script src="https://code.jquery.com/jquery-3.6.0.js" type="text/javascript"></script>
	<script src="${path}/resources/js/vendor/modernizr-custom.js"></script>
	<script src="${path}/resources/js/userJS/dogface.js"></script>

</head>

<body>


	<!-- 시작 -->
	<section class="page_title ls  s-py-5" style="background-color:#D6B39B">
				<div class="container">
					<div class="row">

						<div class="col-md-12 text-center" >
							<h1>I want to know my dog's breed.</h1>
						</div>

					</div>
				</div>
	</section>

			<section class="ls s-py-60 s-py-md-90 s-py-xl-160 c-mb-20">
			
				<div class="container">
					<div class="animate" >
						<img id="about_breed" src="/resources/images/dogdog.png" width="50px" height="50px">
						<a id="about"></a>
						
						<br><br>

					</div>
					<div class="row">
					
						<div class="col-lg-12 animate mb-0" data-animation="scaleAppear">
								<div class="row">
									<div class="col-md-6">
										<div class="form-group has-placeholder">
											
											<input type="file" aria-required="true" size="40"  name="file" id="file" class="form-control text-center" maxlength="60">
										</div>
									</div>

									<div class="col-md-3">
										<div class="form-group text-center">
										<button type="button" value="견종확인" id="facecheck" name="facecheck" class="facecheck" style="background-color:#D6B39B;border:#D6B39B;padding:18px 30px 18px 30px; color:white">
										견종확인</button>
																		
										</div>
									</div>

								</div>
									<br><br><br>
						</div>
				
						
				<div id="dogfaceresult">
				
				<!-- ajax -->
				
					<!-- <div class="dogfacePlace">
					<img src="/resources/images/dogface/골든리트리버.png" width="400px" height="400px">
					</div>
					<br><br><br>
				
						
					<div class="col-lg-10 animate">
					<h2>result</h2>
					<br>
					</div>

					<div class="row c-mb-30">
						<div class="col-lg-4 animate" data-animation="pullDown">
							<div class="dogfacePlace">
							<img src="/resources/images/dogface/골든리트리버.png" width="300px" height="300px" style="align:center; border-radius:50%">
							<h4>골든리트리버</h4>
							<h4>98%</h4>
							</div>
						</div>
					
						<div class="col-lg-4 animate" data-animation="pullDown">
							<div class="dogfacePlace">		
							<img src="/resources/images/dogface/골든리트리버.png" width="300px" height="300px" style="align:center; border-radius:50%">
							<h4>골든리트리버</h4>
							<h4>98%</h4>
							</div>
						</div>
			
						<div class="col-lg-4 animate" data-animation="pullDown">
							<div class="dogfacePlace">	
							<img src="/resources/images/dogface/골든리트리버.png" width="300px" height="300px" style="align:center; border-radius:50%">
							<h4>골든리트리버</h4>
							<h4>98%</h4>
							</div>
						</div>
					</div> -->
			
					<!-- ajax 끝-->
					</div>
			
					</div>
					</div>
			
			</section>
	
	<!-- ------------------------------------------------ -->

						


						


	<script src="${path}/resources/js/compressed.js"></script>
	<script src="${path}/resources/js/main.js"></script>


</body>
</html>