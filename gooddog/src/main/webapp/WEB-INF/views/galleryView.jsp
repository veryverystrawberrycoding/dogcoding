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
	<link rel="stylesheet" href="${path}/resources/css/userCSS/0joo.css" class="color-switcher-link">
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


			<section class="ls s-py-30 s-py-md-10 s-py-xl-100 c-gutter-30">
				<div class="container">
					<div class="row">
						<main class="offset-lg-1 col-lg-10">
						
						
							<article class="ls vertical-item box-shadow content-padding post type-event status-publish format-standard has-post-thumbnail">
					<%-- <c:if test="${user_id eq item.user_id }"> --%>
						<div class="gallery_buttons">
							<div class="gallery_buttons1">
							<a href="/galleryForm?gal_no=${item.gal_no}">
							<img src="${path}/resources/images/gallery/edit.png" width="40px" height="40px"></a>
							</div>
							<div class="gallery_buttons2">
							<a href="/galDelete?gal_no=${item.gal_no}">
							<img src="${path}/resources/images/gallery/delete.png" width="40px" height="40px"></a>
							</div>
						</div>
						<hr>
				<%-- 	</c:if>  --%>
								<div class="item-media post-thumbnail">
									<img src="${path}/resources/images/gallery/${item.gal_img }"  alt="img" style="width:400px">
									<hr>
									
										
								</div>
								<div class="gallery_items">
								<div class="gallery_items1">
								<a href="#"><img src="${path}/resources/images/profile/${item.user_img}" width="30px" height="30px" >
								${item.user_nick}</a>
								</div>
								<div class="gallery_items2">
								<c:if test="${userlike.userlike eq 0}">
										<img src="${path}/resources/images/gallery/noheart.png" width="30px" height="30px"  id="galheart">
								</c:if>
								<c:if test="${userlike.userlike eq 1}">
										<img src="${path}/resources/images/gallery/heart.png" width="30px" height="30px"  id="galheart">
								</c:if>
					
								
								<a id="galheart_text" class="galheart_text">${item.gal_heart }</a>
								</div>
								
								</div>
									
								<hr>

								<div class="item-content">
									<!-- .post-thumbnail -->
									<h5>
										${item.gal_name}
									</h5>
									<br>
									<br>

									<input type="hidden" id="tagItem" value="${tag}">
									<div id="tagList">
									
									</div>
																
								</div>

								
							</article>
							
						
							<article>
							<div id="comments" class="comments-area ">


								<div id="comments" class="comments-area ">
								<h4 class="comments-title">
									댓글 ${count }개
								</h4>
								<hr>
								
								<!-- 댓글쓰기란 -->
								
									
									<!-- <form  method="post" > --> <!-- action="/" -->

										<div class="row">

											<div class="col-sm-12">
											<input type="hidden" value="${item.gal_no}" id="galno">
											<input type="text" placeholder="댓글을 입력하세요" id="comment_insert"  name="comment_insert" >
											</div>
										</div>

										<div class="row mt-30">
											<div class="col-sm-12 text-left">
												<div class="form-group">
													<button type="button" id="comment_insert_btn" name="comment_insert_btn" class="btn btn-maincolor">Send Comment
													</button>
													<hr>
												</div>
											</div>
										</div>
									<!-- </form> -->
						
								<br>

								<c:forEach var="rl" items="${commentList}">
										<article class="comment-body">

											<footer class="comment-meta">
												<div class="comment-author vcard">
												
												
												<c:if test="${sessionScope.user.getUser_id() eq rl.user_id}">
													<div class="comment_delete_btn" id="comment_delete_btn">
														<img src="${path}/resources/images/gallery/delete.png" width="25px" height="25px" id="butbut">
														<input type="hidden" value="${rl.galre_no}" id="galreno">
													</div>
												</c:if>
													
													<img alt="img" src="${path}/resources/images/profile/${rl.user_img}">
													<h4>${rl.user_nick }</h4>
													
													
													<p class="small-text text-left color-main4">
														${rl.galre_date }
													</p>
													
												</div>
												
												
											</footer>
					
											<div class="comment-content">
												<p>${rl.galre_content }</p>
											</div>
											
											<!-- .comment-content -->
										</article>
										
										
								</c:forEach>									
							
								</div>

								<!-- <ol class="comment-list">
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
												.comment-author
												.comment-metadata
											</footer>
											.comment-meta

											<div class="comment-content">
												<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
											</div>
											.comment-content
										</article>
										
										대댓글 
									
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
									</li>

								</ol>
						 -->


								

							</div>
							</article>

						</main>

					</div>

				</div>
			</section>


		<%@ include file="./footer.jsp"%> 
		
	<script src="${path}/resources/js/compressed.js"></script>
	<script src="${path}/resources/js/main.js"></script>



</body>
</html>

