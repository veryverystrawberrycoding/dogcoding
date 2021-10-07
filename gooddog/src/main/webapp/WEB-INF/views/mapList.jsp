<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html class="no-js">
<head>
	<title>GoodDog Map</title>
	<meta charset="utf-8">
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="stylesheet" href="${path}/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="${path}/resources/css/animations.css">
	<link rel="stylesheet" href="${path}/resources/css/font-awesome.css">
<%-- 	<link rel="stylesheet" href="${path}/resources/css/userCSS/main_0joo.css" class="color-switcher-link"> --%>
	<link rel="stylesheet" href="${path}/resources/css/userCSS/main-gooddog.css" class="color-switcher-link">
	
	<script src="${path}/resources/js/vendor/jquery-3.3.1.min.js"></script>
	<script src="${path}/resources/js/vendor/modernizr-custom.js"></script>

	
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
				<button type="submit"></button>
			</form>
		</div>
	</div>
	<!-- search modal 끝-->

	<!-- 시작 -->
	<div id="canvas">
		<div id="box_wrapper">
		
		
		<!-- 헤더넣을곳 -->
 <%@ include file ="/WEB-INF/views/header.jsp" %>

			<section class="ls s-py-60 s-py-md-90  s-py-xl-160 c-gutter-60">
				<div class="container">
					<div class="row">								
						<main class="col-lg-7 order-lg-2" id="mapList-main">
							<div class="address-box">
								<div class="select_container">
									<select name="sido" id="sido" class=""></select>
									<select name="gugun" id="gugun" class=""></select>
								</div>
							</div>

						<div class="search-box">
							<div class="place-search">							
								<input type="text" placeholder="search" class="search">
							</div>
							<div class="map-search-button">
								<img id="map-search-btn" src="${path}/resources/images/gallery/search.png" width="50px">
							</div>								
						</div>		

						<article class="vertical-item box-shadow post type-post status-publish format-standard has-post-thumbnail">

							<!-- 지도 -->
							<!-- <div> -->
							<div class="item-media post-thumbnail">
							<div id="map" style="width:100%;height:830px;"></div>
								<%-- <img src="${path}/resources/images/place/map.png" alt="img" > --%>
							</div>
						</article>


						</main>


<!-- 왼쪽 카테고리 -->
						<aside class="col-lg-5 order-lg-1 mb-0 filterNstore">
							<div class="filters place-filters">								
								<div class="icon-box text-center">
									<div>
									<a class="place-filter" href="#" data-filter="1">
										<div class="icon-styled bg-place-filter round food">
											<i class="fa fa-cutlery fa-2x"></i>											
										</div>
									</a>
									</div>
									<div>
									<p>맛집</p>
									</div>
								</div>
							
									<div class="icon-box text-center">
									<div>
									<a class="place-filter" href="#" data-filter="2">
										<div class="icon-styled bg-place-filter round hotel">
											<i class="fa fa-hotel fa-2x"></i>
										</div>
									</a>
									</div>
									<div>
										<p>숙소</p>
									</div>
								</div>					

									<div class="icon-box text-center">
									<div>
									<a class="place-filter" href="#" data-filter="3">
										<div class="icon-styled bg-place-filter round park">
											<i class="fa fa-tree fa-2x"></i>
										</div>
									</a>
									</div>
									<div>
										<p>공원</p>
									</div>
								</div>
									<div class="icon-box text-center">
									<div>
									<a class="place-filter" href="#" data-filter="4">
										<div class="icon-styled bg-place-filter round dogonly">
											<i class="fa fa-paw fa-2x"></i>
										</div>
									</a>
									</div>
									<div>
										<p>전용</p>
									</div>
								</div>
								
									<div class="icon-box text-center">
									<div>
									<a class="place-filter" href="#" data-filter="5">
										<div class="icon-styled bg-place-filter round hospital">
											<i class="fa fa-hospital-o fa-2x" style="weight:100px;"></i>
										</div>
									</a>
									</div>
									<div>
										<p>병원</p>
									</div>
								</div>

						</div>
						
							<!-- 위치 리스트 -->
							<!-- <div class="box-shadow pb-40 px-40 pt-35"> -->
							<div class="box-shadow pb-20 px-20 pt-30" id="store-box" style="height:830px">
								<div class="widget widget_mailchimp">
									<div class="store-box-title">
										<h3 class="widget-title">place list</h3>
										<div>검색결과&nbsp;:&nbsp;<p class="placeCount"></p>건</div>
									</div>
									<hr>
									
									<ul class="list-unstyled " id="place-info" >
										<!-- <div class="row isotope-wrapper" data-filters=".place-filters" id="place-info"> -->
									
										<!-- li 한덩이씩 -->
<%-- 										<c:forEach var="l" items="${mapList}">
											<li class="media" id="storebox">
												<div>
												<a class="media-image" href="mapView?place_no=${l.place_no }">
													<img src="${path }/resources/images/place/place_img/${l.place_img }">
													<img src="${path }/resources/images/place/cafe.jpg">
												</a>
												</div>

												<div class="media-body">
													<h3>
														<a class="place_name" href="mapView?place_no=${l.place_no }">&gt;${l.place_name}&nbsp;</a>
													</h3>
													<p class="item-meta">
														<span class="place_addr">&gt;${l.place_addr }&nbsp;</span>
													</p>
											</li>
										</c:forEach> --%>
										<!-- </div>	 -->
								</ul>
								<hr>
								
							<!-- 페이지  -->
							<nav aria-label="Pagination">
								<ul class="pagination" id="gdpage">
									<%-- <c:if test="${paging.prev}"> --%>
<%-- 									<li class="page-item">
										<a class="page-link" href='<c:url value="/mapList?page=${paging.startPage-1}"/>'>
											<i class="fa fa-chevron-left"></i>
										</a>
									</li> --%>
									<%-- </c:if> --%>
									
<%-- 									<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
									<li class="page-item">
										<a class="page-link" href='<c:url value="/mapList?page=${num}"/>'>
											${num}
											<span class="sr-only">(current)</span>
										</a>
									</li>
									</c:forEach> --%>
							
									<%-- <c:if test="${paging.next && paging.endPage>0}"> --%>
<%-- 									<li class="page-item">
										<a class="page-link" href='<c:url value="/mapList?page=${paging.endPage+1}"/>'>
											<i class="fa fa-chevron-right"></i>
										</a>
									</li> --%>
									<%-- </c:if> --%>
								</ul>
							</nav>

							</div>
							</div>
						
						</aside>
						
<!-- 왼쪽 카테고리 끝 -->

					</div>

				</div>
			</section>
			<!-- 풋터 자리 -->
			<%@ include file ="/WEB-INF/views/footer.jsp" %>


		</div><!-- eof #box_wrapper -->
	</div><!-- eof #canvas -->


	<script src="${path}/resources/js/compressed.js"></script>
	<script src="${path}/resources/js/main.js"></script>
	
	<!-- 추가 라이브러리 : 카카오 Maps API -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a013657f0efa1431a45a20f62e4e2bbb&libraries=services,clusterer,drawing"></script>
	<script src="${path}/resources/js/userJS/mapList.js"></script>


</body>
</html>