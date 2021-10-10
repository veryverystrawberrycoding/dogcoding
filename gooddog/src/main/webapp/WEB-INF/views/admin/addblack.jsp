
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	

<!DOCTYPE html>
<html style="background: white;">


<%
String userid = (String)request.getParameter("userid");
%>

<head>
<meta charset="UTF-8">
<title>addBlack</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">


<!-- Bootstrap cdn -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">


<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="/Food/resources/js/vendor/modernizr-2.8.3.min.js"></script>
<script type="text/javascript">

$(function(){
	
	// add 버튼 클릭시 
	$('#add').click(function(){
		var userid = $('#userid').text()
		var black_content = $('#black_content').val()
		var term = $('#term').val()
		
		// id,사유,기간 컨트롤러로 값 보내기
		$.ajax({
			url:"blackadd.do", 
			type:"POST",
			data:{user_id:userid,black_content:black_content,term:term}, 
			success:function(result){
			alert(result);
				opener.location.reload();
				window.close();
			},error:function(request, status, error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}					
		});
		
			
		});
});

</script>


   <style>
   
   .add-select-list{
      display:flex;
      justify-content: center;
   }
   .blackwindow{
      display:flex;
      justify-content: center;
   }
   
   </style>
</head>
<body>

	<form style="margin-top: 10%;" name="frm" id="frm1">

		<div style="text-align: center;">
			<div class="add-group">
				<div class="addrow">
					<label class="add-black-label pull-right-pro">아이디</label><br/>
					<label class="add-black-label pull-right-pro">정지사유</label> 
				</div>
			</div>
			<div class="add-group">
				<div class="addrow">
					
					<div class=add-input id=userid><%= userid  %></div><br/>
					<input type="text" class="add-input" id= black_content name="black_content"/>

				</div>
			</div>
<!-- 			<div class="form-group-inner"> -->
<!-- 				<div class="addrow"> -->
					
<!-- 				</div> -->
<!-- 			</div> -->
		</div>
		<br/>
		<br/>
		
		<div class="add-select-list">
			<select class="add-select custom-select-value" name="select" id=term >
				<option>3 Day</option>
				<option>7 Day</option>
				<option>30 Day</option>
				<option>1000 Year</option>
			</select>
		</div>
		<br />
		<br />
		<div class="blackwindow">
	
			<a href="#" id="add">Add</a> &nbsp;&nbsp; <a href="" onclick="window.close()">Cancel</a>

		</div>

	</form>
</body>
</html>