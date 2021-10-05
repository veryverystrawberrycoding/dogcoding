<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html>

<html class="no-js">
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
	<link rel="stylesheet" href="${path}/resources/css/main.css" class="color-switcher-link">
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
							<h1>Team</h1>
							<ol class="breadcrumb">
								<li class="breadcrumb-item">
									<a href="./">Home</a>
								</li>
								<li class="breadcrumb-item">
									<a href="#">실종 신고</a>
								</li>

							</ol>
						</div>

					</div>
				</div>
			</section>
			 <!--   <a class="abs-link" title="" href="lossInsert">신고하기 </a>  -->   
<!--  --------------------------------------------- -->
			<!--  c forEach 쓰면 안나와서 일단 뺌 디비 질문사항있음 -->
			
			<section class="ls back-bg s-pb-30 s-pt-60 s-pb-md-60 s-pt-md-90 s-pb-xl-130 s-pt-xl-160 c-mb-30">
			<br>
			<div>
			<a class="abs-link" title="" href="lossInsert">신고하기 </a> 따로 수정필요
			
			 </div>
			 
			 <br>
			<div class="row isotope-wrapper masonry-layout c-mb-30" data-filters=".gallery-filters">
				

  <c:forEach items="${list}" var="loss">                    
						<div class="col-lg-4 col-md-6">


	
							<div class="team ls vertical-item content-padding text-center box-shadow">
								<div class="item-media">
									<img src="images/team/01.jpg" alt="img">
									<div class="media-links">
										<a class="abs-link" title="" href="lossView?no=${loss.loss_no}"></a>
									</div>
								</div>
								<div class="item-content">
									<h5>
										<a>
										${loss.pet_name}</a>
									</h5>

									<p class="  color-main4">
										나이:${loss.pet_age}
									</p>
									<p class="  color-main4">
										성별:${loss.pet_gender}
									</p>
									<p class="  color-main4">
										
									</p>
									<p>
										특징ㄹㅇㄴㄹㄴㅇㄹㄴ
									</p>
				

								</div>
							</div>
							
							</div>
							</c:forEach> 
							
							
						</div><!-- .col-* -->
						
			</section>

	<%@ include file="./footer.jsp"%> 

		</div><!-- eof #box_wrapper -->
	</div><!-- eof #canvas -->


	<script src="${path}/resources/js/compressed.js"></script>
	<script src="${path}/resources/js/main.js"></script>


</body>

</html>