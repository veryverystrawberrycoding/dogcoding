<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<title>Mypage-DogCare</title>
	<meta charset="utf-8">

	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link rel="stylesheet" href="${path}/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="${path}/resources/css/animations.css">
	<link rel="stylesheet" href="${path}/resources/css/font-awesome.css">
	<link rel="stylesheet" href="${path}/resources/css/userCSS/main-gooddog.css" class="color-switcher-link">
  	
	<script src="${path}/resources/js/vendor/modernizr-custom.js"></script>
	
	<!-- 제이쿼리 -->
	<script src="${path}/resources/js/vendor/jquery-3.3.1.min.js"></script>

	 	
	<!-- chart.js -->
	<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.bundle.min.js"></script>
	<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
	<script src="${path}/resources/js/userJS/dogface.js"></script>



</head> 

<body>
<%@ include file="./header.jsp"%> 

<!-- 바디 -->



			<section class="ls s-py-60 s-pt-md-90 s-py-lg-90 s-py-xl-160">
				<div class="container">

					<div class="row c-gutter-60">

						<main class="col-lg-7 col-xl-8 order-lg-2">	
							<!-- 반려견 목록 -->
							<div id="totalPetList" ></div>	
							
							<!-- 반려견 추가 -->	
							<article class="post-with-author box-shadow vertical-item post type-post status-publish format-standard has-post-thumbnail">
								<div class="myDogAdd"><img src="${path}/resources/images/icons/add.png" width="30px" height="30px">&nbsp;반려견 추가하기</div>
							</article>
							
							<!-- 반려견 체중 그래프 -->
								
							<article class="post-with-author box-shadow vertical-item post type-post status-publish format-standard has-post-thumbnail">
								<div class="item-media post-thumbnail weightContainer">
									<div class="sort-period">
<!-- 										<div>
											<a class="weightGraph" href="#">
												<div class="icon-styled bg-maincolor round text-center">
													<p>일별</p>										
												</div>
											</a>
										</div> -->
										<div>									
											<a class="weightGraph" href="#">
												<div class="icon-styled bg-maincolor2 round text-center">
													<p>월별</p>										
												</div>
											</a>
										</div>
																		
						                <div>
						                    <select name="selectMonth" id="selectMonth" style="width:150px"> 
						                        <option value="0">월 선택</option>
						                        <option value="1">1월</option>
						                        <option value="2">2월</option>
						                        <option value="3">3월</option>
						                        <option value="4">4월</option>
						                        <option value="5">5월</option>
						                        <option value="6">6월</option>
						                        <option value="7">7월</option>
						                        <option value="8">8월</option>
						                        <option value="9">9월</option>
						                        <option value="10">10월</option>
						                        <option value="11">11월</option>
						                        <option value="12">12월</option>
						                    </select>
						                </div>
						               
					                </div>
					            
				 				<div class="weightInput">
				 						<div>체중 입력 </div>
				 						<div><select name="selectDog" id="selectDog"></select></div>
				 						<div><input class="weight_date" type="date"></div>
				 						<div><input class="weight_content" type="text" placeholder="kg" value=""></div>
				 						<div id="weightInsertBtn"><img alt="등록" src="${path}/resources/images/icons/add.png" style="width:30px; height:30px;"></div>
				 						<div id="weightListBtn"><img alt="목록" src="${path}/resources/images/icons/list.png" style="width:30px; height:30px;"></div>
				 						<div id="weightGraphBtn"><img alt="목록" src="${path}/resources/images/icons/fluctuation.png" style="width:30px; height:30px;"></div>
				 						
				 				</div>
				 				<div id=weightTableBox>
				 					<table id="weightTable"></table>
				 				</div>
					            <div id="graph">
					                <div>
					                    <canvas id="myChart"></canvas>
					                </div>
					            </div>
					            
							</div>
							</article><!-- #post-## -->
							<article class="po   st-with-author box-shadow vertical-item post type-post status-publish format-standard has-post-thumbnail">

							</article>
							
	
							
							
							<article class="post-with-author box-shadow vertical-item post type-post status-publish format-video has-post-thumbnail">
								<div class="item-media post-thumbnail">
									<div class="embed-responsive embed-responsive-3by2">
										<a href="https://www.youtube.com/embed/mcixldqDIEQ" class="embed-placeholder">
											<img src="images/blog/02.jpg" alt="img">
										</a>
									</div>
									<!-- <iframe width="1000" height="460" src="https://www.youtube.com/embed/mcixldqDIEQ" allowfullscreen></iframe> -->
								</div><!-- .post-thumbnail -->
								<div class="item-content">
									<div class="author-wrap">
										<div class="author-img">
											<img src="images/team/01.jpg" alt="img">
										</div>
										<span class="author-name">Richard Puckett</span>
										<span class="author-prof">Cynologist</span>
									</div>
									<header class="entry-header">
										<h3 class="entry-title">
											<a class="" href="blog-single-left.html" rel="bookmark">
												Sample post with YouTube Video
											</a>
										</h3>
										<p class="item-meta flex-wrap d-flex ">
											<a href="blog-single-left.html"><i class="fa fa-calendar color-main"></i>02.02.2018</a>
											<a href="blog-single-left.html"><i class="fa fa-user color-main"></i>admin</a>
											<a href="blog-single-left.html"><i class="fa fa-comment color-main"></i>10 comment</a>
											<a href="blog-left.html"><i class="fa fa-tags color-main"></i>image</a>
										</p>
										<p>
											Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
										</p>
									</header>
									<!-- .entry-header -->
								</div><!-- .item-content -->
							</article><!-- #post-## -->

							<article class="post-with-author box-shadow vertical-item post type-post status-publish gallery has-post-thumbnail">
								<div class="item-media post-thumbnail">

									<div class="owl-carousel" data-loop="true" data-margin="0" data-nav="false" data-dots="true" data-themeclass="entry-thumbnail-carousel" data-center="false" data-items="1" data-autoplay="true" data-responsive-xs="1" data-responsive-sm="1" data-responsive-md="1" data-responsive-lg="1">
										<div class="item">
											<img src="images/blog/03.jpg" alt="image">
										</div>
										<div class="item">
											<img src="images/blog/04.jpg" alt="image">
										</div>
										<div class="item">
											<img src="images/blog/05.jpg" alt="image">
										</div>
									</div><!-- .owl-thumbnail -->
								</div><!-- .post-thumbnail -->
								<div class="item-content">
									<div class="author-wrap">
										<div class="author-img">
											<img src="images/team/02.jpg" alt="img">
										</div>
										<span class="author-name">Lillian Roebuck</span>
										<span class="author-prof">Cynologist</span>
									</div>
									<header class="entry-header">
										<h3 class="entry-title">
											<a class="" href="blog-single-left.html" rel="bookmark">
												Sample post with Carousel
											</a>
										</h3>
										<p class="item-meta flex-wrap d-flex ">
											<a href="blog-single-left.html"><i class="fa fa-calendar color-main"></i>18.01.2018</a>
											<a href="blog-single-left.html"><i class="fa fa-user color-main"></i>admin</a>
											<a href="blog-single-left.html"><i class="fa fa-comment color-main"></i>26 comment</a>
											<a href="blog-left.html"><i class="fa fa-tags color-main"></i>image</a>
										</p>
										<p>
											Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit.
										</p>
									</header>
									<!-- .entry-header -->
								</div><!-- .item-content -->
							</article><!-- #post-## -->
