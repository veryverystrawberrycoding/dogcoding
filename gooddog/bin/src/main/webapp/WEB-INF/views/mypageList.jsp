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
			

			<section class="ls gallery-page s-py-60 s-py-md-90 s-py-xl-160 container-px-15">
				
								<div class="container"> 
									<div class="row">
								
								<div class="col-md-3">>
								
								</div>
								
								<div class="col-md-5">
								<div class="my_gal_list">
								</div>
								<ul class="pagination gal_page">
								</ul>	 
								</div>
								<div class="col-md-4">
									<div class="my_galre_list">
										
									</div>
									<ul class="pagination galre_page">
									 
									</ul>
									<div class="loss_alert">
									
									</div>
								</div> 
							</div>
 
							</div>
								<div class="row mt-30">
								<div class="col-sm-12 text-center">
									<nav class="navigation pagination " role="navigation">
										<h2 class="screen-reader-text">Posts navigation</h2>
										<div class="nav-links">
											<a class="prev page-numbers" href="blog-right.html">
												<i class="fa fa-chevron-left"></i>
												<span class="screen-reader-text">Previous page</span>
											</a>
											<span class="page-numbers current">
												<span class="meta-nav screen-reader-text">Page </span>
												1
											</span>
											<a class="page-numbers" href="blog-right.html">
												<span class="meta-nav screen-reader-text">Page </span>
												...
											</a>
											<a class="page-numbers" href="blog-right.html">
												<span class="meta-nav screen-reader-text">Page </span>
												5
											</a>
											<a class="next page-numbers" href="blog-right.html">
												<span class="screen-reader-text">Next page</span>
												<i class="fa fa-chevron-right"></i>
											</a>
										</div>
									</nav>
								</div>
						</div>
					
							
							</section>

							

							</div>
							
							
							
							
							<!-- .isotope-wrapper-->

						
		

			<%@ include file="./footer.jsp"%> 

			
		</div><!-- eof #box_wrapper -->
	</div><!-- eof #canvas -->
 

	<script src="${path}/resources/js/compressed.js"></script>
	<script src="${path}/resources/js/main.js"></script>
	<script src="${path}/resources/js/userJS/myPage.js"></script> 

</body>

</html>