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
	<link rel="stylesheet" href="${path}/resources/css/main_0joo.css" class="color-switcher-link">
	<script src="${path}/resources/js/vendor/modernizr-custom.js"></script>
</head>

<body>

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
	<!-- search modal 끝-->

	<!-- 시작 -->
	<div id="canvas">
		<div id="box_wrapper">
		
		 <%@ include file ="/WEB-INF/views/header.jsp" %>
		<!-- 헤더넣을곳 -->
<!-- 			<section class="page_title ls  s-py-5">
				<div class="container">
					<div class="row">

						<div class="col-md-12 text-center">
							<h1>동반 가능 장소 리스트</h1>
							<ol class="breadcrumb">
								<li class="breadcrumb-item">
									<a href="./">맛집, 숙소, 공원</a>
								</li>
								<li class="breadcrumb-item">
									<a href="#">애견전용시설, 병원</a>
								</li>
							</ol>
						</div>

					</div>
				</div>
			</section> -->

			<section class="ls s-py-60 s-py-md-90  s-py-xl-160 c-gutter-60">
				<div class="container">
					<div class="row">
								
						<main class="col-lg-8 order-lg-2">

						<form class="place-select" method="get">
									<select name="place-select1" class="place-select1">
										<option value="0" selected="selected">시,도 선택</option>
										<option value="1">서울</option>
										<option value="2">부산</option>
										<option value="3">대구</option>
										<option value="4">인천</option>
										<option value="5">광주</option>
									</select>
						</form>
						
						<form class="place-select" method="get">
									<select name="place-select2" class="place-select2">
										<option value="menu_order" selected="selected">구,군 선택</option>
										<option value="popularity">강남구</option>
										<option value="rating">강동구</option>
										<option value="date">강서구</option>
										<option value="price">관악구</option>
										<option value="price-desc">광진구</option>
									</select>
						</form>
								
						<div class="place-search">
						<input type="text" placeholder="검색하기 아이콘 추가하자">
						</div>
								
							<article class="vertical-item box-shadow post type-post status-publish format-standard has-post-thumbnail">

								<!-- 지도 -->
								<!-- <div> -->
								<div class="item-media post-thumbnail">
									<img src="../resources/images/place/map.png" alt="img" >
								</div>
							</article>


						</main>


<!-- 왼쪽 카테고리 -->
						<aside class="col-lg-4 order-lg-1 mb-0">

							<div class="widget widget_categories">
								<input type="button" value="맛집" class='maplist-btn'>
								<input type="button" value="숙소" class='maplist-btn'>
								<input type="button" value="공원" class='maplist-btn'>
								<input type="button" value="전용시설" class='maplist-btn'>
								<input type="button" value="동물병원" class='maplist-btn'>
							</div>
							
							<!-- 위치 리스트 -->

							<!-- <div class="box-shadow pb-40 px-40 pt-35"> -->
							<div class="box-shadow pb-50 px-50 pt-50">
								<div class="widget widget_mailchimp">
								
									<h3 class="widget-title">place list</h3>
									
									<ul class="list-unstyled">
								
								<!-- li 한덩이씩 -->
									<li class="media">
										<a class="media-image" href="blog-single-right.html">
											<img src="images/events/01.jpg" alt="img">
										</a>
										<div class="media-body">
											<h4>
												<a href="blog-single-right.html">으르렁 컹컹</a>
											</h4>
											<p class="item-meta">
												서울특별시 동작구
											</p>
										</div>
									</li>

									<li class="media">
										<a class="media-image" href="blog-single-right.html">
											<img src="images/events/02.jpg" alt="img">
										</a>
										<div class="media-body">
											<h4>
												<a href="blog-single-right.html">멍멍이 동물병원</a>
											</h4>
											<p class="item-meta">
												서울특별시 관악구
											</p>

										</div>
									</li>

								</ul>
								<hr>

							<nav aria-label="Pagination">
								<ul class="pagination">
									<li class="page-item">
										<a class="page-link" href="#" tabindex="-1">
											<i class="fa fa-chevron-left"></i>
										</a>
									</li>
									<li class="page-item">
										<a class="page-link" href="#">
											1
										</a>
									</li>
									<li class="page-item">
										<a class="page-link" href="#">
											2
										</a>
									</li>
									<li class="page-item active">
										<a class="page-link" href="#">
											3
											<span class="sr-only">(current)</span>
										</a>
									</li>
									
								
									<li class="page-item">
										<a class="page-link" href="#">
											<i class="fa fa-chevron-right"></i>
										</a>
									</li>
								</ul>
							</nav>

							</div>
							</div>
						
						</aside>
						
<!-- 왼쪽 카테고리 끝 -->

					</div>

				</div>
			</section>

			<!-- 풋터 자리 -->
			<%@ include file ="/WEB-INF/views/footer.jsp" %>


		</div><!-- eof #box_wrapper -->
	</div><!-- eof #canvas -->


	<script src="${path}/resources/js/compressed.js"></script>
	<script src="${path}/resources/js/main.js"></script>


</body>
</html>