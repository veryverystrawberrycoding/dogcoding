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
							<h1>실종신고 상세페이지 </h1>
							<ol class="breadcrumb">
								<li class="breadcrumb-item">
									<a href="./mainPage">Home</a>
								</li>
								<li class="breadcrumb-item">
									<a href="lossList">실종신고</a>
								</li>
							</ol>
						</div>

					</div>
				</div>
			</section>


			<section class="ls s-py-60 s-py-md-90 s-py-xl-160 c-gutter-60">
				<div class="container">
					<div class="row">

						<main class="offset-lg-1 col-lg-10">
							<article class="ls vertical-item box-shadow content-padding post type-event status-publish format-standard has-post-thumbnail">
								<div class="item-media post-thumbnail">
									<img src="${path}/resources/images/gallery/main-dog.jpg" alt="img">
									<p class="item-meta d-flex flex-wrap">
										<a href="event-single-right.html"><i class="fa fa-calendar color-main"></i>05.02.2018</a>
										<a href="event-single-right.html"><i class="fa fa-user color-main"></i>admin</a>
										<a href="event-single-right.html"><i class="fa fa-comment color-main"></i>8 comments</a>
									</p>
								</div>


								<div class="item-content">
									<!-- .post-thumbnail -->
									<h4>
										<a>${data.pet_name}</a>
									</h4>

									<div class="entry-content">
										<p>
											
										</p>

										<p>
											나이:${data.pet_age}
										</p>

										
										<p>
											성별:${data.pet_gender}
										</p>
 
 										<p>
										특징:${data.loss_info }
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
										<!-- .comment-body -->
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
														<!-- .comment-author -->
														<!-- .comment-metadata -->
													</footer>
													<!-- .comment-meta -->

													<div class="comment-content">
														<p>Ut enim ad minim veniam, quis nostrud.</p>
													</div>
													<!-- .comment-content -->


												</article>
												<!-- .comment-body -->
											</li>
											<!-- #comment-## -->
										</ol>
										<!-- .children -->
									</li>
									<!-- #comment-## -->
									<li class="comment">
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
												<p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
													fugiat nulla pariatur. </p>
											</div>
											<!-- .comment-content -->


										</article>
										<!-- .comment-body -->
										<ol class="children">
											<li class="comment">
												<article class="comment-body">
													<footer class="comment-meta">
														<div class="comment-author vcard">
															<img alt="img" src="images/team/comment_4.jpg">
															<h4>Carl D. Armstrong</h4>
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
														<p>Excepteur sint occaecat cupidatat non proident.</p>
													</div>
													<!-- .comment-content -->


												</article>
												<!-- .comment-body -->
											</li>
											<!-- #comment-## -->
										</ol>
										<!-- .children -->
									</li>
									<!-- #comment-## -->
								</ol>
								<!-- .comment-list -->


								<div id="respond" class="comment-respond ms ls">
									<h4 id="reply-title" class="comment-reply-title">Leave the comment</h4>
									<form class="contact-form c-mb-10 c-gutter-10" method="post" action="/">

										<div class="row">

											<div class="col-xl-4">
												<div class="form-group has-placeholder">
													<label for="name">your Name <span class="required">*</span></label>
													<input type="text" aria-required="true" size="30" value="" name="name" id="name" class="form-control" placeholder="your Name">
												</div>
											</div>

											<div class="col-xl-4">
												<div class="form-group has-placeholder">
													<label for="phone">Phone<span class="required">*</span></label>

													<input type="text" aria-required="true" size="30" value="" name="phone" id="phone" class="form-control" placeholder="Phone Number">
												</div>
											</div>

											<div class="col-xl-4">
												<div class="form-group has-placeholder">
													<label for="email">email address<span class="required">*</span></label>
													<input type="email" aria-required="true" size="30" value="" name="email" id="email" class="form-control" placeholder="email Address">
												</div>
											</div>
										</div>


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
								<!-- #respond -->

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

