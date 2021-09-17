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
	<link rel="stylesheet" href="${path}/resources/css/main_0joo.css" class="color-switcher-link">
	<script src="${path}/resources/resources/js/vendor/modernizr-custom.js"></script>

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
					<h4>매장 이름</h4>
					<p>리뷰 수 | 평점 | 시설분류</p>
				</div>
					<div class="row">

						<main class="col-lg-8">
							<article class="vertical-item box-shadow post type-post status-publish format-standard has-post-thumbnail">

								<!-- .post-thumbnail -->
								<div class="item-media post-thumbnail">
									<img src="../resources/images/place/cafe.jpg" alt="img">
									<p class="item-meta d-flex flex-wrap">
										<a href="blog-single-right.html"><i class="fa fa-tags color-main"></i>매장이름</a>
									</p>
								</div>


								<div class="item-content">

									<div class="entry-content">
										<h4 class="text-normal">
											리뷰 분석
										</h4>
					

									

										<blockquote class="hero-bg special-quote">
										
									
								<div class="col-md-6">

						
									<p class="progress-title">만족</p>
									<div class="progress">
										<div class="progress-bar bg-maincolor" role="progressbar" data-transitiongoal="55" aria-valuemin="0" aria-valuemax="100">
											<span>55%</span>
										</div>
									</div>
									<p class="progress-title">보통</p>
									<div class="progress">
										<div class="progress-bar bg-maincolor2" role="progressbar" data-transitiongoal="40" aria-valuemin="0" aria-valuemax="100">
											<span>40%</span>
										</div>
									</div>
									<p class="progress-title">불만족</p>
									<div class="progress">
										<div class="progress-bar bg-maincolor3" role="progressbar" data-transitiongoal="5" aria-valuemin="0" aria-valuemax="100">
											<span>5%</span>
										</div>
									</div>
		
								</div>
										</blockquote>
									
				

										<div class="entry-meta with_tags mb-0">
											<span class="byline d-flex flex-wrap">
												<span class="widget widget_tag_cloud">
													<a href="blog-single-right.html" class="tag-cloud-link">
														플랫화이트
													</a>

													<a href="blog-single-right.html" class="tag-cloud-link">
														스콘맛집
													</a>

												</span>
											</span>
										</div>

									</div>
									<!-- .entry-content -->
								


								</div>
								<!-- .item-content -->
							</article>

							


							<div id="comments" class="comments-area ">
								<h4 class="comments-title">
									리뷰(네이버리뷰다 우리꺼는 리뷰 못 달아)
								</h4>

										<article class="comment-body">
											<footer class="comment-meta">
												<div class="comment-author vcard">
													<img alt="img" src="images/team/comment_1.jpg">
													<h4>Gabriel K. Reed</h4>
													<p class="small-text text-left color-main4">
														05.02.2018
													</p>
												</div>
												<div class="reply">
													<a rel="nofollow" class="comment-reply-link" href="#respond" aria-label="Reply to John Doe"><i class="fa fa-reply" aria-hidden="true"></i> reply</a>
												</div>
											
											</footer>
					
											<div class="comment-content">
												<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
											</div>
											<!-- .comment-content -->
										</article>
										
										
										
								
									<!-- #comment-## -->
									
										<article class="comment-body">
											<footer class="comment-meta">
												<div class="comment-author vcard">
													<img alt="img" src="images/team/comment_3.jpg">
													<h4>Thelma J. Gray</h4>
													<p class="small-text text-left color-main4">
														26.01.2018
													</p>
												</div>
												<div class="reply">
													<a rel="nofollow" class="comment-reply-link" href="#respond" aria-label="Reply to John Doe"><i class="fa fa-reply" aria-hidden="true"></i> reply</a>
												</div>
												<!-- .comment-author -->
												<!-- .comment-metadata -->
											</footer>
											<!-- .comment-meta -->

											<div class="comment-content">
												<p>리뷰 아래에 페이징 들어가야댐 </p>
											</div>
											<!-- .comment-content -->
										</article>
										
										
										<!-- 페이징 -->
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
							
							<!-- 페이징 끝-->
							
							<!-- 지도 -->
								<div id="respond" class="comment-respond ms ls">
									
									<img src="../resources/images/place/map.png">
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
											솨라리
										</div>
									</div>
								</div>
								<div class="card">
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
								</div>
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
											아메리카노 3500
											플랫화이트 4500
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


</body>

</html>