<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chatbox</title>

<link rel="stylesheet" href="${path}/resources/css/chat/chat.css">
<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
</head>
<body>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<!-- 
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
 -->
<script type="text/javascript">
$(document).ready(function(){

});

// 낼 이어서할거 ㅜ chatText 와 소켓정보 버튼클릭시 scanner.nextLine() 로 넘기기
</script>
<div id="container">

	<main>
	 <div id="chatheader">
	    
        <div id="header" style="text-align: center;font-family: js; font-size: 20px;">
        <label>홍길동</label>
        <div id="buttonarea">
        <button class="btn btn-danger" style="width: 40%" onclick="window.open('../manager/addDecla.do?boardType=3','_blank','width=1150 ,height=650');"
			 id="balckbtn">신고하기</button>
			 <button class="btn btn-info join" type="button" id="joinBtn" style="width: 40%" >
			 친구추가
			 </button>
		</div>
		</div>
		<!-- 채팅메세지를 주고받는 부분 -->
		<div id="chat">
		홍길동 : 설마 여기가 메세지 창?? <br />
		홍길홍길 : 엔터먹힘?? <br />
		</div>
		
			<input type="text" id="chatText" name="chatText" style="color:black; height:30px; size:30px;" />
			<input style="height: 30%;color:black;" class="btn btn-primary" type="button" onkeyup="enterkey()" id="sendBtn"  value="전송하기">
			
		
		</div>
	</main>
</div>
<script src="resources/js/vendor/jquery-3.3.1.min.js"></script>
<!-- 채팅기능을 위한 script 
<script src="resources/js/chat.js"></script> 
		-->
		


</body>

</html> 