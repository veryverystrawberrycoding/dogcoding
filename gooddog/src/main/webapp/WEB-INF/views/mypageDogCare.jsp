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


</head> 

<body>
<%@ include file="./header.jsp"%> 

			<section class="page_title ls  s-py-5">
				<div class="container">
					<div class="row">
						<div class="col-md-12 text-center">
							<h1>My Page</h1>
							<ol class="breadcrumb">
								<li class="breadcrumb-item">
									<a href="./mainPage">Home</a>
								</li>
								<li class="breadcrumb-item">
									<a href="./mypageDog">My Page</a>
								</li>
							</ol>
						</div>

					</div>
				</div>
			</section>
<!-- 바디 -->



			<section class="ls s-py-60 s-pt-md-90 s-py-lg-90 s-py-xl-160">
				<div class="container">

					<div class="row c-gutter-60">

						<main class="col-lg-7 col-xl-8 order-lg-2">
							<article class="post-with-author box-shadow vertical-item post type-post status-publish format-standard has-post-thumbnail">
								<div class="item-media post-thumbnail weightContainer">
									<div class="sort-period">
									<div>
										<a class="weightGraph" href="#">
											<div class="icon-styled bg-maincolor round text-center">
												<p>일별</p>										
											</div>
										</a>
									</div>
									<div>									
										<a class="weightGraph" href="#">
											<div class="icon-styled bg-maincolor2 round text-center">
												<p>월별</p>										
											</div>
										</a>
									</div>
																	
					                <div>
					                    <select name="selectMonth" id="selectMonth" style="width:150px"> 
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
					            
				 
					            <div id="graph" style="width: 80%; margin: 30px;">
					                <div>
					                    <canvas id="myChart"></canvas>
					                </div>
					            </div>
							</div>
							</article><!-- #post-## -->
							<article class="post-with-author box-shadow vertical-item post type-post status-publish format-standard has-post-thumbnail">
								<div class="item-media post-thumbnail">
<%-- 									<c:forEach var="l" items="${weightList }" >
									
										<div>${l.weight_date }<br/></div>
										<div id="weight_content">${l.weight_content }<br/></div>
									
									</c:forEach>  --%>								
								
								</div>
							</article>
							
	
							
							<article class="post-with-author box-shadow vertical-item post type-post status-publish format-standard has-post-thumbnail">
								<div class="item-media post-thumbnail">
									<a href="blog-single-left.html">
										<img src="images/blog/01.jpg" alt="img">
									</a>
								</div><!-- .post-thumbnail -->
								<div class="item-content">
									<div class="author-wrap">
										<div class="author-img">
											<img src="images/team/06.jpg" alt="img">
										</div>
										<span class="author-name">Ashely Ferrer</span>
										<span class="author-prof">Cynologist</span>
									</div>
									<header class="entry-header">
										<h3 class="entry-title">
											<a class="" href="blog-single-left.html" rel="bookmark">
												Sample post with Image
											</a>
										</h3>
										<p class="item-meta flex-wrap d-flex ">
											<a href="blog-single-left.html"><i class="fa fa-calendar color-main"></i>05.02.2018</a>
											<a href="blog-single-left.html"><i class="fa fa-user color-main"></i>admin</a>
											<a href="blog-single-left.html"><i class="fa fa-comment color-main"></i>3 comment</a>
											<a href="blog-left.html"><i class="fa fa-tags color-main"></i>image</a>
										</p>
										<p>
											Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.
										</p>
									</header>
									<!-- .entry-header -->
								</div><!-- .item-content -->
							</article><!-- #post-## -->

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

<!-- 							<div class="widget widget_apsc_widget">
								<div class="apsc-icons-wrapper clearfix apsc-theme-4">
									<div class="apsc-each-profile">
										<a class="apsc-facebook-icon clearfix" href="#">
											<div class="apsc-inner-block">
												<span class="social-icon">
													<i class="fa fa-facebook apsc-facebook"></i>
													<span class="media-name">Facebook</span>
												</span>
												<span class="apsc-count">10,500</span><span class="apsc-media-type"></span>
											</div>
										</a>
									</div>
									<div class="apsc-each-profile">
										<a class="apsc-twitter-icon clearfix" href="#">
											<div class="apsc-inner-block">
												<span class="social-icon">
													<i class="fa fa-twitter apsc-twitter"></i>
													<span class="media-name">Twitter</span>
												</span>
												<span class="apsc-count">572</span><span class="apsc-media-type"></span>
											</div>
										</a>
									</div>
									<div class="apsc-each-profile">
										<a class="apsc-google-plus-icon clearfix" href="#">
											<div class="apsc-inner-block">
												<span class="social-icon">
													<i class="apsc-google fa fa-google"></i>
													<span class="media-name">google+</span>
												</span>
												<span class="apsc-count">756</span><span class="apsc-media-type"></span>
											</div>
										</a>
									</div>
								</div>
							</div> 
