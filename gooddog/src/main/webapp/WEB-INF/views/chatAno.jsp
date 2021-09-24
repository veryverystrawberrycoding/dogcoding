<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="UTF-8">
	<title>실시간 익명 채팅</title> 

	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->

	
	
	<link rel="stylesheet" href="${path}/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="${path}/resources/css/animations.css">
	<link rel="stylesheet" href="${path}/resources/css/font-awesome.css">
	<link rel="stylesheet" href="${path}/resources/css/main.css" class="color-switcher-link">
 	<link rel="stylesheet" href="${path}/resources/css/chat/chat2.css">
	<link rel="stylesheet" href="${path}/resources/css/bootstrap.css">
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="${path}/resources/js/bootstrap.js"></script>
	<link rel="preconnect" href="https://fonts.googleapis.com">
 	
	<!--[if lt IE 9]>
		<script src="js/vendor/html5shiv.min.js"></script>
		<script src="js/vendor/respond.min.js"></script>
		<script src="js/vendor/jquery-1.12.4.min.js"></script>
	<![endif]-->

</head>

<body>
	<!--[if lt IE 9]>
		<div class="bg-danger text-center">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/" class="color-main">upgrade your browser</a> to improve your experience.</div>
	<![endif]-->

	<div class="preloader">
		<div class="preloader_image pulse"></div>
	</div>

	<!-- search modal -->
	<div class="modal" tabindex="-1" role="dialog" aria-labelledby="search_modal" id="search_modal">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<div class="widget widget_search">
			<form method="get" class="searchform search-form" action="/">
				<div class="form-group">
					<input type="text" value="" name="search" class="form-control" placeholder="Search keyword" id="modal-search-input">
				</div>
				<button type="submit"></button>
			</form>
		</div>
	</div>

	<!-- Unyson messages modal -->
	<div class="modal fade" tabindex="-1" role="dialog" id="messages_modal">
		<div class="fw-messages-wrap ls p-normal">
			<!-- Uncomment this UL with LI to show messages in modal popup to your user: -->
			<!--
		<ul class="list-unstyled">
			<li>Message To User</li>
		</ul>
		-->

		</div>
	</div><!-- eof .modal -->

	<!-- wrappers for visual page editor and boxed version of template -->


			
			<!--eof topline-->
			 <!-- header start -->
    	 <%@ include file ="/WEB-INF/views/header.jsp" %>
  
 			<!-- header end --> 
		

	                    

    <div class="row">
        <div class="col-md-4 col-md-offset-4" >
            <div class="portlet portlet-default">
                <div class="portlet-heading">
                    <div class="portlet-title">
                        <h4><i class="fa fa-circle text-green"></i> 실시간 채팅</h4>
                    </div>
                    <div class="portlet-widgets">
                        
                        <span class="divider"></span>
                        <a data-toggle="collapse" data-parent="#accordion" href="#chat"></a>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div id="chat" class="panel-collapse collapse in">
                    <div>
                    <div class="portlet-body chat-widget" style="overflow-y: auto; width: auto; height: 300px;">
                        <div class="row">
                            <div class="col-lg-12">
                                <p class="text-center text-muted small">January 1, 2014 at 12:23 PM</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="media">
                                    <a class="pull-left" href="#">
                                        <img class="media-object img-circle img-chat" src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="">
                                    </a>
                                    <div class="media-body">
                                        <h4 class="media-heading">홍길동
                                            <span class="small pull-right">12:23 PM</span>
                                        </h4>
                                        <p>할로</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="media">
                                    <a class="pull-left" href="#">
                                        <img class="media-object img-circle img-chat" src="https://bootdey.com/img/Content/avatar/avatar6.png" alt="">
                                    </a>
                                    <div class="media-body">
                                        <h4 class="media-heading">이길동
                                            <span class="small pull-right">16:37 PM</span>
                                        </h4>
                                        <p>으어어</p>
                                        <p>배고파</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="media">
                                    <a class="pull-left" href="#">
                                        <img class="media-object img-circle img-chat" src="https://bootdey.com/img/Content/avatar/avatar6.png" alt="">
                                    </a>
                                    <div class="media-body">
                                        <h4 class="media-heading">이길동
                                            <span class="small pull-right">16:39 PM</span>
                                        </h4>
                                        <p>힘들어</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr>
                    </div>
                    </div>
                    <div class="portlet-footer">
						<div class="row">
						<div class="form-group col-xs-4">
							<input style="height: 30px;"  type="text" id="chatName" class="form-control" placeholder="이름" maxlength="20">
						</div>
					</div>
					<hr>
					<form role="form">
                            <div class="form-group">
                                <textarea class="form-control" placeholder="메세지를 입력해주세요."></textarea>
                            </div>
                            <div class="form-group">
                                <button type="button" class="btn btn-default pull-right">전송</button>
                                <div class="clearfix"></div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.col-md-4 -->
    </div>
           
		
		

			
  <!--   -------------------------------------------------------------------------------------------------- -->
	
<!-- footer start --> 
     <%@ include file ="/WEB-INF/views/footer.jsp" %>

</body>
<!-- footer end -->
 
</html>