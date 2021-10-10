<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="UTF-8">
	<title>Venator</title>

	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->

	<link rel="stylesheet" href="${path}/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="${path}/resources/css/animations.css">
	<link rel="stylesheet" href="${path}/resources/css/font-awesome.css">
	<link rel="stylesheet" href="${path}/resources/css/userCSS/fe.css"> 
	<link rel="stylesheet" href="${path}/resources/css/userCSS/main-gooddog.css" class="color-switcher-link">
	 
		<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Single+Day&display=swap" rel="stylesheet">
	
	<script src="${path}/resources/js/vendor/modernizr-custom.js"></script>



<style >

		.chat{ 
			margin-top: auto;
			margin-bottom: auto;
		}
		.card{
			
			height: 500px;
			border-radius: 15px !important;
			background-color: rgba(235,149,141,0.6) !important;
		} 
		.contacts_body{
			padding:  0.75rem 0 !important;
			overflow-y: auto;
			white-space: nowrap;
		}
		.msg_card_body{
			overflow-y: auto;
		}
		.card-header{
			border-radius: 15px 15px 0 0 !important;
			border-bottom: 0 !important;
		}
	 .card-footer{
		border-radius: 0 0 15px 15px !important;
			border-top: 0 !important;
	}
		.container{
			align-content: center;
		}
		.search{
			border-radius: 15px 0 0 15px !important;
			background-color: rgba(0,0,0,0.3) !important;
			border:0 !important;
			color:white !important;
		}
		.search:focus{
		     box-shadow:none !important;
           outline:0px !important;
		}
		.type_msg{
			background-color: rgba(0,0,0,0.3) !important;
			border:0 !important;
			color:white !important;
			height: 60px !important;
			overflow-y: auto;
		}
			.type_msg:focus{
		     box-shadow:none !important;
           outline:0px !important;
		}
		.attach_btn{
	border-radius: 15px 0 0 15px !important;
	background-color: rgba(0,0,0,0.3) !important;
			border:0 !important;
			color: white !important;
			cursor: pointer;
		}
		.send_btn{
	border-radius: 0 15px 15px 0 !important;
	background-color: rgba(0,0,0,0.3) !important;
			border:0 !important;
			color: white !important;
			cursor: pointer;
		}
		.search_btn{
			border-radius: 0 15px 15px 0 !important;
			background-color: rgba(0,0,0,0.3) !important;
			border:0 !important;
			color: white !important;
			cursor: pointer;
		}
		.contacts{
			list-style: none;
			padding: 0;
		}
		.contacts li{
			width: 100% !important;
			padding: 5px 10px;
			margin-bottom: 15px !important;
		}
	.active{
			background-color: rgba(0,0,0,0.3);
	}
		.user_img{
			height: 70px;
			width: 70px;
			border:1.5px solid #f5f6fa;
		
		}
		.user_img_msg{
			height: 40px;
			width: 40px;
			border:1.5px solid #f5f6fa;
		
		}
	.img_cont{
			position: relative;
			height: 70px;
			width: 70px;
	}
	.img_cont_msg{
			height: 40px;
			width: 40px;
	}
	.online_icon{
		position: absolute;
		height: 15px;
		width:15px;
		background-color: #4cd137;
		border-radius: 50%;
		bottom: 0.2em;
		right: 0.4em;
		border:1.5px solid white;
	}
	.offline{
		background-color: #c23616 !important;
	}
	.user_info{
		margin-top: auto;
		margin-bottom: auto;
		margin-left: 15px;
	}
	.user_info span{
		font-size: 20px;
		color: white;
	}
	.user_info p{
	font-size: 10px;
	color: rgba(255,255,255,0.6);
	}
	.video_cam{
		margin-left: 50px;
		margin-top: 5px;
	}
	.video_cam span{
		color: white;
		font-size: 20px;
		cursor: pointer;
		margin-right: 20px;
	}
	.msg_cotainer{
		margin-top: auto;
		margin-bottom: auto;
		margin-left: 10px;
		border-radius: 25px;
		background-color: #82ccdd;
		padding: 10px;
		position: relative;
	}
	.msg_cotainer_send{
		margin-top: auto;
		margin-bottom: auto;
		margin-right: 10px;
		border-radius: 25px;
		background-color: #78e08f;
		padding: 10px;
		position: relative;
	}
	.msg_time{
		position: absolute;
		left: 0;
		bottom: -15px;
		color: rgba(255,255,255,0.5);
		font-size: 10px;
	}
	.msg_time_send{
		position: absolute;
		right:0;
		bottom: -15px;
		color: rgba(255,255,255,0.5);
		font-size: 10px;
	}
	.msg_head{
		position: relative;
	}
	#action_menu_btn{
		position: absolute;
		right: 10px;
		top: 10px;
		color: white;
		cursor: pointer;
		font-size: 20px;
	}
	.action_menu{
		z-index: 1;
		position: absolute;
		padding: 15px 0;
		background-color: rgba(0,0,0,0.5);
		color: white;
		border-radius: 15px;
		top: 30px;
		right: 15px;
		display: none;
	}
	.action_menu ul{
		list-style: none;
		padding: 0;
	margin: 0;
	}
	.action_menu ul li{
		width: 100%;
		padding: 10px 15px;
		margin-bottom: 5px;
	}
	.action_menu ul li i{
		padding-right: 10px;
	
	}
	.action_menu ul li:hover{
		cursor: pointer;
		background-color: rgba(0,0,0,0.2);
	}
	@media(max-width: 576px){
	.contacts_card{
		margin-bottom: 15px !important;
		background-color:red; 
	} 
	} 
	
	


