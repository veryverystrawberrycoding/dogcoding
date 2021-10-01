<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="UTF-8">
<title>chatroom</title>

<meta name="description" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->

<link rel="stylesheet" href="${path}/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${path}/resources/css/animations.css">
<link rel="stylesheet" href="${path}/resources/css/font-awesome.css">
<link rel="stylesheet" href="${path}/resources/css/main.css"
	class="color-switcher-link">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Single+Day&display=swap"
	rel="stylesheet">

<script src="${path}/resources/js/vendor/modernizr-custom.js"></script>
<link href="/resources/css/userCSS/start.css" rel="stylesheet" />

<style>
.start_items_title {
	display: block;
	font-size: 18px;
	font-weight: 600;
	color: #ffffff;
}

.start_items {
	position: relative;
	background-color: #00aeef;
	color: #ffffff;
	line-height: 1.8;
	word-wrap: break-word;
	border-radius: 3px;
	margin-top: 10px;
	margin-bottom: 10px;
	padding: 2%;
	padding-right: 25%;
}

.start_items_btn {
	float: right;
	position: absolute;
	top: 50%;
	transform: translate(0, -50%);
}

.official_message_wrap {
	line-height: 1.8;
	word-wrap: break-word;
	border-radius: 3px;
	text-align: center;
	padding: 5px;
	margin-top: 5px;
	margin-bottom: 5px;
	background-color: #ffffff;
	color: #000000;
	border: 1px solid #00aeef;
}

.custom_chat_room {
	width: 100%;
	overflow: hidden;
	height: auto;
	border-radius: 4px;
	padding: 10px;
	margin-top: 5px;
	margin-bottom: 5px;
	background-color: #ffffff;
	color: #000000;
	border: 1px solid #00aeef;
}
}
</style>
<!--[if lt IE 9]>
		<script src="js/vendor/html5shiv.min.js"></script>
		<script src="js/vendor/respond.min.js"></script>
		<script src="js/vendor/jquery-1.12.4.min.js"></script>
	<![endif]-->

</head>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){

});

function create_chat_room(){
	var chatRoom = prompt("채팅방 이름을 설정하세요. (2 ~ 16자)");
	$('#chatRoomName').val(chatRoom);
	
	var chk = $("#chatRoomName").val();	
	
	if(chk.length < 2 || chk.length >16){	
	alert("2자리 ~ 16자리 이내로 입력해주세요.");
	return false;
	}else if(userName == ""){
	alert("로그인 후 이용 바랍니다.");
	return false;
	}else{
	console.log("통과");
	$('#Frm').attr('action','chatStart1.do').submit();
	}	
}


</script>

<body>
<form id="Frm">
<input type="hidden" name="chatRoomName" id="chatRoomName" />
<input type="hidden" name="userName" id="userName" value="홍길동" />

</form>
	<!--[if lt IE 9]>
		<div class="bg-danger text-center">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/" class="color-main">upgrade your browser</a> to improve your experience.</div>
	<![endif]-->

	<div class="preloader">
		<div class="preloader_image pulse"></div>
	</div>

	<!-- search modal -->
	<div class="modal" tabindex="-1" role="dialog"
		aria-labelledby="search_modal" id="search_modal">
		<button type="button" class="close" data-dismiss="modal"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<div class="widget widget_search">
			<form method="get" class="searchform search-form" action="/">
				<div class="form-group">
					<input type="text" value="" name="search" class="form-control"
						placeholder="Search keyword" id="modal-search-input">
				</div>
				<button type="submit"></button>
			</form>
		</div>
	</div>

	<!-- Unyson messages modal -->
	<div class="modal fade" tabindex="-1" role="dialog" id="messages_modal">
		<div class="fw-messages-wrap ls p-normal">
			<!-- Uncomment this UL with LI to show messages in modal popup to your user: -->
			<!--
		<ul class="list-unstyled">
			<li>Message To User</li>
		</ul>
		-->

		</div>
	</div>
	<!-- eof .modal -->

	<!-- wrappers for visual page editor and boxed version of template -->



	<!--eof topline-->
	<!-- header start -->
	<%@ include file="/WEB-INF/views/header.jsp"%>

	<!-- header end -->







	<section class="container">

		<h3 class="text-left mb-35">Chat</h3>
		<!--  <button type="submit" id="contact_form_submit" name="contact_submit" class="btn btn-maincolor">방 만들기!</button>-->





		<div id="chat_wrap">
			<div class="chat_monitor">
				<div id="blank"></div>
				<div class="official_message_wrap">
					<strong> <i class="fa fa-comments" aria-hidden="true"></i>
						"방 채팅"
					</strong>
					<div class="small_margin"></div>
					" 아래 버튼으로 채팅방을 개설할 수 있습니다."
					<div class="small_margin"></div>
					<button class="btn btn-handsfriend2 btn-sm"
						onclick="create_chat_room();">방 만들기</button>
					"&nbsp;&nbsp;"
					<a href="/SocketStart.do" >테스트테ㅡㅅ</a>
					<button class="btn btn-handsfriend2 btn-sm back_to_main"
						onclick="history.back(-1)">돌아가기</button>
					<a href="javascript:history.back(-1)"></a>
					<div class="small_margin"></div>
				</div>
				<div class="custom_chat_room">
					<div style="text-align: center;">현재 생성된 채팅방이 없습니다.</div>
				</div>
			</div>





		</div>
	</section>

	<!--   -------------------------------------------------------------------------------------------------- -->

	<!-- footer start -->
	<%@ include file="/WEB-INF/views/footer.jsp"%>

</body>
<!-- footer end -->

</html>