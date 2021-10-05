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

						<div class="col-md-12 text-center">
							<h1>Contacts 2 Page</h1>
							<ol class="breadcrumb">
								<li class="breadcrumb-item">
									<a href="./">Home</a>
								</li>
								<li class="breadcrumb-item">
									<a href="#">Pages</a>
								</li>
								<li class="breadcrumb-item active">
									Contacts 2 Page
								</li>
							</ol>
						</div>

					</div>
				</div>
			</section>

			

			<section class="ls s-py-60 s-py-md-90 s-py-xl-160 c-mb-20 c-gutter-60">
				<div class="container">
					<div class="row mt--5">

						<div data-animation="scaleAppear" class=" col-lg-7 animate">
							<h4 class="text-left mb-35">
								실종신고 등록
							</h4>
							<form class="contact-form c-mb-20 c-gutter-20" method="post" action="/">

								<div class="form-group has-placeholder">
									<label for="name">강아지 이름 <span class="required">*</span></label>
									<input type="text" aria-required="true" size="30" value="" name="name" id="name" class="form-control" placeholder="이름">
								</div>

								<div class="form-group has-placeholder">
									<label for="age">나이<span class="required">*</span></label>
									<input type="text" aria-required="true" size="30" value="" name="age" id="age" class="form-control" placeholder="나이">
								</div>

								<div class="form-group has-placeholder">
									<label for="gender">성별<span class="required">*</span></label>
									<input type="text" aria-required="true" size="30" value="" name="gender" id="gender" class="form-control" placeholder="성별">
								</div>

								<div class="form-group has-placeholder">
									<label for="info">특징</label>
									<textarea aria-required="true" rows="6" cols="45" name="info" id="info" class="form-control" placeholder="특징"></textarea>
								</div>

								<div class="form-group d-flex align-items-center flex-column flex-md-row mt-40">
									<button type="submit" id="contact_form_submit" name="contact_submit" class="btn btn-maincolor">등록하기
									</button>
								</div>

							</form>
						</div>

						<div class="col-lg-5 mt-40 mt-lg-0 animate" data-animation="scaleAppear">

							
							

							

							

						</div>
						<!--.col-* -->

					</div>
				</div>
				<div class="mb--25 d-none d-xl-block"></div>
				<div class="mb--20 hidden-above-xl"></div>
				<div class="mb--30 hidden-above-md"></div>
			</section>


	
			
<%@ include file="./footer.jsp"%> 

		</div><!-- eof #box_wrapper -->
	</div><!-- eof #canvas -->


	<script src="${path}/resources/js/compressed.js"></script>
	<script src="${path}/resources/js/main.js"></script>


</body>

</html>