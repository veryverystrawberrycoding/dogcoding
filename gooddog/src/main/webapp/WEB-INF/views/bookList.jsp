<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<html class="no-js">

 
<head>
	<title>bookList</title>
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
	<link rel="stylesheet" href="${path}/resources/css/main.css" class="color-switcher-link">
	<script src="${path}/resources/js/vendor/modernizr-custom.js"></script>


<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Single+Day&display=swap" rel="stylesheet">

<style >


p{font-family: 'Single Day', cursive;
font-size:15px;
}
p.a{font-weight:900;
}



</style>





</head>

<body>
<%@ include file="./header.jsp"%> 
	

	
			<section class="page_title ls  s-py-5">
				<div class="container">
					<div class="row">
                                      <!-- 제목 -->
						<div class="col-md-12 text-center">
							<h1>강아지 백과사전</h1>
							
							<!-- 제목 밑 테그 -->
							<!-- 가운데 정렬 -->
								<ol class="breadcrumb">
								<li class="breadcrumb-item">
									<a href="./mainPage">Home</a>
								</li>
								<li class="breadcrumb-item">
									<a href="./bookList">Info</a>
								</li>
							</ol>
						</div>

					</div>
				</div>
			</section>


			<section class="ls gallery-page s-py-60 s-py-md-90 s-py-xl-160 container-px-15">
				<div class="container">
					<div class="row">

						<div class="col-lg-12">
							<div class="row justify-content-center mt--10">
								<div class="col-md-10 col-xl-8">
									<div class="filters gallery-filters small-text text-lg-right">
										<a href="#" data-filter="*" class="active selected">All</a>
										<a href="#" data-filter=".training">food</a>
										<a href="#" data-filter=".puppies">health</a>
										<a href="#" data-filter=".dogs">life</a>
										
									</div>
								</div>
							</div>

							<div class="row isotope-wrapper masonry-layout c-mb-30" data-filters=".gallery-filters">
<!--       -------------------------------------------------------------------------------  -->
				  		<c:forEach items="${list}" var="book">		
								<div class="col-md-4 life">
								
									<div class="vertical-item text-center content-padding box-shadow">
										<div class="item-media">
											<img style="width:300px; height:300px;" src="${path}/resources/images/book/${book.dic_img }" alt="img">
											
											<div class="media-links">
												<a class="abs-link" title="" href="bookView?no=${book.dic_no}"
												></a>
											</div>
										</div>
										<div class="item-content">
											<h4 class="mt-3 mb-0">
												<p> ${book.dic_name }</p>
											</h4>
											<div class="small-text mt-md-3">
												<a class="color-main" href="#">카테고리</a>
											</div>
											
										</div>
									</div>

								</div>
			 		</c:forEach> 
								

								

								
								
								

								

							</div>
							<!-- .isotope-wrapper-->

							<div class="row mt-30">
								<div class="col-sm-12 text-center">
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
							</div>

						</div>

					</div>

				</div>
			




				
			</section>
<%@ include file="./footer.jsp"%> 

		</div><!-- eof #box_wrapper -->
	</div><!-- eof #canvas -->


	<script src="${path}/resources/js/compressed.js"></script>
	<script src="${path}/resources/js/main.js"></script>


</body>

</html>