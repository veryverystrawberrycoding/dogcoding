<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<title>GoodDog_main</title>
	<meta charset="utf-8">
	<!--[if IE]>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<![endif]-->
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->

	<link rel="stylesheet" href="../../resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="../../resources/css/animations.css">
	<link rel="stylesheet" href="../../resources/css/font-awesome.css">
	<link rel="stylesheet" href="../../resources/css/main-gooddog.css" class="color-switcher-link">
	<script src="../../resources/js/vendor/modernizr-custom.js"></script>

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
	<div id="canvas">
		<div id="box_wrapper">

			<section id="offer" class="section-offers ls s-py-60 s-py-md-90 s-py-xl-160">
				<div class="container">				
					<div class="row">
						<div class="col-12 col-xl-8 offset-xl-2 text-center mt--5">
							<div class="mt-100 hidden-below-xl"></div>
							<div class="mt-55 hidden-above-xl"></div>
						</div>
						<div class="row c-gutter-40">
							<div class="col-xl-4 col-md-6 left">
								<div class="media icon-special text-xl-right">
									<div class="media-body">
										<h5 class="links-darkgrey">
											<a href="./map_List">Map</a>
										</h5>
										<p>
											강아지 동반 장소 찾기<br/>											 
										</p>
									</div>
									<div class="icon-styled">
										<img src="../../resources/images/icons/04.png" alt="img">
									</div>
								</div>
								<div class="mt-55 hidden-below-lg"></div>
								<div class="mt-40 hidden-above-lg"></div>
								<div class="media icon-special mr-xl-4 text-xl-right">
									<div class="media-body">
										<h5 class="links-darkgrey">
											<a href="./gallery_List">Gallery</a>
										</h5>
										<p>
											우리 강아지 자랑하기
										</p>
									</div>
									<div class="icon-styled">
										<img src="../../resources/images/icons/05.png" alt="img">
									</div>
								</div>
								<div class="mt-55 hidden-below-lg"></div>
								<div class="mt-40 hidden-above-lg"></div>
								<div class="media icon-special text-xl-right">
									<div class="media-body">
										<h5 class="links-darkgrey">
											<a href="./book_List">Info</a>
										</h5>
										<p>
											강아지 백과사전
										</p>
									</div>
									<div class="icon-styled">
										<img src="../../resources/images/icons/06.png" alt="img">
									</div>
								</div>
							</div>
							<div class="col-xl-4 hidden-below-xl"></div>
							<div class="col-xl-4 col-md-6 mt-40 mt-md-0">
								<div class="media icon-special">
									<div class="icon-styled">
										<img src="../../resources/images/icons/01.png" alt="img">
									</div>
									<div class="media-body">
										<h5 class="links-darkgrey">
											<a href="./friend_Page">Friend</a>
										</h5>
										<p>
											우리 동네 강아지를 찾아요<br/>
											
										</p>
									</div>
								</div>
								<div class="mt-55 hidden-below-lg"></div>
								<div class="mt-40 hidden-above-lg"></div>
								<div class="media icon-special ml-xl-4">
									<div class="icon-styled">
										<img src="../../resources/images/icons/02.png" alt="img">
									</div>
									<div class="media-body">
										<h5 class="links-darkgrey">
											<a href="./chat_Page">Chat</a>
										</h5>
										<p>
											친구랑 이야기하기 
										</p>
									</div>
								</div>
								<div class="mt-55 hidden-below-lg"></div>
								<div class="mt-40 hidden-above-lg"></div>
								<div class="media icon-special">
									<div class="icon-styled">
										<img src="../../resources/images/icons/03.png" alt="img">
									</div>
									<div class="media-body">
										<h5 class="links-darkgrey">
											<a href="./calling_List">Security Program</a>
										</h5>
										<p>
											실종신고
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="mt-80 hidden-below-xl"></div>
				</div>
				<div class="chatbot-icon">
					<img class=icons src="../../resources/images/icons/dog-solid.svg" width="50px" alt="img">
					<img class=icons src="../../resources/images/icons/comments-solid.svg" width="50px" alt="img">
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
											<a href="№">http://on.bcg.com/2enKlr7</a>
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
											<a href="№">http://on.bcg.com/2enKlr7</a>
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


	<script src="../../resources/js/compressed.js"></script>
	<script src="../../resources/js/main.js"></script>


</body>
</html>