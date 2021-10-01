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

	<!--[if lt IE 9]>
		<script src="js/vendor/html5shiv.min.js"></script>
		<script src="js/vendor/respond.min.js"></script>
		<script src="js/vendor/jquery-1.12.4.min.js"></script>
		
	<![endif]-->

</head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>


<script type="text/javascript">
$(document).ready(function(){
	
	galleryList();
});

function galleryList(){

		var returnHtml = "";
		var pageHtml = '';
			
			
		var page = $('#page').val();
		$.ajax({	
			type:'POST',
			data: 'page='+page,
			url:"/galleryList",
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
						var gal_no = data.list[i].gal_no;		
						var gal_name = data.list[i].gal_name;
						
						
						
						returnHtml += "<tr>"
						
						returnHtml += "<td class ='gal_no'>"+gal_no+"</td>"
						returnHtml += "<td class = 'gal_name'>"+gal_name+"</td>"
		
						returnHtml += '<td><button type="submit" id="gallery_delete_submit" class="gallery_modify_btn">등록</button></td>'						
						returnHtml += '<td><button type="submit" id="gallery_delete_submit" class="gallery_modify_btn">수정</button></td>'
						returnHtml += '<td><button type="button" id="gallery_delete_submit" class="gallery_delete_btn" >삭제</button></td>'
						
							
						
						returnHtml += "</tr>"
						
					}
				}
				
				$('#galleryList1').html(returnHtml);
			}
			
	});
	

	
}

function pageGo(pageNum){
	if(pageNum == 0){
	// 이전페이지
		$('#page').val($('#prevPage').val());
		galleryList();
	}else if(pageNum == 999){
	// 다음페이지
		$('#page').val($('#nextPage').val());
		galleryList();
	}else{
		$('#page').val(pageNum);		// 사용자가 누른 페이지
		galleryList();
	}
}

//-----------------------info  수정 기능----------------------
galleryList();

//$(document).on('click', '.gallery_modify_btn', function(){
//	$.ajax({
//		type:'post',
//		url:'../bookModify',
//		data: {dic_no : $(this).parent().parent().parent().parent().parent().find("dic_no").val(),
//			   dic_name : $(this).parent().parent().parent().parent().parent().find("dic_name").val(),
//			   dic_img : $(this).parent().parent().parent().parent().parent().find("dic_img").val(),
//			   dic_content : $(this).parent().parent().parent().parent().parent().find("dic_cnt").val(),
//			   dic_heart : $(this).parent().parent().parent().parent().parent().find("dic_heart").val()},
//		success: function(data) { 
//			alert("수정이 완료됐습니다")
//		} 
		
//	}) 
	
//}) 
// -----------------------info 삭제 기능 on-------------------------- 

$(document).on('click', '.gallery_delete_btn', function(){
	alert("zmfflr")
	$.ajax({
		type:'post',
		url:'/galleryDelete',
  	data: {gal_no : $(this).parent().parent().find(".gal_no").text()},
	success: function(data){
			alert("삭제완료");
			galleryList(); 
		} 
	})
})

//----------------------------------갤러리 불러오기 -------------------------------


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
                        <h2 class="mt-4">갤러리 관리</h2>
                    
                       <div class="card mb-4" style="float: left; width: 45%; text-align: center;">
                            <div class="card-header">
                                <i class="fas fa-address-card me-1" ></i>
                   			info
                            </div>
                            <form action="/admin_post/search" method="get">
                            	<div class="search">
                            		<input name="keyword" type="text" placeholder="검색어를 입력해주세요">
      
                            	</div>
                            	<input type="submit" style="float: right;" value="검색">
                            </form>
                            
                                
                            
                            <div class="">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>글번호</th>
                                            <th>제목</th>
                                            <th>상세보기</th>
                                            <th>수정</th>
                                            <th>삭제</th>
                                            
                                        </tr>
                                    </thead>
                                  
                                    <tbody id="galleryList1">
                                    	
                                    	
                                    </tbody>
                                </table>
                            </div>
                            <!--  page -->
                              <a href="javascript:pageGo(0)">이전</a>
                             <div class="userpage" id="pageId"> </div>
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