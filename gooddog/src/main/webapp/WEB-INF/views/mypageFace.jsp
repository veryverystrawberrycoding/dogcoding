<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html class="no-js">
<head>
	<title>Venator</title>
	<meta charset="utf-8">
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="stylesheet" href="${path}/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="${path}/resources/css/animations.css">
	<link rel="stylesheet" href="${path}/resources/css/font-awesome.css">
	<link rel="stylesheet" href="${path}/resources/css/userCSS/main_0joo.css" class="color-switcher-link">
	<link rel="stylesheet" href="${path}/resources/css/userCSS/main-gooddog.css" class="color-switcher-link">
	<script src="https://code.jquery.com/jquery-3.6.0.js" type="text/javascript"></script>
	<script src="${path}/resources/js/vendor/modernizr-custom.js"></script>
	<script src="${path}/resources/js/userJS/dogface.js"></script>

</head>

<body>

	<!-- search modal -->
	<div class="modal" tabindex="-1" role="dialog" aria-labelledby="search_modal" id="search_modal">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<div class="widget widget_search">
			<form method="get" class="searchform search-form" action="/">
				<div class="form-group">
					<input type="text" value="" name="search" class="form-control" placeholder="Search keyword" id="modal-search-input">
				</div>
				<button type="submit" enctype="multipart/form-data"></button>
			</form>
		</div>
	</div>
	<!-- search modal 끝-->

	<!-- 시작 -->
	<div id="canvas">
		<div id="box_wrapper">
		
		

			<section class="ls s-py-60 s-py-md-90  s-py-xl-160 c-gutter-60">
				<div class="container">
					<div class="row">
								
						<main class="col-lg-8 order-lg-2">
						 
  							<!-- <form enctype="multipart/form-data"> -->
								<input type="file" maxlength="60" size="40" name="file" id="file">
								<input type="button" value="견종확인" id="facecheck">
						<!-- 	</form> -->
						<!-- <img src="../resources/images/dogface/hi.jpg" width="500px" height="500px"> -->
						
						
						<table id='replyList' border='2'>
						
		
		
						</table>
						</main>
					</div>
				</div>
			</section>





		</div><!-- eof #box_wrapper -->
	</div><!-- eof #canvas -->


	<script src="${path}/resources/js/compressed.js"></script>
	<script src="${path}/resources/js/main.js"></script>


</body>
</html>