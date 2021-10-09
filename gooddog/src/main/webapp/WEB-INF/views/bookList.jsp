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
	<link rel="stylesheet" href="${path}/resources/css/userCSS/main-gooddog.css" class="color-switcher-link">
	<link rel="stylesheet" href="${path}/resources/css/userCSS/0joo.css" class="color-switcher-link">
	<script src="https://code.jquery.com/jquery-3.6.0.js" type="text/javascript"></script>
	<script src="${path}/resources/js/vendor/modernizr-custom.js"></script>
	<script src="${path}/resources/js/userJS/bookList.js"></script>

<!-- 
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Single+Day&display=swap" rel="stylesheet">

<style >


p{font-family: 'Single Day', cursive;
font-size:15px;
}
p.a{font-weight:900;
}



</style> -->





</head>

<body>
<%@ include file="./header.jsp"%> 


			<section class="ls gallery-page s-py-60 s-py-md-90 s-py-xl-100 container-px-15">
				<div class="container">
					<div class="row">

						<div class="col-lg-12">
						
						<div class="booksearch row justify-content-center">
						<input type="text" placeholder="검색어를 입력하세요" name="data" id="data" style="width:500px;margin-right:10px">
						<img id="search-btn" src="${path}/resources/images/gallery/search.png" width="50px">
						</div>
						
						<div class="row justify-content-center mt--10">
									<div class="col-md-10 col-xl-8">
										<div class="filters gallery-filters small-text text-lg-right" style="">
											<a id="filter">all</a>
											<a id="filter">food</a>
											<a id="filter">health</a>
											<a id="filter">life</a>
											
										</div>
									</div>
								</div>
					
							
					<div id="here">
							<div class="row isotope-wrapper masonry-layout c-mb-30">
<!--       -------------------------------------------------------------------------------  -->
				
				  		<c:forEach items="${list}" var="book">		
								<div class="col-md-4 life">
								
									<div class="vertical-item text-center content-padding box-shadow">
										<div class="item-media" style="padding-top:7%">
											<img style="width:300px; height:300px;" src="${path}/resources/images/book/${book.dic_img }" alt="img">
											
											<div class="media-links">
												<a class="abs-link" title="" href="bookView?dic_no=${book.dic_no}"></a>
											</div>
										</div>
										<div class="item-content">								
												<p> ${book.dic_name }</p>
										
										</div>
								
									</div>
								</div>
			 		</c:forEach> 		

							</div>

						</div>		
								
								

								

							</div>
							

						</div>

					</div>

			




				
			</section>
<%@ include file="./footer.jsp"%> 


	<script src="${path}/resources/js/compressed.js"></script>
	<script src="${path}/resources/js/main.js"></script>


</body>

</html>