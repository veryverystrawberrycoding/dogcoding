<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html>  
<head>
<meta charset="UTF-8"> 

	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->

	<link rel="stylesheet" href="${path}/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="${path}/resources/css/animations.css">
	<link rel="stylesheet" href="${path}/resources/css/font-awesome.css">
	<link rel="stylesheet" href="${path}/resources/css/main.css" class="color-switcher-link">

<style>
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
    background-color: rgba(255, 255, 255, 1);
}
.card.hovercard .card-background {
    height: 130px;
}
.card-background img {
    -webkit-filter: blur(25px);
    -moz-filter: blur(25px);
    -o-filter: blur(25px);
    -ms-filter: blur(25px);
    filter: blur(25px);
    margin-left: -100px;
    margin-top: -200px;
    min-width: 130%;
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
    color: #262626;
    background-color: rgba(255, 255, 255, 0.1);
    -webkit-border-radius: 4px;
    -moz-border-radius: 4px;
    border-radius: 4px;
}
.card.hovercard .card-info {
    overflow: hidden;
    font-size: 12px;
    line-height: 20px;
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
<div>
    <div class="card hovercard"> 
        <div class="card-background">
            <img class="card-bkimg" alt="" src="http://lorempixel.com/100/100/people/9/">
            <!-- http://lorempixel.com/850/280/people/9/ -->
        </div>
        <div class="useravatar">
            <img alt="" src="${uvo.user_img }">
        </div>
        <div class="card-info"> <span id="frd_nick" class="card-title">${uvo.user_nick }</span>

        </div>   
    </div> 
    <div class="container" role="group" aria-label="...">
    <div class="row">
        <div class="btn-group col-md-4" role="group">
                <div style="cursor:pointer; height:70px;" class="hidden-xs">애견들</div>
        </div> 
        <div class="btn-group col-md-4" role="group">
                <div style="cursor:pointer; height:70px;" class="hidden-xs">팔로워</div>
        </div> 
        <div style="text-align:center;" class="btn-group col-md-4" role="group">
           <div style="text-align:center; height:70px; cursor:pointer; float:right;" class="hidden-xs">팔로잉</div>   
        </div>     
    </div>  
	</div>
      <div class="container">
      	<div class="row">
      		<div class="col-md-6">
      		<img src="img.jpg" style="width:300px; height:300px;"/>
      		</div> 
      		<div class="col-md-6">
      		<div>이름 : </div>
      		<div>성별 : </div>
      		<div>나이 : </div>
      		<div>견종 : </div>
      		</div>
      	</div>
      </div>  
    </div>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>    
<script src="${path}/resources/js/compressed.js"></script>
<script src="${path}/resources/js/main.js"></script>
<script src="${path}/resources/js/userJS/friends.js"></script>    
<script type="text/javascript">


</script> 
</body>
</html>    