<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js">
<head>
	<title>Venator</title>
	<meta charset="utf-8">
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="../resources/css/animations.css">
	<link rel="stylesheet" href="../resources/css/font-awesome.css">
	<link rel="stylesheet" href="../resources/css/main_0joo.css" class="color-switcher-link">
	<script src="../resources/js/vendor/modernizr-custom.js"></script>


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
		<!-- 헤더넣을곳 -->
			<section class="page_title ls  s-py-5">
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
			</section>

			<section class="ls s-py-60 s-py-md-90  s-py-xl-160 c-gutter-60">
				<div class="container">
					<div class="row">
								
						<main class="col-lg-8 order-lg-2">
						<form class="woocommerce-ordering" method="get">
									<select name="orderby" class="orderby">
										<option value="menu_order" selected="selected">Default sorting</option>
										<option value="popularity">Sort by popularity</option>
										<option value="rating">Sort by average rating</option>
										<option value="date">Sort by newness</option>
										<option value="price">Sort by price: low to high</option>
										<option value="price-desc">Sort by price: high to low</option>
									</select>
								</form>
								<form class="woocommerce-ordering" method="get">
									<select name="orderby" class="orderby">
										<option value="menu_order" selected="selected">Default sorting</option>
										<option value="popularity">Sort by popularity</option>
										<option value="rating">Sort by average rating</option>
										<option value="date">Sort by newness</option>
										<option value="price">Sort by price: low to high</option>
										<option value="price-desc">Sort by price: high to low</option>
									</select>
								</form>
								<input type="text" value="검색창">
							<article class="vertical-item box-shadow post type-post status-publish format-standard has-post-thumbnail">

								<!-- .post-thumbnail -->
								<div class="item-media post-thumbnail">
									<img src="../resources/images/place/map.png" alt="img" >
									<p class="item-meta d-flex flex-wrap">
										<a>지도다</a>
									</p>
								</div>
							</article>


						</main>


<!-- 왼쪽 카테고리 -->
						<aside class="col-lg-4 order-lg-1 mb-0">

							<div class="widget widget_categories">

								<input type="button" value="장소1">
								<button>장소2</button>
								
							</div>
							<div class="col-lg-4">
									<div class="icon-box text-center">
										<div class="icon-styled fs-28">
											<i class="color-main fa fa-phone"></i>
										</div>
									</div>

							</div>
							
							

							<div class="widget widget_popular_entries">

								<h3 class="widget-title">위치목록~</h3>

								<ul class="list-unstyled">
								
								<!-- li 한덩이씩 -->
									<li class="media">
										<a class="media-image" href="blog-single-right.html">
											<img src="images/events/01.jpg" alt="img">
										</a>
										<div class="media-body">
											<h4>
												<a href="blog-single-right.html">Lorem ipsum dolor sit amet, consectetur.</a>
											</h4>
											<p class="item-meta">
												05.02.2018
											</p>
										</div>
									</li>

									<li class="media">
										<a class="media-image" href="blog-single-right.html">
											<img src="images/events/02.jpg" alt="img">
										</a>
										<div class="media-body">
											<h4>
												<a href="blog-single-right.html">Sed do eiusmod tempor incididunt.</a>
											</h4>
											<p class="item-meta">
												03.02.2018
											</p>

										</div>
									</li>

									

								</ul>
							</div>

<!-- 뉴스레터 이쁘다 -->

							<div class="box-shadow pb-40 px-40 pt-35">
								<div class="widget widget_mailchimp">

									<h3 class="widget-title">Newsletter</h3>

									<form class="signup" action="/">
										<label for="mailchimp_email">
											<span class="screen-reader-text">Subscribe:</span>
										</label>

										<input id="mailchimp_email1" name="email" type="email" class="mailchimp_email form-control" placeholder="Email Addres">

										<button type="submit" class="search-submit">
											<span class="screen-reader-text">Subscribe</span>
										</button>
										<div class="response"></div>
									</form>

								</div>
							</div>
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
											4
										</a>
									</li>
									<li class="page-item">
										<a class="page-link" href="#">
											5
										</a>
									</li>
									<li class="page-item">
										<a class="page-link" href="#">
											<i class="fa fa-chevron-right"></i>
										</a>
									</li>
								</ul>
							</nav>
							

						</aside>
						
<!-- 왼쪽 카테고리 끝 -->

					</div>

				</div>
			</section>

			<!-- 풋터 자리 -->

			<section class="page_copyright ds s-py-5">
				<div class="container border-top-color">
					<div class="row align-items-center ">
						<div class="divider-20 d-none d-lg-block"></div>
						<div class="divider-10 d-none d-md-block d-lg-none"></div>
						<div class="col-md-12 text-center">
							<p>&copy; Copyright <span class="copyright_year">2018</span> All Rights Reserved</p>
						</div>
						<div class="divider-20 d-none d-lg-block"></div>
						<div class="divider-10 d-none d-md-block d-lg-none"></div>
					</div>
				</div>
			</section>


		</div><!-- eof #box_wrapper -->
	</div><!-- eof #canvas -->


	<script src="../resources/js/compressed.js"></script>
	<script src="../resources/js/main.js"></script>


</body>

</html>