-->

							<div class="widget widget_categories">

								<h3 class="widget-title">Product Categories</h3>

								<ul>
									<li class="cat-item">
										<a href="blog-right.html">Food and Treats</a>
										<ul class="children">
											<li class="cat-item">
												<a href="blog-right.html">Dry Food
												</a>
											</li>
											<li class="cat-item">
												<a href="blog-right.html">Wet Food
												</a>
											</li>
											<li class="cat-item">
												<a href="blog-right.html">Vet Food
												</a>
											</li>
										</ul>
									</li>
									<li class="cat-item">
										<a href="blog-right.html">Beds</a>
									</li>
									<li class="cat-item">
										<a href="blog-right.html">Kennels and Pens</a>
									</li>
									<li class="cat-item">
										<a href="blog-right.html">Toys</a>
									</li>
									<li class="cat-item">
										<a href="blog-right.html">Healthcare
										</a>
									</li>
								</ul>
							</div>

							<div class="widget widget_popular_entries">

								<h3 class="widget-title">Popular Posts</h3>

								<ul class="list-unstyled">
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

									<li class="media">
										<a class="media-image" href="blog-single-right.html">
											<img src="images/events/03.jpg" alt="img">
										</a>
										<div class="media-body">
											<h4>
												<a href="blog-single-right.html">Ut enim ad minim veniam.</a>
											</h4>
											<p class="item-meta">
												01.02.2018
											</p>

										</div>
									</li>

								</ul>
							</div>

							<div class="widget widget_instagram">
								<h3 class="widget-title">Instagram</h3>
								<div class="instafeed"></div>
							</div>

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


							<div class="widget widget_calendar">

								<div id="calendar_wrap" class="calendar_wrap">
									<table id="wp-calendar">
										<caption>February 2018</caption>
										<thead>
											<tr>
												<th scope="col" title="Monday">sun</th>
												<th scope="col" title="Tuesday">mon</th>
												<th scope="col" title="Wednesday">tue</th>
												<th scope="col" title="Thursday">wed</th>
												<th scope="col" title="Friday">thu</th>
												<th scope="col" title="Saturday">fri</th>
												<th scope="col" title="Sunday">sat</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td colspan="1" class="pad">31</td>
												<td>1</td>
												<td>2</td>
												<td>3</td>
												<td>4</td>
												<td>
													<a href="blog-right.html" aria-label="Posts published on January 5, 2017">5</a>
												</td>
												<td>6</td>
											</tr>
											<tr>
												<td>7</td>
												<td>8</td>
												<td>
													<a href="blog-right.html" aria-label="Posts published on January 9, 2017">9</a>
												</td>
												<td>
													<a href="blog-right.html" aria-label="Posts published on January 10, 2017">10</a>
												</td>
												<td>
													<a href="blog-right.html" aria-label="Posts published on January 11, 2017">11</a>
												</td>
												<td>12</td>
												<td>13</td>
											</tr>
											<tr>
												<td>14</td>
												<td>15</td>
												<td>16</td>
												<td>17</td>
												<td>18</td>
												<td>19</td>
												<td>20</td>
											</tr>
											<tr>
												<td>21</td>
												<td>22</td>
												<td>23</td>
												<td>24</td>
												<td>25</td>
												<td>26</td>
												<td>27</td>
											</tr>
											<tr>
												<td>28</td>
												<td>29</td>
												<td>30</td>
												<td>31</td>
												<td colspan="1" class="pad">1</td>
												<td colspan="1" class="pad">2</td>
												<td colspan="1" class="pad">3</td>
											</tr>
										</tbody>
										<tfoot>
											<tr>
												<td colspan="3" id="prev">
													<a href="blog-right.html">« Mar</a>
												</td>
												<td class="pad">&nbsp;</td>
												<td colspan="3" id="next">
													<a href="blog-right.html">May »</a>
												</td>
											</tr>
										</tfoot>


									</table>
								</div>
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
	<script src="${path}/resources/js/userJS/mypageDogCare.js"></script>

</body>

</html>

