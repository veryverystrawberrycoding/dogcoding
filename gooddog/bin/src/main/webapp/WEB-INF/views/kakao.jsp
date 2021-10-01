<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="javascript:KaKaoLogin();">바로가기</a> 
 
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
 
<script type="text/javascript">
window.Kakao.init("642ff7e33e3a3a4b25807e13db8e64b6");
 
function KaKaoLogin() {
	window.Kakao.Auth.login({ 
	scope: 'profile_nickname, account_email, gender, birthday',
	success: function(authObj) {
	console.log(autoObj);
	window.Kakao.API.request({
	url:'/v2/user/me', 
	success: res => {
		const kakao_account = res.kakao_account;
	console.log(kakao_account);
	} 

}) 
}
})  
}

</script>

</body>
</html>