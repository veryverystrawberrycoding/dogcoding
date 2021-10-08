<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<html >

 
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
	<script src="https://code.jquery.com/jquery-3.6.0.js" type="text/javascript"></script>
	<script src="${path}/resources/js/userJS/book.js"></script>





<!--  <style >


p{font-family: 'Single Day', cursive;
font-size:15px;
}
p.a{font-weight:900;
}



</style>-->





</head>

<body>
<%@ include file="./header.jsp"%> 
	

	
			

			<section class="ls s-py-60 s-py-md-90 s-py-xl-50 container-px-0">
				<div class="container-fluid">
					<div class="row">
					
					
					<!-- 글쓰기 버튼 -->



						<div class="col-lg-12">
							<div class="row justify-content-center mt--10">
							
							<br>
							
							<form id="book_search_form" method="post" action="/bookSearch">
								<div class="book-search">
									<div class="book-search-input">
										<input type="text" placeholder="검색어를 입력하세요" name="data" id="data">
									</div>
									
									<div class="book-search-button">
										<img id="book-search-btn" src="${path}/resources/images/book/search.png" width="50px">
									</div>

								</div>
								<br><br><hr>
								<div class="hashtagsearch" id="hashtagsearch">
										<a class="hashTag" id="hashTag" style="cursor:pointer; border-color:#ed8e82;">음식</a>
										<a class="hashTag" id="hashTag" style="cursor:pointer; border-color:#ed8e82;">건강</a>
										<a class="hashTag" id="hashTag" style="cursor:pointer; border-color:#ed8e82;">생활</a><br><br>
								</div>
								</form>
							</div>
							
							<div id="booklist">
						

<!--       -------------------------------------------------------------------------------  -->
						<div class="row isotope-wrapper masonry-layout c-mb-30" data-filters=".gallery-filters">

				  		<c:forEach items="${list}" var="book">		
								<div class="col-md-4 life">
								
									<div class="vertical-item text-center content-padding box-shadow">
										<div class="item-media">
											<img style="width:300px; height:300px;" src="${path}/resources/images/book/${book.dic_img }" alt="img">
												
												
										<div class="media-links">												
												<div class="links-wrap">
										
													<!-- <a class="link-zoom photoswipe-link" href="#"><br/>123</a> -->
													<a class="link-zoom" ><br/>${book.dic_heart }</a>
													<a class="link-anchor" title="" href="bookView?dic_no=${book.dic_no}"><br/>click</a>
											
											 		<%-- <a class="galleryIcons" href="#"><img alt="like" src="${path}/resources/images/icons/heart-regular.svg">123</a>
											 		<a class="galleryIcons" href="galleryView"><img alt="like" src="${path}/resources/images/icons/mouse-solid.svg">1234</a> --%>
												</div>

										</div>
										<div class="item-content">
											<h4 class="mt-3 mb-0">
												<p> ${book.dic_name }</p>
											</h4>

											</div>
											
											
											
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