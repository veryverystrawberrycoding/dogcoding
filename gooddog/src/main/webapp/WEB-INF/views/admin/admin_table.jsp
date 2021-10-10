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

</head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	
	userList();
});

// 페이징 처리
function userList(){

		var returnHtml = "";
		var pageHtml = '';
		var page = $('#page').val();
		
		$.ajax({	
			type:'POST',
			data: 'page='+page,
			url:"/userList",
			dataType: "json",
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
						var userid = data.list[i].user_id;		
						var username = data.list[i].user_name;
						var useraddr = data.list[i].user_addr;
						var usertel = data.list[i].user_tel;
						
						returnHtml += "<tr>"	
						returnHtml += "<td class= 'userid'>"+userid+"</td>"
						returnHtml += "<td>"+username+"</td>"
						returnHtml += "<td>"+useraddr+"</td>"
						returnHtml += "<td>"+usertel+"</td>"
						returnHtml += "<td><button type='button' class='user_stop'style= 'border-radius: 0px; padding: 12px 20px;'>정지</button></td>"	
						returnHtml += "</tr>"
					}
				}			
				$('#userList1').html(returnHtml);
			}
	});
}

// 페이지 넘기기 
function pageGo(pageNum){
	if(pageNum == 0){
	// 이전페이지
		$('#page').val($('#prevPage').val());
		userList();
	}else if(pageNum == 999){
	// 다음페이지
		$('#page').val($('#nextPage').val());
		userList();
	}else{
		$('#page').val(pageNum);		// 사용자가 누른 페이지
		userList();
	}
}


//정지 버튼 클릭시 유저id넘기고 블랙리스트추가창 오픈
$(document).on('click', '.user_stop', function(){
  let userid = $(this).parent().parent().find(".userid").text();
   window.open('addblack.do?userid='+userid+'','_blank','width=600 ,height=400') 
    
})


</script>

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
                  
                    
                       <div class="card mb-4" >
                            <div class="card-header">
                                <i class="fas fa-address-card me-1" ></i>
                   			회원 목록
                            </div>
                           
                           

                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>아이디</th>
                                            <th>이름</th>
                                            <th>주소</th>
                                            <th>전화번호</th>
											<th>정지</th>
                                        </tr>
                                    </thead>
                                  
                                    <tbody id="userList1">
                                    	
                                    	
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
                        
                        
                         
                        </div>
                    </div>
                </main>
                    </div>
		

	<script src="${path}/resources/js/compressed.js"></script>
	<script src="${path}/resources/js/main.js"></script>
<script src="resources/js/vendor/jquery-3.3.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="resources/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" ></script>
    
         <script src="resources/js/admin/datatables-simple-demo.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
</body>

</html>