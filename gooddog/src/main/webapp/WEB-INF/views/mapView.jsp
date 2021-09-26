<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<link rel="stylesheet" href="${path}/resources/css/userCSS/main-gooddog.css" class="color-switcher-link">
	<script src="${path}/resources/js/vendor/jquery-3.3.1.min.js"></script>
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

	<!-- eof .modal -->

	<!-- wrappers for visual page editor and boxed version of template -->
	<div id="canvas">
		<div id="box_wrapper">

			<!-- 헤더자리 -->
			<%@ include file ="/WEB-INF/views/header.jsp" %>

			<section class="ls s-py-60 s-py-md-90  s-py-xl-160 c-gutter-60">
				<div class="container">
				<div class="maplist" >
					<h4 id="place_name" class="place_name">${place.place_name }</h4>
					<p>리뷰 수:${total.total} | 만족도: ${percent} % | ${place.place_tag }</p>
				</div>
					<div class="row">

						<main class="col-lg-8">
							<article class="vertical-item box-shadow post type-post status-publish format-standard has-post-thumbnail">

								<!-- .post-thumbnail -->
								<div class="item-media post-thumbnail">
									<img src="${path}/resources/images/place/place_img/${place.place_img}" alt="업체 사진">
									<p class="item-meta d-flex flex-wrap">
										<a href="blog-single-right.html"><i class="fa fa-tags color-main"></i>${place.place_name }</a>
									</p>
								</div>


								<div class="item-content">
									<div class="entry-content">
										<h4 class="text-normal">
											리뷰 분석
										</h4><br>
										<blockquote class="hero-bg special-quote">
										
											<div class="col-md-6">		
												<c:forEach var="p" items="${prevalue}">
												<p class="progress-title">${p.pre_value} - ${p.count}개</p>
												<div class="progress">
													<div class="progress-bar bg-maincolor" role="progressbar" data-transitiongoal="${p.count}" aria-valuemin="0" aria-valuemax="${total.total}">
														<span>${p.count}</span>
													</div>
												</div>
												</c:forEach>
											</div>
								
										</blockquote>
									</div>
									<!-- .entry-content -->

								</div>
								<!-- .item-content -->
							</article>

							


							<div id="comments" class="comments-area ">
								<h4 class="comments-title">
									사용자 리뷰  ${total.total}개
								</h4>
								<c:if test="${total.total == 0}">
									<article class="noreview">
										<p class="text-center"> 리뷰가 없습니다 </p>
									</article>
								</c:if>
								<c:if test="${total.total != 0}">
									<c:forEach var="rl" items="${reviewList}">
										<article class="comment-body">
											<footer class="comment-meta">
												<div class="comment-author vcard">
													<%-- <img alt="img" src="${path}/resources/images/profile/${rl.user_img}">
													<h4>${rl.user_nick }</h4> --%>
													<p class="small-text text-left color-main4">
														${rl.pre_date }
													</p>
													
												</div>
											</footer>
											
											<div class="pre_value_img" id="pre_value_img">
											<img src="${path}/resources/images/place/${rl.pre_value}.png" style="width:30px">
											<br><br>
											</div>
					
											<div class="comment-content">
												<p>${rl.pre_content }</p>
		
											</div>
											
											<!-- .comment-content -->
										</article>
									</c:forEach>									
								</c:if>

			
										
										
							<!-- 페이징 -->
							<nav aria-label="Pagination">
								<ul class="pagination">
									<li class="page-item">
										<a class="page-link" href="#" tabindex="-1">
											<i class="fa fa-chevron-left"></i>
										</a>
									</li>
									<li class="page-item active">
										<a class="page-link" href="#">
											1
										</a>
									</li>
									<li class="page-item">
										<a class="page-link" href="#">
											2
										</a>
									</li>
									<li class="page-item">
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
							
							<!-- 페이징 끝-->
							
							<!-- 지도 -->
								<div id="respond" class="comment-respond ms ls">						
									<div id="map" style="width:100%;height:400px;"></div>
								</div>
								<!-- #respond -->

						</div>

						</main>

<!-- 사이드바 -->
						<aside class="col-lg-4 mb-0">
						
			
							<div id="accordion01" role="tablist">
								<div class="card">
									<div class="card-header" role="tab" id="collapse01_header">
										<h5>
											<a data-toggle="collapse" href="#collapse01" aria-expanded="true" aria-controls="collapse01">
												기본정보
											</a>
										</h5>
									</div>

									<div id="collapse01" class="collapse show" role="tabpanel" aria-labelledby="collapse01_header" data-parent="#accordion01">
										<div class="card-body">
											<p>주소 : <span id="place_addr" class="place_addr">${place.place_addr }</span></p>
											<p>Tel : ${place.place_tel }</p>
										</div>
									</div>
								</div>
<!-- 								<div class="card">
									<div class="card-header" role="tab" id="collapse02_header">
										<h5>
											<a class="collapsed" data-toggle="collapse" href="#collapse02" aria-expanded="false" aria-controls="collapse02">
												세부정보
											</a>
										</h5>
									</div>
									<div id="collapse02" class="collapse" role="tabpanel" aria-labelledby="collapse02_header" data-parent="#accordion01">
										<div class="card-body">
											주차가 어쩌구 소형견만 어쩌구
										</div>
									</div>
								</div> -->
								<div class="card">
									<div class="card-header" role="tab" id="collapse03_header">
										<h5>
											<a class="collapsed" data-toggle="collapse" href="#collapse03" aria-expanded="false" aria-controls="collapse03">											
												메뉴
											</a>
										</h5>
									</div>
									<div id="collapse03" class="collapse" role="tabpanel" aria-labelledby="collapse03_header" data-parent="#accordion01">
										<div class="card-body">
											${place.place_content }
										</div>
									</div>
								</div>
							</div>
						
						
						</aside>

					</div>

				</div>
			</section>

<!-- 풋터자리 -->

			<%@ include file ="/WEB-INF/views/footer.jsp" %>

		</div><!-- eof #box_wrapper -->
	</div><!-- eof #canvas -->


	<script src="${path}/resources/js/compressed.js"></script>
	<script src="${path}/resources/js/main.js"></script>
	
	<!-- 추가 라이브러리 : 카카오 Maps API -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a013657f0efa1431a45a20f62e4e2bbb&libraries=services,clusterer,drawing"></script>
	<script src="${path}/resources/js/userJS/mapView.js"></script>


</body>

</html>