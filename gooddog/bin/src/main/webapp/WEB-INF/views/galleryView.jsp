<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<title>GoodDog_gallery_View</title>
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
	<script src="https://code.jquery.com/jquery-3.6.0.js" type="text/javascript"></script>
	<script src="${path}/resources/js/userJS/gallery.js"></script>

	<!--[if lt IE 9]>
		<script src="js/vendor/html5shiv.min.js"></script>
		<script src="js/vendor/respond.min.js"></script>
		<script src="js/vendor/jquery-1.12.4.min.js"></script>
	<![endif]-->

</head> 


<body>
<%@ include file="./header.jsp"%> 

			<!-- <section class="page_title ls  s-py-5">
				<div class="container">
					<div class="row">

						<div class="col-md-12 text-center">
							<h1>강아지 자랑하기</h1>
							<ol class="breadcrumb">
								<li class="breadcrumb-item">
									<a href="./mainPage">Home</a>
								</li>
								<li class="breadcrumb-item">
									<a href="galleryList">GalleryList</a>
								</li>
							</ol>
						</div>

					</div>
				</div>
			</section> -->


			<section class="ls s-py-60 s-py-md-90 s-py-xl-160 c-gutter-60">
				<div class="container">
					<div class="row">

						<main class="offset-lg-1 col-lg-10">
							<article class="ls vertical-item box-shadow content-padding post type-event status-publish format-standard has-post-thumbnail">
								<div class="item-media post-thumbnail">
									<img src="${path}/resources/images/gallery/${item.gal_img }"  alt="img">
									<p class="item-meta d-flex flex-wrap">
										<a href="event-single-right.html"><i class="fa fa-user color-main"></i>${item.user_id }</a>
										<a href="event-single-right.html"><i class="fa fa-calendar color-main"></i>${item.gal_date }</a>
										<a href="event-single-right.html"><i class="fa fa-comment color-main"></i>${item.gal_heart }</a>
				
									</p>
								</div>
								<img src="${path}/resources/images/gallery/heart.png" width="40px" height="40px" class="galheart" id="galheart">

								<div class="item-content">
									<!-- .post-thumbnail -->
									<h4>
										${item.gal_name}
									</h4>
									<br>
									<br>

									<div class="entry-content">
										<p>
											${item.gal_tag}
										</p>

										

										


									</div>
									<!-- .entry-content -->

								</div>
								<!-- .item-content -->
							</article>


							<div id="comments" class="comments-area ">

								<h4 class="comments-title">
									Comments
								</h4>
								
								<hr>
								<!-- 댓글쓰기란 -->
								<div id="respond" class="comment-respond ms ls">
									
									<form class="contact-form c-mb-10 c-gutter-10" method="post" action="/">

										<div class="row">

											<div class="col-sm-12">

												<div class="form-group has-placeholder">
													<label for="message">Your Comment</label>

													<textarea aria-required="true" rows="4" cols="45" name="message" id="message" class="form-control" placeholder="Your Comment"></textarea>
												</div>
											</div>

										</div>

										<div class="row mt-30">

											<div class="col-sm-12 text-left">

												<div class="form-group">
													<button type="submit" id="contact_form_submit" name="contact_submit" class="btn btn-maincolor">Send Comment
													</button>
												</div>
											</div>

										</div>

									</form>
								</div>
								<br>

								<ol class="comment-list">
									<li class="comment">
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
												<!-- .comment-author -->
												<!-- .comment-metadata -->
											</footer>
											<!-- .comment-meta -->

											<div class="comment-content">
												<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
											</div>
											<!-- .comment-content -->
										</article>
										
										<!-- 대댓글 --> 
									<!-- 
										<ol class="children">
											<li class="comment">
												<article class="comment-body">
													<footer class="comment-meta">
														<div class="comment-author vcard">
															<img alt="img" src="images/team/comment_2.jpg">
															<h4>Angela R. Sanford</h4>
															<p class="small-text text-left color-main4">
																06.02.2018
															</p>
														</div>
														<div class="reply">
															<a rel="nofollow" class="comment-reply-link" href="#respond" aria-label="Reply to John Doe"><i class="fa fa-reply" aria-hidden="true"></i> reply</a>
														</div>
														.comment-author
														.comment-metadata
													</footer>
													.comment-meta

													<div class="comment-content">
														<p>Ut enim ad minim veniam, quis nostrud.</p>
													</div>
													.comment-content


												</article>
												.comment-body
											</li>
											#comment-##
										</ol>
										.children
									</li> -->

								</ol>
						


								

							</div>

						</main>

					</div>

				</div>
			</section>

		</div><!-- eof #box_wrapper -->
	</div><!-- eof #canvas -->

		<%@ include file="./footer.jsp"%> 
		
	<script src="${path}/resources/js/compressed.js"></script>
	<script src="${path}/resources/js/main.js"></script>



</body>
</html>

