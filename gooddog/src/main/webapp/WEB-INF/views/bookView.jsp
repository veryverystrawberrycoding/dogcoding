<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<!--[if gt IE 8]><!-->
<html >
<!--<![endif]-->

<head>
	<title>Venator</title>
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
		<script src="${path}/resources/js/userJS/book.js"></script>


<style>

.book_items {
    display: flex;
    margin-left: 5%;
    flex-direction: row;
}
.book_items1 img {
    border-radius: 50%;
}
</style>
</head>

<body>
	<%@ include file="./header.jsp"%> 
			<!-- template sections -->

			<section class="ls s-py-30 s-py-md-10 s-py-xl-100 c-gutter-30">
				<div class="container">
					<div class="row">
						<main class="offset-lg-1 col-lg-10">
						
						
							<article class="ls vertical-item box-shadow content-padding post type-event status-publish format-standard has-post-thumbnail">
						<div class="book_buttons">
						<c:if test="${sessionScope.user.getUser_id() eq item.user_id }">
						<div class="gallery_user_buttons">
							<div class="gallery_buttons1">
							<a href="/bookForm?dic_no=${item.dic_no}">
							<img src="${path}/resources/images/gallery/edit.png" width="40px" height="40px"></a>
							</div>
							<!--  <div class="book_buttons2" id="book_buttons2">
							<a href="/bookDelete?dic_no=${item.dic_no}">
							<img src="${path}/resources/images/gallery/delete.png" width="40px" height="40px"></a>
							</div>-->
						</div>
						
					</c:if>
				</div>
					<hr>

								<div class="item-media post-thumbnail">
									<img src="${path}/resources/images/book/${item.dic_img }"  alt="img" style="width:400px">
									<hr>
									
										
								</div>
								<div class="book_items">
								<div class="book_items1">
								<a href="#"><img src="${path}/resources/images/userimg/${item.user_img}" width="40px" height="40px" >
								${item.user_nick}</a>　
								</div>
								<!-- 로그인 안 한 경우 하얀하트에 조회수만 -->
								
								<c:if test="${sessionScope.user.getUser_id() eq null}">
									<div class="book_items2">
									<img src="${path}/resources/images/book/noheart.png" width="30px" height="30px"  id="bookheart_nosess">
									<a id="bookheart_text" class="bookheart_text">${item.book_heart }</a>
									</div>
								</c:if>
								
								<!-- 로그인 한 경우 하트 동작 -->
								<c:if test="${sessionScope.user.getUser_id() ne null}">
								<div class="book_items2" id="book_items2">
									<c:if test="${userlike.userlike eq 0}">
										<img src="${path}/resources/images/book/noheart.png" width="30px" height="30px"  id="bookheart">
									</c:if>
									<c:if test="${userlike.userlike eq 1}">
										<img src="${path}/resources/images/book/heart.png" width="30px" height="30px"  id="bookheart">
									</c:if>
					
				
									<a id="bookheart_text" class="bookheart_text">${item.dic_heart }</a>
								</div>
								</c:if>
								</div>
									
								<hr>

								<div class="item-content">
									<!-- .post-thumbnail -->
									<h5>
										${item.dic_name}
									</h5>
									<h5>${item.dic_content} </h5>
									<br>
									<br>

			<!--  					<input type="hidden" id="tagItem" value="${tag}">-->	
									<div id="tagList">
									
									</div>
																
								</div>

								
							</article>
							
						
							<article>
							<div><!-- 대댓글 포함 -->

	
								<div id="comments" class="comments-area "> <!-- 대댓글 전 -->
								<div id="commentcount" class="comments-title" >
								<h4>댓글 ${count }개</h4>
								</div>
								
								<hr>
								
								<!-- 댓글쓰기란 -->
								
									<input type="hidden" value="${item.dic_no}" id="bookno">
									<input type="hidden" value="${sessionScope.user.getUser_id()}" id="userid">
								
									<!-- 로그인 하면 댓글쓰기창 보임 -->
									<c:if test="${sessionScope.user.getUser_id() ne null}">
										<div class="row">

											<div class="col-sm-12">
											<input type="hidden" value="${item.dic_no}" id="bookno">
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
									</c:if>
								<br>
								
								<div id="commentList">
								<c:forEach var="rl" items="${commentList}">
										<article class="comment-body">

											<footer class="comment-meta">
												<div class="comment-author vcard">
												
												
												<c:if test="${sessionScope.user.getUser_id() eq rl.user_id}">
													<div class="comment_delete_btn" id="comment_delete_btn">
														<img src="${path}/resources/images/gallery/delete.png" width="25px" height="25px" id="butbut">
														<input type="hidden" value="${rl.bookre_no}" id="bookreno">
													</div>
												</c:if>
													
													<img alt="img" src="${path}/resources/images/userimg/${rl.user_img}">
													<h4>${rl.user_nick }</h4>
													
													
													<p class="small-text text-left color-main4">
														${rl.bookre_date }
													</p>
													
												</div>
												
												
											</footer>
					
											<div class="comment-content">
												<p>${rl.bookre_content }</p>
											</div>
											
											<!-- .comment-content -->
										</article>
										
										
								</c:forEach>	
								</div>			
								
								
						<!-- 페이징 관련 -->
						<div id="page">
						
						<nav aria-label="Pagination">
								<ul class="pagination" style="width:400px; margin-left:30%">
									
									<li class="page-item">
										<a class="page-link" id="p_pre">
											<i class="fa fa-chevron-left" ></i>
										</a>
									</li>
									
									
									<c:forEach var="i" begin="1" end="${page}" >
									<li class="page-item">
										<a class="page-link" id="pnum">
											${i}

										</a>
									</li>
									</c:forEach>
							
								
									<li class="page-item">
										<a class="page-link" id="p_next">
											<i class="fa fa-chevron-right" ></i>
										</a>
									</li>
								
								</ul>
							</nav>

							</div>
							<!-- 페이징 관련 끝 -->
								</div>
						
								
										
							
							




								

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


	
	
	
	