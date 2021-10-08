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
<link rel="preconnect" href="https://fonts.gstatic.com" >
<link href="https://fonts.googleapis.com/css2?family=Single+Day&display=swap" rel="stylesheet">


<style >
body{
  height: 100%;
}
.user{
	border-bottom: 1px solid #716d6d;
	padding: 10px;
	width:95%;
}
.user_data{
	background-color: #f8f9fa!important;
	border-top: 5px solid #716d6d;
	max-height: calc(100vh);

}
.profile_name{
	background-color: #f8f9fa!important;
	width:100%;
	padding: 10px;
	border-bottom: 5px solid #716d6d;
}
.user a:hover{
text-decoration: none;
color: #212529;
}
.user a{
	color: #212529;
}

.chat_section{
	padding-top: 15px;
}
.incoming_msg_img {
  display: inline-block;
  width: 6%;
}
.received_msg {
  display: inline-block;
  padding: 0 0 0 10px;
  vertical-align: top;
  width: 92%;
 }
 .received_withd_msg p {
  background: #ebebeb none repeat scroll 0 0;
  border-radius: 6px;
  color: #646464;
  font-size: 14px;
  margin: 0;
  padding: 5px 10px 5px 12px;
  width: 100%;
}
.time_date {
  color: #747474;
  display: block;
  font-size: 10px;
  margin: 8px 0 0;
}
.received_withd_msg { width: 57%; margin-bottom: 8px;}
.mesgs {
  float: left;
  padding: 30px 15px 0 25px;
  width: 60%;
}

 .sent_msg p {
  background: #050f8f none repeat scroll 0 0;
  border-radius: 6px;
  font-size: 14px;
  margin: 0; color:#fff;
  padding: 5px 10px 5px 12px;
  width:100%;
}
.outgoing_msg{ overflow:hidden; margin:26px 0 26px;}
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
  padding: 10px;
}

.type_msg {border-top: 1px solid #c4c4c4; position: relative;}
.msg_send_btn {
  background: #05728f none repeat scroll 0 0;
  border: medium none;
  border-radius: 50%;
  color: #fff;
  cursor: pointer;
  font-size: 17px;
  height: 33px;
  position: absolute;
  right: 0;
  top: 11px;
  width: 33px;
}
.messaging { padding: 0 0 50px 0;}
.msg_history {
  height: 516px;
  overflow-y: auto;
} 
</style>




</head>

<body>

	

	   





  <div class="container-fluid">

    <div class="row">

      <div class="col-sm-12">


        <div id="user_chat_data" class="user_chat_data">
          <div class="profile_name">
            &nbsp;&nbsp;&nbsp;&nbsp;<img src="./img/profile.png" class="mr-3 rounded-circle"> &nbsp;&nbsp;
            <span id="username"></span>
          </div>

          <div class="container-fluid chat_section" id="chat-box">
			ssss
          </div>

          <div class="type_msg">
            <div class="input_msg_write">
              <input id="chat-outgoing-msg" type="text" class="write_msg" placeholder="Type a message" />
              <button id="chat-outgoing-button" class="msg_send_btn" type="button"><i class="fa fa-paper-plane"
                  aria-hidden="true"></i></button>
            </div>
          </div>

        </div>
      </div>
    </div>
  </div>




				




	<script src="${path}/resources/js/userJS/Multichat.js"></script>
	<script src="${path}/resources/js/compressed.js"></script>
	<script src="${path}/resources/js/main.js"></script>


</body>

</html>