<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<title>GoodDog_gallery_List</title>
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


<!-- 바디 -->
			<section class="ls s-py-60 s-py-md-90 s-py-xl-50 container-px-0">
				<div class="container-fluid">
					<div class="row">
					
					
					<!-- 글쓰기 버튼 -->
					<c:if test="${sessionScope.user.getUser_id() eq null}">
						<div class="gallery-btn" id="gallery-btn-nosess">
						<img src="${path}/resources/images/gallery/write.jpg" width="43px" height="43px" >
						<p>write</p>
						</div>
					</c:if>
					<c:if test="${sessionScope.user.getUser_id() ne null}">
						<div class="gallery-btn" id="gallery-btn">
						<a href="/galleryForm?gal_no=0" ><img src="${path}/resources/images/gallery/write.jpg" width="43px" height="43px" >
						<p>write</p></a>
						</div>
					</c:if>
			
					

						<div class="col-lg-12">
							<div class="row justify-content-center mt--10">
							
							<br>
							
							<form id="gallery_search_form" method="post" action="/galSearch">
								<div class="gallery-search">
									<div class="gallery-search-input">
										<input type="text" placeholder="검색어를 입력하세요" name="data" id="data">
									</div>
									
									<div class="gallery-search-button">
										<img id="gal-search-btn" src="${path}/resources/images/gallery/search.png" width="50px">
									</div>

								</div>
								<br><br><hr>
								<div class="hashtagsearch" id="hashtagsearch">
										<a class="hashTag" id="hashTag" style="cursor:pointer; border-color:#ed8e82;">Like</a>
										<a class="hashTag" id="hashTag" style="cursor:pointer; border-color:#ed8e82;">Hot</a>
										<a class="hashTag" id="hashTag" style="cursor:pointer; border-color:#ed8e82;">New</a><br><br>
								</div>
								</form>
							</div>
							
							<div id="gallist">
							
							<div class="row isotope-wrapper masonry-layout c-gutter-0" >
							
							
								<c:forEach items="${list}" var="item">
								
								<!-- 여기부터 반복 -->
								
								
								<div class=" col-xl-4 col-md-6 ">

									<div class="vertical-item item-gallery content-absolute text-center ds">
										<div class="item-media">
											<img src="${path}/resources/images/gallery/${item.gal_img }"> <!--  href="galleryView?gal_no=${item.gal_no}" -->
											<div class="media-links">
												<div class="links-wrap">
										
													<!-- <a class="link-zoom photoswipe-link" href="#"><br/>123</a> -->
													<a class="link-zoom" ><br/>${item.gal_heart }</a>
													<a class="link-anchor" title="" href="galleryView?gal_no=${item.gal_no}"><br/>click</a>
											
											 		<%-- <a class="galleryIcons" href="#"><img alt="like" src="${path}/resources/images/icons/heart-regular.svg">123</a>
											 		<a class="galleryIcons" href="galleryView"><img alt="like" src="${path}/resources/images/icons/mouse-solid.svg">1234</a> --%>
												</div>
											</div>
										</div>
										
									</div>
									
									
								</div>
								
								<!-- 여기까지 반복 -->
								
								</c:forEach>
								
								<!-- <div class="item-content gradientdarken-background">
											<h5>
												<a href="galleryView">자세히 보기</a>
											</h5>
										</div> -->
						
							<!-- .isotope-wrapper-->

						

						</div> <!-- 게시물관련 -->
						
						
						
						<c:if test="${num < page}">
							<div class="row mt-60">
								<div class="col-sm-12 text-center">
									<a class="btn btn-maincolor mb-0" id="viewmore" style="color:white">View More</a>
									<input type="hidden" value="${num}" id="num">
									<input type="hidden" value="${tag}" id="tag">
								</div>
							</div>
						</c:if>
							
						</div><!-- gallist 끝 -->

					  </div>
					  </div> <!-- row랑 짝 -->
				</div>
			
				
			</section>

		<%@ include file="./footer.jsp"%> 
		


	<script src="${path}/resources/js/compressed.js"></script>
	<script src="${path}/resources/js/main.js"></script>

</body>

</html>

