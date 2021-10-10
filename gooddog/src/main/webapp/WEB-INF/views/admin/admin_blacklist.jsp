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
	<title>관리자 - 회원 정보</title>
	<link href="/resources/css/userCSS/admin-styles.css" rel="stylesheet" />
	 <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" ></script>
	<link rel="stylesheet" href="${path}/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="${path}/resources/css/animations.css">
	<link rel="stylesheet" href="${path}/resources/css/font-awesome.css">
	<link rel="stylesheet" href="${path}/resources/css/main.css" class="color-switcher-link">
	<script src="${path}/resources/js/vendor/modernizr-custom.js"></script>

	<!--[if lt IE 9]>
		<script src="js/vendor/html5shiv.min.js"></script>
		<script src="js/vendor/respond.min.js"></script>
		<script src="js/vendor/jquery-1.12.4.min.js"></script>
	<![endif]-->
	
	<style>
	
	.pagenations{
		display:flex;
		justify-content: center;
	}
	.pagenations a{
		margin-right: 10px;
	    margin: 0 1px 0 25px;
	}
	
	</style>

</head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">

//-----------------------------------------------------------------

$(document).ready(function(){
	
	blackList();
});

function blackList(){

		var returnHtml = "";
		var pageHtml = '';
			
			
		var page = $('#page').val();
		$.ajax({	
			type:'POST',
			data: 'page='+page,
			url:"/blackList",
			dataType: "json",
			async    : false,
			
			success : function(data) {
			
				var nextPage = data.nextPage;
				var prevPage = data.prevPage;
				var pageIn = data.pageIn;
				var startPage = data.page.startPage;
				var endPage = data.page.endPage;
				endPage = endPage +1;
				
				
				for(var p=startPage; p<endPage; p++){
					
					pageHtml += "<a href='javascript:pageGo("+p+");'>"+p+"</a>"+"&nbsp;&nbsp;&nbsp;&nbsp;";
				}
				
					
		
				$('#pageId').html(pageHtml);
				
				$('#page').val(pageIn);
				$('#nextPage').val(nextPage);
				$('#prevPage').val(prevPage);
				
				var cnt = data.list.length; 
				
				if(cnt == 0){
					alert("사용자가 없습니다");
				}else{
					for(var i=0; i<cnt; i++){
						var black_no = data.list[i].black_no;		
						var user_id = data.list[i].user_id;
						var black_start = data.list[i].black_start;
						var black_end = data.list[i].black_end;
						var black_content = data.list[i].black_content;
						
						returnHtml += "<tr>"
						
						returnHtml += "<td id=black_no>"+black_no+"</td>"
						returnHtml += "<td id=user_id>"+user_id+"</td>"
						returnHtml += "<td>"+black_start+"</td>"
						returnHtml += "<td>"+black_end+"</td>"
						returnHtml += "<td>"+black_content+"</td>"	
						returnHtml += "<td><button type='button' id='black_restore' class='black_restore' style= 'border-radius: 0px; padding: 12px 20px;' >해지</button></td>"	
						
						returnHtml += "</tr>"
						
					}
				}
				
				$('#blackList1').html(returnHtml);
			}
	});
}
//-------------페이징 ---------
function pageGo(pageNum){
	if(pageNum == 0){
	// 이전페이지
		$('#page').val($('#prevPage').val());
		blackList();
	}else if(pageNum == 999){
	// 다음페이지
		$('#page').val($('#nextPage').val());
		blackList();
	}else{
		$('#page').val(pageNum);		// 사용자가 누른 페이지
		blackList();
	}
}
blackList();
//-------------blacklist 삭제 기능 -----------------------
$(document).on('click', '.black_restore', function(){

	var black_no = $('#black_no').text()
	
	$.ajax({
		type:'post',
		url:'/blacklistDelete',
		async : false,
  	data: {black_no:black_no},
	success: function(data){
			alert("삭제완료");
			blackList(); 
		} ,error:function(request, status, error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}					
	})
})

</script>


<body>
	
	<form>
	<input type="hidden" name="page" id="page" value="1" />
	<input type="hidden" name="nextPage" id="nextPage" />
	<input type="hidden" name="prevPage" id="prevPage" /> 
	</form>
	<c:set var="now" value="<%=new java.util.Date() %>"/>


        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="admin_chart.do">관리자 페이지</a>
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
                  
                       
                        
                        
                          <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-address-card me-1"></i>
                                블랙리스트	 목록
                            </div>
                          
                            <div class="">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>넘버</th>
                                            <th>아이디</th>
                                            <th>시작일</th>
                                            <th>종료일</th>
                                            <th>정지사유</th>
                                            <th>해지</th>
                                        
                                        </tr>
                                        
                                    </thead>
             
                                    <tbody id="blackList1">
                                    	
                                    	
                                    </tbody>
                                </table>
                            </div>
                               <!--  page -->
                               <div class="pagenations">
                              <a href="javascript:pageGo(0)">이전</a>
                             <a class="page" id="pageId" > </a>
                              <a href="javascript:pageGo(999)">다음</a>
                              </div>
                        </div>
                   
                </main>
                    
		

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