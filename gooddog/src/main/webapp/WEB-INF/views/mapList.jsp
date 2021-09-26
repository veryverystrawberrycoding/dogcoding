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
		
		 <%@ include file ="/WEB-INF/views/header.jsp" %>
		<!-- 헤더넣을곳 -->
<!-- 			<section class="page_title ls  s-py-5">
				<div class="container">
					<div class="row">

						<div class="col-md-12 text-center">
							<h1>동반 가능 장소 리스트</h1>
							<ol class="breadcrumb">
								<li class="breadcrumb-item">
									<a href="./">맛집, 숙소, 공원</a>
								</li>
								<li class="breadcrumb-item">
									<a href="#">애견전용시설, 병원</a>
								</li>
							</ol>
						</div>

					</div>
				</div>
			</section> -->

			<section class="ls s-py-60 s-py-md-90  s-py-xl-160 c-gutter-60">
				<div class="container">
					<div class="row">								
						<main class="col-lg-8 order-lg-2">
						
							<select name="sido" id="sido"></select>
							<select name="gugun" id="gugun"></select>


<!-- 						<form class="place-select" method="get">
									<select name="place-select1" class="place-select1">
										<option value="0" selected="selected">시,도 선택</option>
										<option value="1">서울</option>
										<option value="2">부산</option>
										<option value="3">대구</option>
										<option value="4">인천</option>
										<option value="5">광주</option>
									</select>
						</form>
						
						<form class="place-select" method="get">
									<select name="place-select2" class="place-select2">
										<option value="menu_order" selected="selected">구,군 선택</option>
										<option value="popularity">강남구</option>
										<option value="rating">강동구</option>
										<option value="date">강서구</option>
										<option value="price">관악구</option>
										<option value="price-desc">광진구</option>
									</select>
						</form> 
						-->
								
						<div class="place-search">							
							<input type="text" placeholder="search" class="search">
							 <i class="fa fa-search" aria-hidden="true"></i>
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
						<aside class="col-lg-4 order-lg-1 mb-0">
							<div class="filters place-filters">								
								<div class="icon-box text-center">
									<div>
									<a class="place-filter" href="#" data-filter="1">
										<div class="icon-styled bg-place-filter round food">
											<i class="fa fa-cutlery"></i>											
										</div>
									</a>
									</div>
									<div>
									<p>음식</p>
									</div>
								</div>
							
<!-- 								
									<div class="icon-box text-center">
									<a class="place-filter" href="#" data-filter=".f-cafe">
										<div class="icon-styled bg-place-filter round cafe">
											<i class="fa fa-coffee"></i>
										</div>
										<p>카페</p>
									</div>
								 -->

									
									<div class="icon-box text-center">
									<div>
									<a class="place-filter" href="#" data-filter="2">
										<div class="icon-styled bg-place-filter round hotel">
											<i class="fa fa-hotel"></i>
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
											<i class="fa fa-tree"></i>
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
											<i class="fa fa-paw"></i>
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
											<i class="fa fa-hospital-o"></i>
										</div>
									</a>
									</div>
									<div>
										<p>병원</p>
									</div>
								</div>

<!-- 							<div class="widget widget_categories">
 								<input type="button" value="맛집" class='maplist-btn'>
								<input type="button" value="숙소" class='maplist-btn'>
								<input type="button" value="공원" class='maplist-btn'>
								<input type="button" value="전용시설" class='maplist-btn'>
								<input type="button" value="동물병원" class='maplist-btn'> 
								
							</div> -->
						</div>
						
							<!-- 위치 리스트 -->
							<!-- <div class="box-shadow pb-40 px-40 pt-35"> -->
							<div class="box-shadow pb-50 px-50 pt-50" style="height:830px">
								<div class="widget widget_mailchimp">
									<h3 class="widget-title">place list</h3>
									
									<ul class="list-unstyled">
										<div class="row isotope-wrapper" data-filters=".place-filters">
									
										<!-- li 한덩이씩 -->
										<c:forEach var="l" items="${mapList}">
											<li class="media" id="storebox">
												<div>
												<a class="media-image" href="mapView?place_no=${l.place_no }">
													<%-- <img src="${path }/resources/images/place/${l.place_img }"> --%>
													<img src="${path }/resources/images/place/cafe.jpg">
												</a>
												</div>

												<div class="media-body">
													<h4 >
														<a class="place_name" href="mapView?place_no=${l.place_no }">&gt;${l.place_name}&nbsp;</a>
													</h4>
													<p class="item-meta">
														<span class="place_addr">&gt;${l.place_addr }&nbsp;</span>
													</p>
												</div>
											</li>
										</c:forEach>
										</div>	
								</ul>
								<hr>
								
							<!-- 페이지  -->
							<nav aria-label="Pagination">
								<ul class="pagination">
									<%-- <c:if test="${paging.prev}"> --%>
									<li class="page-item">
										<a class="page-link" href='<c:url value="/mapList?page=${paging.startPage-1}"/>'>
											<i class="fa fa-chevron-left"></i>
										</a>
									</li>
									<%-- </c:if> --%>
									
									<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
									<li class="page-item">
										<a class="page-link" href='<c:url value="/mapList?page=${num}"/>'>
											${num}
											<span class="sr-only">(current)</span>
										</a>
									</li>
									</c:forEach>
							
									<%-- <c:if test="${paging.next && paging.endPage>0}"> --%>
									<li class="page-item">
										<a class="page-link" href='<c:url value="/mapList?page=${paging.endPage+1}"/>'>
											<i class="fa fa-chevron-right"></i>
										</a>
									</li>
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