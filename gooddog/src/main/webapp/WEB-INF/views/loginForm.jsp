<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
 
<head>
	<title>GoodDog Login</title>
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
	<link rel="stylesheet" href="${path}/resources/css/shop.css" class="color-switcher-link">
	<script src="${path}/resources/js/vendor/modernizr-custom.js"></script>

	<!--[if lt IE 9]>
		<script src="js/vendor/html5shiv.min.js"></script>
		<script src="js/vendor/respond.min.js"></script>
		<script src="js/vendor/jquery-1.12.4.min.js"></script>
	<![endif]-->

</head>

<body>




<%@ include file="./header.jsp" %>




			<section class="ls s-py-60 s-py-md-90 s-py-xl-160">
				<div class="container">
					<div class="row">

						<main class="col-lg-12">
							<article>
								<!-- .entry-header -->
								<div class="entry-content">
									<div class="woocommerce">


										<div class="login-title">
										<h2>Log in</h2>
										</div>


										<form class="woocomerce-form woocommerce-form-login login" method="post" width:50%>
											<p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide text-center">

												<input type="text" placeholder="이메일" class="w-100 form-control woocommerce-Input woocommerce-Input--text input-text" name="username" id="username" value="">
											</p>
											<p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide text-center">

												<input class="w-100 form-control woocommerce-Input woocommerce-Input--text input-text" placeholder="비밀번호*" type="password" name="password" id="password">
											</p>

											<!-- <p class=" d-flex justify-content-start align-items-center">
												<label class="d-flex align-items-center woocommerce-form__label woocommerce-form__label-for-checkbox inline">
													<input class="woocommerce-form__input woocommerce-form__input-checkbox" name="rememberme" type="checkbox" id="rememberme" value="forever">
													<span>Remember me</span>
												</label>
											</p> -->
											<div style="color:red" id="id_pwd_error"></div>
											<br>
											 
											<div class="container"> 

											<div class="login-btn">
												<button type="button" class="woocommerce-Button button mt-0" name="login" id="loginClick" value="Login" style="text-align:center; ">로그인</button><br>
												<a onclick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=051d848d1ca964220e821cd809db3584&redirect_uri=http://localhost:8082/oauthkakao&response_type=code'" name="kakaologin" value="kakaologin" >
													<img src="${path}/resources/images/icons/kakao_login_medium_narrow.png" alt="카카오로그인">
												</a>
											</div>
											<div class="find-idpw">
													<div><a href="#">아이디 찾기</a></div>
													<div><a href="#">비밀번호 찾기</a></div>
											</div>
											<div class="joinMove">
													<a href="../joinForm">회원 가입</a>

											</div>	 
											    

										</form> 
									</div>
								</div>
								<!-- .entry-content -->
							</article>


						</main>

					</div>

				</div>
			</section>

			



		</div><!-- eof #box_wrapper -->
	</div><!-- eof #canvas -->
<%@ include file="./footer.jsp" %>

	<script src="${path}/resources/js/compressed.js"></script> 
	<script src="${path}/resources/js/main.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script src="${path}/resources/js/userJS/myPage.js"></script> 
	 
</body>

</html>