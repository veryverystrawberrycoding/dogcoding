<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<title>GoodDog</title>
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
	<!-- <script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>
    <df-messenger intent="WELCOME" chat-title="GoodDog" agent-id="4ab8c97b-8e3d-4faf-8b14-b47c3493ccd7" language-code="ko"></df-messenger>
    -->
	

	 	
	<!-- chart.js -->
	<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.bundle.min.js"></script>
	<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
	



</head> 

<body>

<script type="text/javascript">
function previewImage1(f){
 
	var file = f.files;
 
	// 확장자 체크
	if(!/\.(gif|jpg|jpeg|png)$/i.test(file[0].name)){
		alert('gif, jpg, png 파일만 선택해 주세요.\n\n현재 파일 : ' + file[0].name);

		// 선택한 파일 초기화
		f.outerHTML = f.outerHTML;

		document.getElementById('preview2').innerHTML = '';
 
	} 
	else { 

		// FileReader 객체 사용
		var reader = new FileReader();

		// 파일 읽기가 완료되었을때 실행
		reader.onload = function(rst){
			document.getElementById('preview2').innerHTML = '<img src="' + rst.target.result + '">';
		}

		// 파일을 읽는다
		reader.readAsDataURL(file[0]);

	} 
}

function previewDog(f,i){
 
	var file = f.files;
 
	// 확장자 체크
	if(!/\.(gif|jpg|jpeg|png)$/i.test(file[0].name)){
		alert('gif, jpg, png 파일만 선택해 주세요.\n\n현재 파일 : ' + file[0].name);

		// 선택한 파일 초기화
		f.outerHTML = f.outerHTML;

		document.getElementById('previewDog'+i+'').innerHTML = '';
 
	} 
	else { 

		// FileReader 객체 사용
		var reader = new FileReader();
 
		// 파일 읽기가 완료되었을때 실행
		reader.onload = function(rst){ 
			document.getElementById('previewDog'+i+'').innerHTML = '<img src="' + rst.target.result + '">';
		}

		// 파일을 읽는다
		reader.readAsDataURL(file[0]);

	} 
}



</script>
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
									<div class="weightInput">
				 						<div>체중 입력 </div>
				 						<div><select name="selectDog_weight" id="selectDog_weightAdd"></select></div>
				 						<div><input class="weight_date" type="date"></div>
				 						<div><input class="weight_content" type="text" placeholder="kg" value=""></div>
				 						<div id="weightInsertBtn"><img alt="등록" src="${path}/resources/images/icons/add.png" style="width:30px; height:30px;"></div>
					 				</div>
									<div class="sort-period">
										<div><select name="selectDog_weight" id="selectDog_weight"></select></div>
										<div>
											<select name="selectYear" class="selectYear" id="selectYear_weight" style="width:160px"> 
						                        <option value="0">년 선택</option>
						                        <option value="2018">2018년</option>
						                        <option value="2019">2019년</option>
						                        <option value="2020">2020년</option>
						                        <option value="2021">2021년</option>
						                    </select>
										</div>
																		
						                <div>
						                    <select name="selectMonth" class="selectMonth" id="selectMonth_weight" style="width:150px"> 
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
<%-- 				 						<div id="weightGraphBtn"><img alt="목록" src="${path}/resources/images/icons/fluctuation.png" style="width:40px; height:40px;"></div>
 --%>					                </div>
					            

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
									<div class="walkInput">
				 						<div>
				 							<div class="timer" id="timer">00:00:00</div>
				 						</div>
				 						<div class=timerBtns>
					 						<div id="walkPlayBtn"><img alt="play" src="${path}/resources/images/icons/play.png" ></div>
					 						<div id="walkPauseBtn"><img alt="pause" src="${path}/resources/images/icons/pause.png" ></div>
					 						<div id="walkStopBtn"><img alt="stop" src="${path}/resources/images/icons/stop.png" ></div>
					 						<div id="walkInsertBtn"><img alt="stop" src="${path}/resources/images/icons/film.png" ></div>
				 						</div>
				 						<div class="pet_noList" id="pet_noList">
<!-- 				 							 <label><input type="checkbox" name="color" value="blue"> Blue</label>
				 							 <label><input type="checkbox" name="color" value="blue"> Blue</label>
				 							 <label><input type="checkbox" name="color" value="blue"> Blue</label> -->
				 						</div>
					 				</div>
									<div class="sort-period">
										<div><select name="selectDog_walk" id="selectDog_walk"></select></div>
										<div>
											<select name="selectYear" class="selectYear" id="selectYear_walk" style="width:160px"> 
						                        <option value="0">년 선택</option>
						                        <option value="2018">2018년</option>
						                        <option value="2019">2019년</option>
						                        <option value="2020">2020년</option>
						                        <option value="2021">2021년</option>
						                    </select>
										</div>
																		
						                <div>
						                    <select name="selectMonth" class="selectMonth" id="selectMonth_walk" style="width:150px"> 
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
						                <div id="walkListBtn"><img alt="목록" src="${path}/resources/images/icons/list.png" style="width:40px; height:40px;"></div>
				 						<%-- <div id="walkGraphBtn"><img alt="목록" src="${path}/resources/images/icons/fluctuation.png" style="width:40px; height:40px;"></div> --%>
					                </div>
					            

					            <div id="graph">
					                <div id="graph-box">
					                    <canvas id="myChart_walk"></canvas>
					                </div>
					            </div>				 				
				 				<div id=walkTableBox>
				 					<table id="walkTable"></table>
				 				</div>

							</div>
							</article><!-- #post-## -->

						</main>

					</div>

				</div>
			</section>
			
		<%@ include file="./footer.jsp"%> 

	<script src="${path}/resources/js/compressed.js"></script>
	<script src="${path}/resources/js/main.js"></script>
	<%-- <script src="${path}/resources/js/userJS/myPage.js"></script> --%>

</body>

</html>