</style>
	<!--[if lt IE 9]>
		<script src="js/vendor/html5shiv.min.js"></script>
		<script src="js/vendor/respond.min.js"></script>
		<script src="js/vendor/jquery-1.12.4.min.js"></script>
	<![endif]-->

</head>

<body>
<%@ include file="./header.jsp"%> 
		
	<br><br>
	<h2 style="text-align:center;"><Strong>친구 추천</Strong></h2>
	<br>
		<section class="container">
	<div class="row total_friend_hi">
        
 	</div>
 
			<br>
			<hr>
			<br>
			<h2 style="text-align:center;"><Strong>메신저</Strong></h2>
			<br>
			</section> 
			<div class="container-fluid h-100 w-75">
			<div class="row justify-content-center h-100">
				<div class="col-sm-4 col-xl-3 chat f-left-color"><div class="card mb-sm-3 mb-md-0 contacts_card">
					<div class="card-header"> 
						<div class="input-group">
							<input type="text" placeholder="친구이름을 입력해주세요" name="" class="form-control search">
							<div class="input-group-prepend"> 
								<span class="input-group-text search_btn"></span>
							</div>  
						</div>
					</div>
					<div class="card-body contacts_body">
					<div class="row">
					<div class="col-sm-6 following" style="text-align:center; height:30px;cursor:pointer; color:#FF6F61;"><Strong>팔로잉</Strong></div>
					<div class="col-sm-6 follower" style="text-align:center; cursor:pointer; color:white;"><Strong>팔로워</Strong></div>
					</div>
						<ui class="contacts total_friend_view">  
					
						</ui>
						 
					</div>
					<div class="card-footer"></div>
				</div>
				 
				</div>
				<div class="col-sm-8 col-xl-6 chat f-right-color">
					<div class="card"> 
						<div class="card-header msg_head">
						<input id="hidden_id" type="hidden" value="${user.user_id}">
							<div class="d-flex bd-highlight">
								<div class="img_cont">
									<img src="" class="rounded-circle user_img" style="display:none">
								</div>   
								<div class="user_info">
									<span class="user_nick_click"></span>
									<input type="hidden" class="user_id_click">
								</div>
								<div class="video_cam">
									<span><i class="fas fa-video"></i></span>
								</div>
							</div>
							<span id="action_menu_btn"></span>
							<div class="action_menu">
								<ul>
									<li><i class="fas fa-user-circle"></i> View profile</li>
									<li><i class="fas fa-users"></i> Add to close friends</li>
									<li><i class="fas fa-plus"></i> Add to group</li>
									<li><i class="fas fa-ban"></i> Block</li>
								</ul>
							</div>
						</div>
						<div class="card-body msg_card_body" id="chat-box">
							
						
							
							
						
						</div>
						<div class="card-footer">
							<div class="input-group">
								<div class="input-group-append"> 
									<span class="input-group-text attach_btn"></span>
								</div>
								<textarea style="color:white" id="chat-outgoing-msg" name="" class="form-control type_msg"></textarea>
								<div class="input-group-append">
									<span id="chat-outgoing-button" class="input-group-text send_btn"></span>
								</div>
							</div> 
						</div> 
					</div>
				</div>
			</div>
		</div>
		 

	 <%@ include file="./footer.jsp"%> 


		</div><!-- eof #box_wrapper -->
	</div><!-- eof #canvas -->


	<script src="${path}/resources/js/compressed.js"></script>
	<script src="${path}/resources/js/main.js"></script>
	<script src="${path}/resources/js/userJS/myPage.js"></script>
 	<script src="${path}/resources/js/userJS/friends.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
		$('#action_menu_btn').click(function(){
		$('.action_menu').toggle();
		});
	});
	function followingList() {
	$.ajax({
		type:'post',
		url: 'followingList',
		success: function(data){ 
			$(".total_friend_view").empty();
			const obj = JSON.parse(data);
			var list = obj.frList 
			for(var i=0; i<list.length; i++){
			fdview=''
			fdview += '<li><div class="d-flex bd-highlight"><div class="img_cont">'
			fdview += '<img style="cursor:pointer" class= "rounded-circle user_img friend_img profile_click" src="/resources/images/userimg/'+list[i].follower_img+'" alt="img">'
			fdview += '</div><div class="user_info">' 
			fdview += '<span class="chat_content" style="cursor:pointer;"><Strong>'+list[i].follower_nick+'</Strong></span><p style="font-size:12px;">'+list[i].follower_name+'</p></div></div>'
			fdview += '<input type="hidden" class="friend_id" value="'+list[i].follower_id+'"></li>' 
			$(".total_friend_view").append(fdview);     
			}  
		} 
	 
	})  

}	


	</script>
	
	
</body>

</html>