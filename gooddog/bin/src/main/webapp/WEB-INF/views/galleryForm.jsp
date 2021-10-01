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

		

			<section class="ls s-py-60 s-py-md-90 s-py-xl-160 c-gutter-60">
				<div class="container">
					<div class="row">

						<main class="offset-lg-1 col-lg-10">
							<article class="ls vertical-item box-shadow content-padding post type-event status-publish format-standard has-post-thumbnail">

								<div class="item-content">
							<c:if test="${item.gal_no != null}" >
									<form action="/galleryOK?gal_no=${item.gal_no }" method="post" id="gallery_insert_form" >
							</c:if>						
									<form action="/galleryOK?gal_no=0" method="post" id="gallery_insert_form" > <!-- enctype="multipart/form-data" -->	
										<h5>Image</h5><br>
										<c:if test="${item.gal_no != null}" >
										<img src="${path}/resources/images/gallery/${item.gal_img}" width="300px" style="margin-left:35%;" alt="img" ><br><br>
										</c:if>	
										<input type="file" id="gal_img" name="gal_img" value="${item.gal_img}">
										<hr>
										<h5>Contents</h5><br>
										<textarea aria-required="true" rows="4" cols="45"  name="gal_name" id="gal_name" class="form-control" placeholder="내용을 입력하세요">${item.gal_name}</textarea>
										<br>
										<h5>Hash Tag</h5><br>
										<input type="text" name= "gal_tag" value="${item.gal_tag}" placeholder="'태그1','태그2' 형식으로 입력하세요">
										<br><br>
										
										<div class="form-group">
										<button type="submit" id="gallery_submit_button" name="gallery_submit_button" class="btn btn-maincolor" style="margin-left:35%;">Submit
										</button>
										</div>
			

										
									
									</form>


								</div>

							</article>

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

