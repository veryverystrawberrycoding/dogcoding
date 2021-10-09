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

	<style>
	.my_gal_list div{
		margin : 0 0 10px 0;
		padding: 10px;
	}

	#myGal.item-content{
		padding : 0 ;
	}
	
	.my_galre_list div{
		margin : 0 0 10px 0;
		padding: 10px;
	}
	
	</style>

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
			

			<section class="ls s-py-60 s-pt-md-90 s-py-lg-90 s-py-xl-160">
				
				<div class="container">
				<div class="row c-gutter-60">
					<main class="col-lg-7 col-xl-8 order-lg-2">
					<!-- <article class="post"> -->
						<div class="row">
									
						<!-- 	<div class="col-md-3">
							
							</div> -->
									
							<div class="col-md-6">
							<h3>Gallery 게시글</h3>
								<div class="my_gal_list">
								</div>
								<ul class="pagination gal_page">
								</ul>	 
							</div>
							
							<div class="col-md-6">
							<h3>댓글</h3>
								<div class="my_galre_list">
								</div>
								<ul class="pagination galre_page">
								 
								</ul>
								<div class="loss_alert">
								
								</div>
							</div> 
	
						</div>
				<!-- 	</article> -->
 					</main> 
 					
		 				<aside class="col-lg-3 col-xl-3 order-lg-1 mb-0">
							<div class="widget widget_categories">
								<%@ include file="./MypageCategories.jsp" %>
							</div>
						</aside>
 					</div>
 
				</div>

				<div class="row mt-30">

				</div>

							
			</section>

							

		</div>
		<%@ include file="./footer.jsp"%> 

			
		</div><!-- eof #box_wrapper -->
	</div><!-- eof #canvas -->
 

	<script src="${path}/resources/js/compressed.js"></script>
	<script src="${path}/resources/js/main.js"></script>
	<script src="${path}/resources/js/userJS/myPage.js"></script> 

</body>

</html>