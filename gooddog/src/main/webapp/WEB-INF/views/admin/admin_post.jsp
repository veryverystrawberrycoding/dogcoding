<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
  
  
  
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>관리자 - 게시판 정보</title>
	<link href="/resources/css/userCSS/admin-styles.css" rel="stylesheet" />
	 <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" ></script>
	<link rel="stylesheet" href="${path}/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="${path}/resources/css/animations.css">
	<link rel="stylesheet" href="${path}/resources/css/font-awesome.css">
	<link rel="stylesheet" href="${path}/resources/css/main.css" class="color-switcher-link">
	<script src="${path}/resources/js/vendor/modernizr-custom.js"></script>


<!-- ㅇㅇ -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.min.js"></script>
<!-- ㅇㅇ -->
		


</head>

<body>
	<!-- 페이징 설정 -->
	<style>
form {
  width: 500px;
}
table {
  border-collapse:collapse;
  margin-bottom: 10px;
}
th, td {
  padding: 3px 10px;
}
.off-screen {
  display: none;
}
#nav {
  width: 500px;
  text-align: center;
}
#nav a {
  display: inline-block;
  padding: 3px 5px;
  margin-right: 10px;
  font-family:Tahoma;
  background: #ccc;
  color: #000;
  text-decoration: none;
}
#nav a.active {
  background: #333;
  color: #fff;
}
</style>
	
<!--  ㅇㅇ -->	
	<c:set var="now" value="<%=new java.util.Date() %>"/>


        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="admin-chart.do">관리자 페이지</a>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
            
            </form>
       
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Settings</a></li>
                        <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#!">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
       
        <div id="layoutSidenav">
        
            <!-- Linknav -->
            <%@include file ="link_nav.jsp" %>
            
            <div id="layoutSidenav_content">
            
                <main>
                    <div class="container-fluid px-4">
                        <h2 class="mt-4">게시글 관리</h2>
                    
                       <div class="card mb-2" style="float: left; width: 55%; text-align: center;">           
                            <div class="card-header">
                                <i class="fas fa-address-card me-1"></i>
                                 <a>제발되라</a>  
                            </div>
                            <div class="card-body" >
<!-- 수정한곳 -->  
<!--  문제점 같은 형식의 테이블이 복사가 안됨 , 데이터 베이스에 있는 정보를 c:foreach처럼 어떻게 뿌릴지 모르겠음 -->                          
                                <table id="products">
<caption>
    <form action="" id="setRows">
      <p>
        
        <input type="hidden" name="rowPerPage" value="2">
        
      </p>
    </form>

  </caption>           
<!--  ㅇㅇ -->                       
                                    <thead>
                                        <tr>
                                            <th>아이디</th>
                                            <th>주소</th>
                                            <th>이름</th>
                                            <th>전화번호</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                    	
                                    		<tr>
                                    			<td>1</td>
                                    			<td>1</td>
                                    			<td>1</td>
                                    			<td>1</td>
                                    		</tr>
                                    		<tr>
                                    			<td>2</td>
                                    			<td>2</td>
                                    			<td>2</td>
                                    			<td>2</td>
                                    		</tr>
                                    		<tr>
                                    			<td>3</td>
                                    			<td>3</td>
                                    			<td>3</td>
                                    			<td>3</td>
                                    		</tr>       
                                    		
                                    		                                    		<tr>
                                    			<td>4</td>
                                    			<td>4</td>
                                    			<td>4</td>
                                    			<td>4</td>
                                    		</tr>     
                                    		                                    		<tr>
                                    			<td>5</td>
                                    			<td>5</td>
                                    			<td>5</td>
                                    			<td>5</td>
                                    		</tr>                                  		                                    	
                                    </tbody>
                                </table>
                                
                                
                            </div>
                        </div>
                        

 <!--  ---------------------------------------------------------- -->  
          <div class="card mb-2" style="float: left; width: 55%; text-align: center;">           
                            <div class="card-header">
                                <i class="fas fa-address-card me-1"></i>
                                 <a>제발되라</a>  
                            </div>
                            <div class="card-body" >
<!-- 수정한곳 -->  
<!--  문제점 같은 형식의 테이블이 복사가 안됨 , 데이터 베이스에 있는 정보를 c:foreach처럼 어떻게 뿌릴지 모르겠음 -->                          
                                <table id="products">
<caption>
    <form action="" id="setRows">
      <p>
        
        <input type="hidden" name="rowPerPage" value="1">
        
      </p>
    </form>

  </caption>           
<!--  ㅇㅇ -->                       
                                    <thead>
                                        <tr>
                                            <th>아이디</th>
                                            <th>주소</th>
                                            <th>이름</th>
                                            <th>전화번호</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                    	
                                    		<tr>
                                    			<td>1</td>
                                    			<td>1</td>
                                    			<td>1</td>
                                    			<td>1</td>
                                    		</tr>
                                    		<tr>
                                    			<td>2</td>
                                    			<td>2</td>
                                    			<td>2</td>
                                    			<td>2</td>
                                    		</tr>
                                    		<tr>
                                    			<td>3</td>
                                    			<td>3</td>
                                    			<td>3</td>
                                    			<td>3</td>
                                    		</tr>       
                                    		
                                    		                                    		<tr>
                                    			<td>4</td>
                                    			<td>4</td>
                                    			<td>4</td>
                                    			<td>4</td>
                                    		</tr>     
                                    		                                    		<tr>
                                    			<td>5</td>
                                    			<td>5</td>
                                    			<td>5</td>
                                    			<td>5</td>
                                    		</tr>                                  		                                    	
                                    </tbody>
                                </table>
                                
                                
                            </div>
                        </div>
                        
<!--  수정한곳 -->		

<!-- ㅇㅇ -->
<script src="${path}/resources/js/admin/admin_post2.js"></script>
 <script src="${path}/resources/js/admin/admin_post.js"></script>
<script src="${path}/resources/js/compressed.js"></script>
<script src="${path}/resources/js/main.js"></script>
<script src="resources/js/vendor/jquery-3.3.1.min.js"></script>
<script src="resources/js/admin/chart-order.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" ></script>
        <script src="resources/js/scripts.js"></script>
         <script src="resources/js/admin/datatables-simple-demo.js"></script>
		 <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"></script>
</body>

</html>