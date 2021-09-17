<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<title>GoodDog_gallery_List</title>
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

	<!--[if lt IE 9]>
		<script src="js/vendor/html5shiv.min.js"></script>
		<script src="js/vendor/respond.min.js"></script>
		<script src="js/vendor/jquery-1.12.4.min.js"></script>
	<![endif]-->

</head> 

<body>
<%@ include file="./header.jsp"%> 


			<section class="page_title ls  s-py-5">
				<div class="container">
					<div class="row">

						<div class="col-md-12 text-center">
							<h1>강아지 자랑하기</h1>
							<ol class="breadcrumb">
								<li class="breadcrumb-item">
									<a href="./mainPage">Home</a>
								</li>
								<li class="breadcrumb-item">
									<a href="./galleryList">Gallery</a>
								</li>
							</ol>
						</div>

					</div>
				</div>
			</section>
<!-- 바디 -->
			<section class="ls s-py-60 s-py-md-90 s-py-xl-160 container-px-0">
				<div class="container-fluid">
					<div class="row">

						<div class="col-lg-12">
							<div class="row justify-content-center mt--10">
								<div class="col-md-10 col-xl-8">
									<div class="filters gallery-filters small-text text-lg-right">
										<a class="hashTag" href="#" data-filter="*" class="active selected">All</a>
										<a class="hashTag" href="#" data-filter=".training">#training</a>
										<a class="hashTag" href="#" data-filter=".puppies">#puppies</a>
										<a class="hashTag" href="#" data-filter=".dogs">#dogs</a>
										<a class="hashTag" href="#" data-filter=".breeds">#breeds</a>
										<a class="hashTag" href="#" data-filter=".owners">#owners</a>
									</div>
								</div>
							</div>

							<div class="row isotope-wrapper masonry-layout c-gutter-0" data-filters=".gallery-filters">

								<c:forEach var="l" items="${list}">
								<div class=" col-xl-4 col-md-6 training">
									<div class="vertical-item item-gallery content-absolute text-center ds">
										<div class="item-media">
											<img src="${path}/resources/images/gallery/${l.gal_img }" alt="img">
											<div class="media-links">
												<div class="links-wrap">
											
													<!-- <a class="link-zoom photoswipe-link" href="#"><br/>123</a> -->
													<a class="link-zoom" href="#"><br/>${l.gal_heart }</a>
													<a class="link-anchor" title="" href="galleryView"><br/>${l.gal_cnt }</a>
											
											 		<%-- <a class="galleryIcons" href="#"><img alt="like" src="${path}/resources/images/icons/heart-regular.svg">123</a>
											 		<a class="galleryIcons" href="galleryView"><img alt="like" src="${path}/resources/images/icons/mouse-solid.svg">1234</a> --%>
												</div>
											</div>
										</div>
										<div class="item-content gradientdarken-background">
											<h5>
												<!-- <a href="galleryView">자세히 보기</a> -->
											</h5>
										</div>
									</div>
								</div>
								</c:forEach>
								

							</div>
							<!-- .isotope-wrapper-->

							<div class="row mt-60">
								<div class="col-sm-12 text-center">
									<a href="#" class="btn btn-maincolor mb-0">View More</a>
								</div>
							</div>

						</div>

					</div>

				</div>
			</section>

		<%@ include file="./footer.jsp"%> 
		
		</div><!-- eof #box_wrapper -->
	</div><!-- eof #canvas -->


	<script src="${path}/resources/js/compressed.js"></script>
	<script src="${path}/resources/js/main.js"></script>

</body>

</html>

