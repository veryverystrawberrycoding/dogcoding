<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html class="no-js">
<head>
<%
String uid = (String)request.getParameter("name");
%> 
<meta charset="UTF-8"> 

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
<style>


body {
    padding: 30px 0px 60px;
}
.panel > .list-group .list-group-item:first-child {
    /*border-top: 1px solid rgb(204, 204, 204);*/
}
@media (max-width: 767px) {
    .visible-xs {
        display: inline-block !important;
    }
    .block {
        display: block !important;
        width: 100%;
        height: 1px !important;
    }
}
#back-to-bootsnipp {
    position: fixed;
    top: 10px; right: 10px;
}


.c-search > .form-control {
   border-radius: 0px;
   border-width: 0px;
   border-bottom-width: 1px;
   font-size: 1.3em;
   padding: 12px 12px;
   height: 44px;
   outline: none !important;
}
.c-search > .form-control:focus {
    outline:0px !important;
    -webkit-appearance:none;
    box-shadow: none;
}
.c-search > .input-group-btn .btn {
   border-radius: 0px;
   border-width: 0px;
   border-left-width: 1px;
   border-bottom-width: 1px;
   height: 44px;
}


.c-list {
    padding: 0px;
    min-height: 44px;
}
.title {
    display: inline-block;
    font-size: 1.7em;
    font-weight: bold;
    padding: 5px 15px;
}
ul.c-controls {
    list-style: none;
    margin: 0px;
    min-height: 44px;
}

ul.c-controls li {
    margin-top: 8px;
    float: left;
}

ul.c-controls li a {
    font-size: 1.7em;
    padding: 11px 10px 6px;   
}
ul.c-controls li a i {
    min-width: 24px;
    text-align: center;
}

ul.c-controls li a:hover {
    background-color: rgba(51, 51, 51, 0.2);
}

.c-toggle {
    font-size: 1.7em;
}

.name { 
    font-size: 1.7em;
    font-weight: 700;
}

.c-info {
    padding: 5px 10px;
    font-size: 1.25em;
}





	 .card {
    margin-top: 20px;
    padding: 30px;
    background-color: rgba(214, 224, 226, 0.2);
    -webkit-border-top-left-radius:5px;
    -moz-border-top-left-radius:5px;
    border-top-left-radius:5px;
    -webkit-border-top-right-radius:5px;
    -moz-border-top-right-radius:5px;
    border-top-right-radius:5px;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
.card.hovercard {
    position: relative;
    padding-top: 0;
    overflow: hidden;
    text-align: center;
    background-color: #fff;
    background-color: rgba(255, 111, 97, 0.5);
}  
.card.hovercard .card-background {
    height: 130px;
}

.card.hovercard .useravatar {
    position: absolute;
    top: 15px;
    left: 0;
    right: 0;
}
.card.hovercard .useravatar img {
    width: 100px;
    height: 100px;
    max-width: 100px;
    max-height: 100px;
    -webkit-border-radius: 50%;
    -moz-border-radius: 50%;
    border-radius: 50%;
    border: 5px solid rgba(255, 255, 255, 0.5);
}
.card.hovercard .card-info {
    position: absolute;
    bottom: 14px;
    left: 0;
    right: 0;
}
.card.hovercard .card-info .card-title {
    padding:0 5px;
    font-size: 20px;
    line-height: 1;
    color: #ffffff;
    -webkit-border-radius: 4px;
    -moz-border-radius: 4px;
    border-radius: 4px;
}
.card.hovercard .card-info {
    overflow: hidden;
    font-size: 12px;
    padding-top: 3px;
    line-height: 30px; 
    color: #737373;
    text-overflow: ellipsis;
}
.card.hovercard .bottom {
    padding: 0 20px;
    margin-bottom: 17px;
}
.btn-pref .btn {
    -webkit-border-radius:0 !important;
}

	</style> 
</head> 
<body>
    <div class="card hovercard"> 
        <div class="card-background">
    
        </div> 
        <div class="useravatar">
            <img alt="" src="/resources/images/userimg/${uvo.user_img }">
            <input type="hidden" id="your_id" value="<%=uid%>">
        </div>  
        <div class="card-info"><Strong><span id="frd_nick" class="card-title">${uvo.user_nick }</span></Strong><Strong><a style="font-size:15px; color:black; cursor:pointer" id="profile_follow" class="profile_follow">팔로잉</a>
        <a style="font-size:15px; color:black; cursor:pointer" id="follow_delete">삭제하기</a></Strong></div>   
    </div> 
      	<br>
      	<br>
        <div class="container" role="group" aria-label="..."> 
        <div class="row">  
        <div class="col-sm-4 text-center align-self-center" id="your_pet" style="cursor:pointer; background-color:#5E7E9B; height:50px; color:white; line-height: 50px;">
            <Strong>나의 펫</Strong> 
        </div> 
        <div class="col-sm-4 text-center align-middle" id="your_following" style="cursor:pointer; background-color:#FFFFFF; color:black; height:50px; line-height: 50px;">
            <Strong>팔로잉</Strong> 
        </div>  
        <div class="col-sm-4 text-center align-self-center" id="your_follower" style="cursor:pointer; background-color:#FFFFFF; color:black; height:50px; line-height: 50px;"> 
            <Strong>팔로워</Strong>  
        </div>   
        </div>    
   	    </div> 
      <div class="container">
      	<div class="row your_info" id="your_info">
      	
     </div>
     </div>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>    
<script src="${path}/resources/js/compressed.js"></script>

<script src="${path}/resources/js/userJS/profile.js"></script>    
<script type="text/javascript"> 


</script> 
</body>
</html>    