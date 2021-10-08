<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<title>GoodDog_gallery_View</title>
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
	<script src="https://code.jquery.com/jquery-3.6.0.js" type="text/javascript"></script>
	<script src="${path}/resources/js/userJS/gallery.js"></script>

    <title>채팅 서비스</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 
</head>

<body>
<%@ include file="./header.jsp"%> 
<div class = "container">
    <table class = "table table-striped">
        <thead>
        <tr>
            <th>번호</th>
            <th>방 이름</th>
            <th>입장버튼</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${rooms}" var="room">  
        	<tr>
            <td>${room.roomId}</td>
            <td>${room.name}</td>
            <td>
                <a class = "btn btn-primary" href = "/rooms/{id} ${room.roomId}"></a>
               
            </td>
            <tr>
        </c:forEach>
        </tbody>
    </table>
    <a class = "btn btn-primary pull-right" href = "/new">새로 만들기</a>
</div>

<%@ include file="./footer.jsp"%> 
</body>
</html>