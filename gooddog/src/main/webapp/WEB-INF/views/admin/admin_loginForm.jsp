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
	<title>Venator</title>
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
	<link rel="stylesheet" href="${path}/resources/css/main.css" class="color-switcher-link">
	<link rel="stylesheet" href="${path}/resources/css/shop.css" class="color-switcher-link">
	<script src="${path}/resources/js/vendor/modernizr-custom.js"></script>

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
		<div class="preloader_image"></div>
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
	<div id="canvas">
		<div id="box_wrapper">

			<!-- template sections -->

			<section class="page_toplogo ls s-pt-45 s-pb-40 d-none d-lg-block" style="text-align: center;">
				<div>
					ë¡ê³ 
				</div>
			</section>

			<!-- header with two Bootstrap columns - left for logo and right for navigation and includes (search, social icons, additional links and buttons etc -->
			<header class="page_header ls bg-maincolor4 main-style">
				<div class="container-fluid">
					<div class="row align-items-center">
						<div class="col-xl-12">
							<div class="nav-wrap header-main">
								<a href="./" class="logo logo-ds">
									<img src="images/logo_ds.png" alt="img">
								</a>
								<!-- main nav start -->
								<nav class="top-nav">
									<ul class="nav sf-menu">


										<li class="active">
											<a href="#">Map</a>
											
										</li>
										<li>
											<a href="#">Gallery</a>
											
										</li>
										<!-- eof pages -->
										<li>
											<a href="#">Info</a>
										</li>
										<!-- eof services -->
										<li>
											<a href="#">Friend</a>
											
										</li>
										<!-- eof features -->
										<!-- gallery -->
										<li>
											<a href="#">Chat</a>
											
										</li>
										<!-- eof Gallery -->
										<!-- contacts -->
										<li>
											<a href="#" style="color: red;">ì ê³ íê¸°</a>
											
										</li>
										<!-- eof contacts -->
										<!-- blog -->
										
										<!-- eof blog -->
									</ul>


								</nav>
								<!-- eof main nav -->
								<span class="mr-5">
									
								</span>
								<ul class="top-includes d-none d-xl-block">
									<li>
										<span class="social-icons">
											<u>ë¡ê·¸ì¸</u>
											&nbsp;&nbsp;
											<u>íìê°ì</u>
										</span>
									</li>
								</ul>
							</div>

						</div>
					</div>
				</div>
				<!-- header toggler -->
				<span class="toggle_menu"><span></span></span>
				
			</header>

			<!-- <section class="page_title ls  s-py-5">
				<div class="container">
					<div class="row">

						<div class="col-md-12 text-center">
							<h1>Admin - Login</h1>
						</div>

					</div>
				</div>
			</section> -->


			<section class="ls s-py-60 s-py-md-90 s-py-xl-160">
				<div class="container">
					<div class="row">

						<main class="col-lg-12">
							<article>
								<!-- .entry-header -->
								<div class="entry-content">
									<div class="woocommerce">

										<!--
			<div class="woocommerce-message">Are you sure you want to log out? <a
				href="shop-account-login.html">Confirm and log out</a>
			</div>
			-->

										<form class="woocomerce-form woocommerce-form-login login" method="post" width:50%>
											<p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide text-center">

												<input type="text" placeholder="ì´ë©ì¼" class="w-100 form-control woocommerce-Input woocommerce-Input--text input-text" name="username" id="username" value="">
											</p>
											<p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide text-center">

												<input class="w-100 form-control woocommerce-Input woocommerce-Input--text input-text" placeholder="ë¹ë°ë²í¸*" type="password" name="password" id="password">
											</p>
											<!-- <p class=" d-flex justify-content-start align-items-center">
												<label class="d-flex align-items-center woocommerce-form__label woocommerce-form__label-for-checkbox inline">
													<input class="woocommerce-form__input woocommerce-form__input-checkbox" name="rememberme" type="checkbox" id="rememberme" value="forever">
													<span>Remember me</span>
												</label>
											</p> -->
											<div class="col-md-3" style="float: left;">
												<input type="submit" class="woocommerce-Button button mt-0" name="login" value="Login">
												<input type="button" class="woocommerce-Button button mt-0" value="ë¤ë¡ê°ê¸°">
											</div>
											
											<br>
											<br>
											<br>
										</form>
									</div>
								</div>
								<!-- .entry-content -->
							</article>


						</main>

					</div>

				</div>
			</section>

			<footer class="page_footer ds s-pb-35 s-pt-60 s-pb-md-70 s-pt-md-90 s-pb-xl-130 s-pt-xl-160 c-mb-20 c-gutter-30 container-px-0">

				<div class="container">
					<div class="row">
						<div class="col-lg-4 text-center text-lg-left animate" data-animation="fadeInUp">
							<div class="widget widget_twitter">
								<h3 class="widget-title">Twitter</h3>
								<div class="twitter-item">
									<div class="media">
										<div class="icon-styled color-main fs-18">
											<i class="fa fa-twitter" aria-hidden="true"></i>
										</div>
										<div class="media-body color_1">
											<p>
												Tamquam eligendi ex qui ex sea aliquam blandit has cum tacimates.
											</p>
											<a href="â">http://on.bcg.com/2enKlr7</a>
										</div>
									</div>
									<div class="media">
										<div class="icon-styled color-main fs-18">
											<i class="fa fa-twitter" aria-hidden="true"></i>
										</div>
										<div class="media-body color_1">
											<p>
												Tamquam eligendi ex qui ex sea aliquam blandit has cum tacimates.
											</p>
											<a href="â">http://on.bcg.com/2enKlr7</a>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-4 text-center text-lg-left animate" data-animation="fadeInUp">

							<div class="widget widget_icons_list">
								<h3 class="widget-title">Our Contacts</h3>

								<ul class="mb-10">
									<li class="icon-inline">
										<div class="icon-styled icon-top color-main4 fs-14">
											<i class="fa fa-map-marker"></i>
										</div>
										<p>3112 Stonecoal Road Toledo, OH 43602</p>
									</li>
									<li class="icon-inline">
										<div class="icon-styled icon-top color-main4 fs-14">
											<i class="fa fa-envelope"></i>
										</div>
										<a href="#">canis@support.com</a>
									</li>
									<li class="icon-inline">
										<div class="icon-styled icon-top color-main4 fs-14">
											<i class="fa fa-phone"></i>
										</div>
										<p>0 (800) 321 654</p>
									</li>
									<li class="icon-inline">
										<div class="icon-styled icon-top color-main4 fs-14">
											<i class="fa fa-clock-o"></i>
										</div>
										<p>Working hours: 9.00 - 20.00 </p>
									</li>
								</ul>

								<span class="social-icons">
									<a href="#" class="fa fa-twitter  rounded-icon color-bg-icon footer-icon" title="twitter"></a>
									<a href="#" class="fa fa-google  rounded-icon color-bg-icon footer-icon" title="google"></a>
									<a href="#" class="fa fa-facebook  rounded-icon color-bg-icon footer-icon" title="facebook"></a>
									<a href="#" class="fa fa-linkedin  rounded-icon color-bg-icon footer-icon" title="linkedin"></a>
								</span>
							</div>
						</div>

						<div class="col-lg-4 text-center text-lg-left animate" data-animation="fadeInUp">
							<div class="widget mb-0">

								<h3 class="widget-title">Newsletter</h3>

								<p class="color-font mb-3">
									Subscribe to our Newsletter to be updated,
									we promise not to spam.
								</p>

								<form class="signup" action="/">

									<input id="mailchimp_email" name="email" type="email" class="form-control mailchimp_email text-center text-lg-left" placeholder="Enter Email Address">

									<button type="submit" class="btn btn-maincolor mt-30">
										Subscribe
									</button>
									<div class="response"></div>
								</form>

							</div>
						</div>
					</div>
				</div>
			</footer>

			<section class="page_copyright ds s-py-5">
				<div class="container border-top-color">
					<div class="row align-items-center ">
						<div class="divider-20 d-none d-lg-block"></div>
						<div class="divider-10 d-none d-md-block d-lg-none"></div>
						<div class="col-md-12 text-center">
							<p>&copy; Copyright <span class="copyright_year">2018</span> All Rights Reserved</p>
						</div>
						<div class="divider-20 d-none d-lg-block"></div>
						<div class="divider-10 d-none d-md-block d-lg-none"></div>
					</div>
				</div>
			</section>


		</div><!-- eof #box_wrapper -->
	</div><!-- eof #canvas -->


	<script src="${path}/resources/js/compressed.js"></script>
	<script src="${path}/resources/js/main.js"></script>


</body>

</html>