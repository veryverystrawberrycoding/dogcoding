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
	<link rel="stylesheet" href="${path}/resources/css/userCSS/0joo.css" class="color-switcher-link">
	<script src="../resources/js/vendor/modernizr-custom.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js" type="text/javascript"></script>
	<script src="${path}/resources/js/userJS/dogface.js"></script>

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


			<!-- template sections -->

			
			<!--eof topline-->
			<!-- header with two Bootstrap columns - left for logo and right for navigation and includes (search, social icons, additional links and buttons etc -->
			
			
			
			
		  <!-- header start -->
    	 <%@ include file ="/WEB-INF/views/header.jsp" %>
  
 			<!-- header end --> 

			
  


			<section id="offer" class="section-offers ls s-py-60 s-py-md-90 s-py-xl-160">
            <div class="container">
               <div class="row">
                  <div class="col-12 col-xl-8 offset-xl-2 text-center mt--5">
                    <img src="resources/images/dog.png" alt="dog">
                     <div class="mt-100 hidden-below-xl"></div>
                     <div class="mt-55 hidden-above-xl"></div>
                  </div>
                  <div class="row c-gutter-40">
                     <div class="col-xl-4 col-md-6 left">
                        <div class="media icon-special text-xl-right">
                           <div class="media-body">
                              <h5 class="links-darkgrey">
                                 <a href="service-single.html">MAP</a>
                              </h5>
                              <p>
                                 Canis certified dog trainers
                                 specialize in behavior.
                              </p>
                           </div>
                           <div class="icon-styled">
                              <img src="resources/images/icons/04.png" alt="img">
                           </div>
                        </div>
                        <div class="mt-55 hidden-below-lg"></div>
                        <div class="mt-40 hidden-above-lg"></div>
                        <div class="media icon-special mr-xl-4 text-xl-right">
                           <div class="media-body">
                              <h5 class="links-darkgrey">
                                 <a href="contact2.do">GALLERY</a>
                              </h5>
                              <p>
                                 We are recommended by
                                 veterinarians and animal
                              </p>
                           </div>
                           <div class="icon-styled">
                              <img src="resources/images/icons/05.png" alt="img">
                           </div>
                        </div>
                        <div class="mt-55 hidden-below-lg"></div>
                        <div class="mt-40 hidden-above-lg"></div>
                        <div class="media icon-special text-xl-right">
                           <div class="media-body">
                              <h5 class="links-darkgrey">
                                 <a href="service-single.html">INFO</a>
                              </h5>
                              <p>
                                 We train puppies 8 weeks and older, and adult dogs of any age.
                              </p>
                           </div>
                           <div class="icon-styled">
                              <img src="resources/images/icons/06.png" alt="img">
                           </div>
                        </div>
                     </div>
                     <div class="col-xl-4 hidden-below-xl"></div>
                     <div class="col-xl-4 col-md-6 mt-40 mt-md-0">
                        <div class="media icon-special">
                           <div class="icon-styled">
                              <img src="resources/images/icons/01.png" alt="img">
                           </div>
                           <div class="media-body">
                              <h5 class="links-darkgrey">
                                 <a href="service-single.html">FRIEND</a>
                              </h5>
                              <p>
                                 Private lessons begin with a hands-on evaluation of puppy.
                              </p>
                           </div>
                        </div>
                        <div class="mt-55 hidden-below-lg"></div>
                        <div class="mt-40 hidden-above-lg"></div>
                        <div class="media icon-special ml-xl-4">
                           <div class="icon-styled">
                              <img src="resources/images/icons/02.png" alt="img">
                           </div>
                           <div class="media-body">
                              <h5 class="links-darkgrey">
                                 <a href="service-single.html">CHAT</a>
                              </h5>
                              <p>
                                 Canis has excellent training that can help rehabilitate dogs.
                              </p>
                           </div>
                        </div>
                        <div class="mt-55 hidden-below-lg"></div>
                        <div class="mt-40 hidden-above-lg"></div>
                        <div class="media icon-special">
                           <div class="icon-styled">
                              <img src="resources/images/icons/03.png" alt="img">
                           </div>
                           <div class="media-body">
                              <h5 class="links-darkgrey">
                                 <a href="service-single.html">FIND</a>
                              </h5>
                              <p>
                                 We use modern management, and classical counter techniques.
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
         <img src="../resources/images/photodog.png" class="mainFaceButton" id="mainFaceButton" width="60px" height="60px">
         </div>
<!-- footer start --> 
     <%@ include file ="/WEB-INF/views/footer.jsp" %>

</body>
<!-- footer end -->