<!-- 
							<article class="cover-image ds s-overlay post type-post status-publish  format-quote has-post-thumbnail">
								<div class="post-thumbnail">
									<a href="blog-single-left.html">
										<img src="images/gallery/05.jpg" alt="img">
									</a>
								</div>.post-thumbnail
								<div class="item-content">
									<header class="entry-header">
										<h3 class="entry-title">
											<a class="" href="blog-single-left.html" rel="bookmark">
												Sample post format: Status
											</a>
										</h3>
										<p class="item-meta flex-wrap d-flex justify-content-center">
											<a href="blog-single-left.html"><i class="fa fa-calendar color-main"></i>10.01.2018</a>
											<a href="blog-single-left.html"><i class="fa fa-user color-main"></i>admin</a>
											<a href="blog-left.html"><i class="fa fa-tags color-main"></i>status</a>
										</p>
										<p>
											Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim.ad minim veniam.uis nostrud exercitation.
										</p>
									</header>
								</div>
								.entry-header


							</article>#post-##

							<article class="post-with-author post box-shadow type-post vertical-item status-publish format-link">
								<div class="item-content">
									<div class="author-wrap">
										<div class="author-img">
											<img src="images/team/05.jpg" alt="img">
										</div>
										<span class="author-name">Wilbert Duke</span>
										<span class="author-prof">Dog Walker</span>
									</div>
									<header class="entry-header">
										<h3 class="entry-title">
											<a class="" href="blog-single-left.html" rel="bookmark">
												Sample post format: Link
											</a>
										</h3>
										<p class="item-meta flex-wrap d-flex ">
											<a href="blog-single-left.html"><i class="fa fa-calendar color-main"></i>28.12.2017</a>
											<a href="blog-single-left.html"><i class="fa fa-user color-main"></i>admin</a>
											<a href="blog-single-left.html"><i class="fa fa-comment color-main"></i>62 comment</a>
											<a href="blog-left.html"><i class="fa fa-tags color-main"></i>status</a>
										</p>
										<p class="links-maincolor4 mt-4">
											<a href="https://market.envato.com/">https://market.envato.com/</a>
										</p>
									</header>
									.entry-header
								</div>.item-content
							</article>#post-##

							<article class="post-with-author box-shadow  vertical-item post type-post status-publish format-chat has-post-thumbnail">
								<div class="item-media post-thumbnail">
									<a href="blog-single-left.html">
										<img src="images/blog/06.jpg" alt="img">
									</a>
								</div>.post-thumbnail
								<div class="item-content">
									<div class="author-wrap">
										<div class="author-img">
											<img src="images/team/03.jpg" alt="img">
										</div>
										<span class="author-name">Billy McArthur</span>
										<span class="author-prof">Cynologist</span>
									</div>
									<header class="entry-header">
										<h3 class="entry-title">
											<a class="" href="blog-single-left.html" rel="bookmark">
												Sample post format: Chat
											</a>
										</h3>
										<p class="item-meta flex-wrap d-flex ">
											<a href="blog-single-left.html"><i class="fa fa-calendar color-main"></i>04.01.2018</a>
											<a href="blog-single-left.html"><i class="fa fa-user color-main"></i>admin</a>
											<a href="blog-single-left.html"><i class="fa fa-comment color-main"></i>73 comment</a>
											<a href="blog-left.html"><i class="fa fa-tags color-main"></i>chat</a>
										</p>
									</header>
									.entry-header

									<div class="entry-content">
										<p> <span>Sam: </span>Fatback shankle frankfurter, ground round pork chop shank. </p>
										<p> <span>George: </span> Lorem ipsum dolor sit amet, consetetur sadipscing elitrsed diam nonumy eirmod tempor invidunt.</p>
										<p> <span>Sam: </span> Flank bresaola meatball doner landjaeger alcatra.</p>
										<p> <span>George: </span> Fatback jowl tri-tip biltong, picanha chicken meatball pork chop kevin landjaeger.</p>
									</div>.entry-content
								</div>.item-content
							</article>#post-##

							<article class="cover-image ds s-overlay post type-post status-publish format-status has-post-thumbnail">
								<div class="post-thumbnail">
									<a href="blog-single-left.html">
										<img src="images/blog/07.jpg" alt="img">
									</a>
								</div>.post-thumbnail
								<div class="item-content">
									<header class="entry-header">
										<img src="images/team/testimonials_01.jpg" class="avatar" alt="img">
										<div class="entry-meta">
											<h4>Kathy D. Grayson</h4>
											<p class="item-meta flex-wrap d-flex ">
												<a href="blog-single-left.html"><i class="fa fa-calendar color-main"></i>10.01.2018</a>
												<a href="blog-left.html"><i class="fa fa-tags color-main"></i>quote</a>
											</p>
										</div>

										.entry-meta
									</header>
									<div class="entry-content">
										<blockquote>

											<p>
												Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.
											</p>
										</blockquote>
									</div>
								</div>
								.entry-header

							</article>#post-##

							<article class="post-with-author post box-shadow type-post vertical-item status-publish format-link">
								<div class="item-content">
									<div class="author-wrap">
										<div class="author-img">
											<img src="images/team/04.jpg" alt="img">
										</div>
										<span class="author-name">Sandra Wade</span>
										<span class="author-prof">Cynologist</span>
									</div>
									<header class="entry-header">
										<h3 class="entry-title">
											<a class="" href="blog-single-left.html" rel="bookmark">
												Sample post format: Aside
											</a>
										</h3>
										<p class="item-meta flex-wrap d-flex ">
											<a href="blog-single-left.html"><i class="fa fa-calendar color-main"></i>28.12.2017</a>
											<a href="blog-left.html"><i class="fa fa-tags color-main"></i>quote</a>
											<a href="blog-left.html"><i class="fa fa-tags color-main"></i>aside</a>
										</p>
										<p>
											Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.
										</p>
									</header>
									.entry-header
								</div>.item-content
							</article>#post-## 
-->

							<div class="divider-60"></div>

							<div>
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
						</main>

						<aside class="col-lg-5 col-xl-4 order-lg-1 mb-0">

							<div class="widget widget_categories">
							<%@ include file="./MypageCategories.jsp" %>
							</div>

	
						</aside>

					</div>

				</div>
			</section>
			
			
			
			
			
			
			
		<%@ include file="./footer.jsp"%> 
		
		</div><!-- eof #box_wrapper -->
	</div><!-- eof #canvas -->


	<script src="${path}/resources/js/compressed.js"></script>
	<script src="${path}/resources/js/main.js"></script>
	<%-- <script src="${path}/resources/js/userJS/myPage.js"></script> --%>
	<script src="${path}/resources/js/userJS/mypageDogCare.js"></script>

</body>

</html>

