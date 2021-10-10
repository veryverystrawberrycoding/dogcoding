<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="UTF-8">
	<title>chatpage</title> 

	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->

	<link rel="stylesheet" href="${path}/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="${path}/resources/css/animations.css">
	<link rel="stylesheet" href="${path}/resources/css/font-awesome.css">
<link rel="stylesheet" href="${path}/resources/css/userCSS/main-gooddog.css" class="color-switcher-link">	
	<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Single+Day&display=swap" rel="stylesheet">
	 
	<script src="${path}/resources/js/vendor/modernizr-custom.js"></script>
  <link href="/resources/css/userCSS/start.css" rel="stylesheet" />
  
<style> 
.container{max-width:500px; margin:auto;}
img{ max-width:100%;}
.inbox_people {  
  background: #f8f8f8 none repeat scroll 0 0;
  float: left;
  overflow: hidden;
  width: 40%; border-right:1px solid #c4c4c4;
}
.inbox_msg {
  border: 1px solid #c4c4c4;
  clear: both;
  overflow: hidden;
}
.top_spac{ margin: 20px 0 0;}


.recent_heading {float: left; width:40%;}
.srch_bar {
  display: inline-block;
  text-align: right;
  width: 60%;
}
.headind_srch{ padding:10px 29px 10px 20px; overflow:hidden; border-bottom:1px solid #c4c4c4;}

.recent_heading h4 {
  color: #05728f;
  font-size: 21px;
  margin: auto;
}
.srch_bar input{ border:1px solid #cdcdcd; border-width:0 0 1px 0; width:80%; padding:2px 0 4px 6px; background:none;}
.srch_bar .input-group-addon button {
  background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
  border: medium none;
  padding: 0;
  color: #707070;
  font-size: 18px;
}
.srch_bar .input-group-addon { margin: 0 0 0 -27px;}

.chat_ib h5{ font-size:15px; color:#464646; margin:0 0 8px 0;}
.chat_ib h5 span{ font-size:13px; float:right;}
.chat_ib p{ font-size:14px; color:#989898; margin:auto}
.chat_img {
  float: left;
  width: 11%;
}
.chat_ib {
  float: left;
  padding: 0 0 0 15px;
  width: 88%;
}

.chat_people{ overflow:hidden; clear:both;}
.chat_list {
  border-bottom: 1px solid #c4c4c4;
  margin: 0;
  padding: 18px 16px 10px;
}
.inbox_chat { height: 550px; overflow-y: scroll;}

.active_chat{ background:#ebebeb;}

.incoming_msg_img {
  display: inline-block;
  width: 6%;
}
.received_msg {
  display: inline-block;
  padding: 0 0 0 10px;
  vertical-align: top;
  width: 70%;

  
 }
 .received_withd_msg p {
  background: #ebebeb none repeat scroll 0 0;
  border-radius: 3px;
  color: #646464; 
  font-size: 20px;
  margin: 0;
  padding: 15px 10px 15px 12px;
  width: 100%;
}
.time_date {
  color: #747474;
  display: block;
  font-size: 12px;
  margin: 8px 0 0;
}
.received_withd_msg { width: 60%;}
.mesgs {
  float: left; 
  padding: 30px 15px 0 25px;
  width: 100%; 
}

 .sent_msg p {
  background: #9ad1d3 none repeat scroll 0 0;
  border-radius: 3px;
  font-size: 20px;
  margin: 0; color:#fff;
  padding: 15px 10px 15px 12px;
  width:100%;
}
.outgoing_msg{ overflow:hidden; margin:26px 0 26px; width:70%; float:right;}
.sent_msg {
  float: right;
  width: 60%;  
}
.input_msg_write input {
  background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
  border: medium none;
  color: #4c4c4c;
  font-size: 15px;
  min-height: 48px;
  width: 100%;
}

.type_msg {border-top: 1px solid #c4c4c4;position: relative;}
.msg_send_btn {
  background: #05728f none repeat scroll 0 0;
  border: medium none;
  border-radius: 50%;
  color: #fff;
  cursor: pointer;
  font-size: 15px;  
  height: 30px; 
  position: absolute; 
  right: 0;
  width: 20px;

}
.messaging { padding: 0 0 50px 0;}
.msg_history {
  height: 516px;
  overflow-y: scroll; 
}

</style>
	<!--[if lt IE 9]>
		<script src="js/vendor/html5shiv.min.js"></script>
		<script src="js/vendor/respond.min.js"></script>
		<script src="js/vendor/jquery-1.12.4.min.js"></script>
	<![endif]-->

</head>

<body>


	<!-- wrappers for visual page editor and boxed version of template -->


			
			<!--eof topline-->
			 <!-- header start -->
    	 <%@ include file ="/WEB-INF/views/header.jsp" %>
   
 <div class="container">
 <br> <br> 
<h3 class=" text-center" style="font-size:40px; "><Strong>익명채팅방</Strong></h3>
<br>  
<br> 
<input id="multi_hidden_id" type="hidden" value=${user.user_id }>
<div class="messaging"> 
      <div class="inbox_msg"> 
       
        <div class="mesgs">
          <div class="msg_history">
           
          </div>
          <div class="type_msg justify-content-center" style="height:70px; justify-content: center;">
 
            <div class="input_msg_write" style="margin-top:10px">
            <div class="container">
            <div class="row">
            <div class="col-sm-10">
             <input style="justify-content: center;" id="out_write_msg" type="text" class="write_msg justify-content-center" placeholder="메시지를 입력해주세요" />
            </div>
            <div class="col-sm-2">
            <input id="msg_send_btn" style="float: right; background: #9ad1d3; width:80%; border-radius: 3%; color:white; cursor:pointer" type="button" value="입력"/>
            </div>
            </div>    
            </div>  
          </div>   
        </div>  
      </div> 
        
      
    </div></div>
    </div>
     <%@ include file ="/WEB-INF/views/footer.jsp" %>
	 	<script src="${path}/resources/js/userJS/multi.js"></script>
</body> 
<!-- footer end -->

</html>