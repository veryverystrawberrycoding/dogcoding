<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<title>Mypage-DogCare</title>
	<meta charset="utf-8">

	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link rel="stylesheet" href="${path}/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="${path}/resources/css/animations.css">
	<link rel="stylesheet" href="${path}/resources/css/font-awesome.css">
	<link rel="stylesheet" href="${path}/resources/css/userCSS/main-gooddog.css" class="color-switcher-link">
  	
	<script src="${path}/resources/js/vendor/modernizr-custom.js"></script>
	
	
	<!-- 제이쿼리 -->
	<script src="${path}/resources/js/vendor/jquery-3.3.1.min.js"></script>
	
	<script src="${path}/resources/js/userJS/mypageDogCare.js"></script>
	<script src="${path}/resources/js/userJS/dogface.js"></script>
	<script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>
    <df-messenger intent="WELCOME" chat-title="GoodDog" agent-id="4ab8c97b-8e3d-4faf-8b14-b47c3493ccd7" language-code="ko"></df-messenger>
   
	

	 	
	<!-- chart.js -->
	<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.bundle.min.js"></script>
	<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
	



</head> 

<body>
<%@ include file="./header.jsp"%> 

<!-- 바디 -->



			<section class="ls s-py-60 s-pt-md-90 s-py-lg-90 s-py-xl-160">
				<div class="container">

					<div class="row c-gutter-60">

						<main class="col-lg-7 col-xl-8 order-lg-2">	
							<!-- 반려견 목록 -->
							<div id="totalPetList" ></div>	
							
							<!-- 반려견 추가 -->	
							<article class="post-with-author box-shadow vertical-item post type-post status-publish format-standard has-post-thumbnail">
								<div class="myDogAdd"><img src="${path}/resources/images/icons/add.png" width="30px" height="30px">&nbsp;반려견 추가하기</div>
							</article>
							
							<!-- 반려견 체중 그래프 -->
							<article class="post-with-author box-shadow vertical-item post type-post status-publish format-standard has-post-thumbnail">
								<div class="item-media post-thumbnail weightContainer">
									<div class="dogBox-title"><h3>체중 정보</h3></div>
									<div class="sort-period">
<!-- 										<div>
											<a class="weightGraph" href="#">
												<div class="icon-styled bg-maincolor round text-center">
													<p>일별</p>										
												</div>
											</a>
										</div> -->
										
										<div><select name="selectDog_weight" id="selectDog_weight"></select></div>
										<div>
											<select name="selectYear" id="selectYear" style="width:160px"> 
						                        <option value="0">년 선택</option>
						                        <option value="2018">2018년</option>
						                        <option value="2019">2019년</option>
						                        <option value="2020">2020년</option>
						                        <option value="2021">2021년</option>
						                    </select>
										</div>
																		
						                <div>
						                    <select name="selectMonth" id="selectMonth" style="width:150px"> 
						                        <option value="0">월 선택</option>
						                        <option value="1">1월</option>
						                        <option value="2">2월</option>
						                        <option value="3">3월</option>
						                        <option value="4">4월</option>
						                        <option value="5">5월</option>
						                        <option value="6">6월</option>
						                        <option value="7">7월</option>
						                        <option value="8">8월</option>
						                        <option value="9">9월</option>
						                        <option value="10">10월</option>
						                        <option value="11">11월</option>
						                        <option value="12">12월</option>
						                    </select>
						                </div>
						                <div id="weightListBtn"><img alt="목록" src="${path}/resources/images/icons/list.png" style="width:40px; height:40px;"></div>
				 						<div id="weightGraphBtn"><img alt="목록" src="${path}/resources/images/icons/fluctuation.png" style="width:40px; height:40px;"></div>
					                </div>
					            
				 				<div class="weightInput">
				 						<div>체중 입력 </div>
				 						
				 						<div><input class="weight_date" type="date"></div>
				 						<div><input class="weight_content" type="text" placeholder="kg" value=""></div>
				 						<div id="weightInsertBtn"><img alt="등록" src="${path}/resources/images/icons/add.png" style="width:30px; height:30px;"></div>
				 						
				 						
				 				</div>
					            <div id="graph">
					                <div id="graph-box">
					                    <canvas id="myChart"></canvas>
					                </div>
					            </div>				 				
				 				<div id=weightTableBox>
				 					<table id="weightTable"></table>
				 				</div>

					            
							</div>
							</article><!-- #post-## -->
							
							
							<!-- 반려견 산책정보 그래프 -->
							<article class="post-with-author box-shadow vertical-item post type-post status-publish format-standard has-post-thumbnail">
								<div class="item-media post-thumbnail weightContainer">
									<div class="dogBox-title"><h3>산책 정보</h3></div>
									<div class="sort-period">
<!-- 										<div>
											<a class="weightGraph" href="#">
												<div class="icon-styled bg-maincolor round text-center">
													<p>일별</p>										
												</div>
											</a>
										</div> -->
										
										<div><select name="selectDog_walk" id="selectDog_walk"></select></div>
										<div>
											<select name="selectYear" id="selectYear" style="width:160px"> 
						                        <option value="0">년 선택</option>
						                        <option value="2018">2018년</option>
						                        <option value="2019">2019년</option>
						                        <option value="2020">2020년</option>
						                        <option value="2021">2021년</option>
						                    </select>
										</div>
																		
						                <div>
						                    <select name="selectMonth" id="selectMonth" style="width:150px"> 
						                        <option value="0">월 선택</option>
						                        <option value="1">1월</option>
						                        <option value="2">2월</option>
						                        <option value="3">3월</option>
						                        <option value="4">4월</option>
						                        <option value="5">5월</option>
						                        <option value="6">6월</option>
						                        <option value="7">7월</option>
						                        <option value="8">8월</option>
						                        <option value="9">9월</option>
						                        <option value="10">10월</option>
						                        <option value="11">11월</option>
						                        <option value="12">12월</option>
						                    </select>
						                </div>
						                <div id="weightListBtn"><img alt="목록" src="${path}/resources/images/icons/list.png" style="width:40px; height:40px;"></div>
				 						<div id="weightGraphBtn"><img alt="목록" src="${path}/resources/images/icons/fluctuation.png" style="width:40px; height:40px;"></div>
					                </div>
					            
				 				<div class="weightInput">
				 						<div>체중 입력 </div>
				 						
				 						<div><input class="weight_date" type="date"></div>
				 						<div><input class="weight_content" type="text" placeholder="kg" value=""></div>
				 						<div id="weightInsertBtn"><img alt="등록" src="${path}/resources/images/icons/add.png" style="width:30px; height:30px;"></div>
				 						
				 						
				 				</div>
					            <div id="graph">
					                <div id="graph-box">
					                    <canvas id="myChart"></canvas>
					                </div>
					            </div>				 				
				 				<div id=weightTableBox>
				 					<table id="weightTable"></table>
				 				</div>

					            
							</div>
							</article><!-- #post-## -->
							



						</main>

						<aside class="col-lg-5 col-xl-4 order-lg-1 mb-0">

							<div class="widget widget_categories">
							<%@ include file="./MypageCategories.jsp" %>
							</div>

	
						</aside>




					</div>

				</div>
			</section>
			
			
			
			
			
			
			
		<%@ include file="./footer.jsp"%> 
		



	<script src="${path}/resources/js/compressed.js"></script>
	<script src="${path}/resources/js/main.js"></script>
	<%-- <script src="${path}/resources/js/userJS/myPage.js"></script> --%>

</body>

</html>

