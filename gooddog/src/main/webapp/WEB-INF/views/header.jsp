<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<title>header</title>
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
	<link rel="stylesheet" href="${path}/resources/css/main-gooddog.css" class="color-switcher-link">
	<script src="${path}/resources/js/vendor/modernizr-custom.js"></script>

	<!--[if lt IE 9]>
		<script src="js/vendor/html5shiv.min.js"></script>
		<script src="js/vendor/respond.min.js"></script>
		<script src="js/vendor/jquery-1.12.4.min.js"></script>
	<![endif]-->

</head> 


<body>
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

			<!-- template sections -->
			<section class="page_toplogo ls s-pt-45 s-pb-40 d-none d-lg-block">
				<div class="container-fluid">
					<div class="row align-items-center">
						<div class="col-lg-3">
							<div class="">
								<a href="./mainPage" class="logo">
									<img src="${path}/resources/images/logo2.png" alt="logo">
								</a>
							</div>
						</div>
						</div>
				</div>
			</section>

<!-- header with two Bootstrap columns - left for logo and right for navigation and includes (search, social icons, additional links and buttons etc -->			
 <header class="page_header ls bg-maincolor4 main-style">
            <div class="container-fluid">
               <div class="row align-items-center">
                  <div class="col-xl-12">
                     <div class="nav-wrap header-main">
                         <img src="${path}/resources/images/logo_white.png" alt="GoodDog">
                      
                        <!-- main nav start -->
                        <nav class="top-nav">
                           <ul class="nav sf-menu">
 	
<!--                              <li class="active">
                                 <a href="index.html">Home</a>
                                 <ul>
                                    <li>
                                       <a href="index.html">MultiPage</a>
                                    </li>
                                    <li>
                                       <a href="index_static.html">Static Intro</a>
                                    </li>
                                    <li>
                                       <a href="index_singlepage.html">Single Page</a>
                                    </li>
                                 </ul>
                              </li>  -->

                              <li>
                                 <a href="mapList">Map</a>
  <!--                                <ul>

                                    <li>
                                       <a href="about.html">About</a>
                                    </li>

                                    features
                                    <li>
                                       <a href="shortcodes_iconbox.html">Shortcodes</a>
                                       <ul>
                                          <li>
                                             <a href="shortcodes_typography.html">Typography</a>
                                          </li>
                                          <li>
                                             <a href="shortcodes_buttons.html">Buttons</a>
                                          </li>
                                          <li>
                                             <a href="shortcodes_pricing.html">Pricing</a>
                                          </li>
                                          <li>
                                             <a href="shortcodes_iconbox.html">Icon Boxes</a>
                                          </li>
                                          <li>
                                             <a href="shortcodes_progress.html">Progress</a>
                                          </li>
                                          <li>
                                             <a href="shortcodes_tabs.html">Tabs &amp; Collapse</a>
                                          </li>
                                          <li>
                                             <a href="shortcodes_bootstrap.html">Bootstrap Elements</a>
                                          </li>
                                          <li>
                                             <a href="shortcodes_animation.html">Animation</a>
                                          </li>
                                          <li>
                                             <a href="shortcodes_icons.html">Template Icons</a>
                                          </li>
                                          <li>
                                             <a href="shortcodes_socialicons.html">Social Icons</a>
                                          </li>
                                       </ul>
                                    </li>
                                    eof shortcodes

                                    <li>
                                       <a href="shortcodes_widgets_default.html">Widgets</a>
                                       <ul>
                                          <li>
                                             <a href="shortcodes_widgets_default.html">Default Widgets</a>
                                          </li>
                                          <li>
                                             <a href="shortcodes_widgets_shop.html">Shop Widgets</a>
                                          </li>
                                          <li>
                                             <a href="shortcodes_widgets_custom.html">Custom Widgets</a>
                                          </li>
                                       </ul>

                                    </li>

                                    shop
                                    <li>
                                       <a href="shop-right.html">Shop</a>
                                       <ul>
                                          <li>
                                             <a href="shop-account-dashboard.html">Account</a>
                                             <ul>

                                                <li>
                                                   <a href="shop-account-details.html">Account details</a>
                                                </li>
                                                <li>
                                                   <a href="shop-account-addresses.html">Addresses</a>
                                                </li>
                                                <li>
                                                   <a href="shop-account-address-edit.html">Edit Address</a>
                                                </li>
                                                <li>
                                                   <a href="shop-account-orders.html">Orders</a>
                                                </li>
                                                <li>
                                                   <a href="shop-account-order-single.html">Single Order</a>
                                                </li>
                                                <li>
                                                   <a href="shop-account-downloads.html">Downloads</a>
                                                </li>
                                                <li>
                                                   <a href="shop-account-password-reset.html">Password Reset</a>
                                                </li>
                                                <li>
                                                   <a href="shop-account-login.html">Login/Logout</a>
                                                </li>

                                             </ul>
                                          </li>
                                          <li>
                                             <a href="shop-right.html">Right Sidebar</a>
                                          </li>
                                          <li>
                                             <a href="shop-left.html">Left Sidebar</a>
                                          </li>
                                          <li>
                                             <a href="shop-product-right.html">Product Right Sidebar</a>
                                          </li>
                                          <li>
                                             <a href="shop-product-left.html">Product Left Sidebar</a>
                                          </li>
                                          <li>
                                             <a href="shop-cart.html">Cart</a>
                                          </li>
                                          <li>
                                             <a href="shop-checkout.html">Checkout</a>
                                          </li>
                                          <li>
                                             <a href="shop-order-received.html">Order Received</a>
                                          </li>

                                       </ul>
                                    </li>
                                    eof shop

                                    events
                                    <li>
                                       <a href="events-left.html">Events</a>
                                       <ul>
                                          <li>
                                             <a href="events-left.html">Left Sidebar</a>
                                          </li>
                                          <li>
                                             <a href="events-right.html">Right Sidebar</a>
                                          </li>
                                          <li>
                                             <a href="events-full.html">Full Width</a>
                                          </li>
                                          <li>
                                             <a href="event-single-left.html">Single Event</a>
                                             <ul>
                                                <li>
                                                   <a href="event-single-left.html">Left Sidebar</a>
                                                </li>
                                                <li>
                                                   <a href="event-single-right.html">Right Sidebar</a>
                                                </li>
                                                <li>
                                                   <a href="event-single-full.html">Full Width</a>
                                                </li>
                                             </ul>
                                          </li>
                                       </ul>
                                    </li>
                                    eof events

                                    <li>
                                       <a href="team.html">Team</a>
                                       <ul>
                                          <li>
                                             <a href="team.html">Team</a>
                                          </li>
                                          <li>
                                             <a href="team-single.html">Team Member</a>
                                          </li>
                                       </ul>
                                    </li>
                                    <li>
                                       <a href="comingsoon.html">Comingsoon</a>
                                    </li>

                                    <li>
                                       <a href="faq.html">FAQ</a>
                                       <ul>
                                          <li>
                                             <a href="faq.html">FAQ</a>
                                          </li>
                                          <li>
                                             <a href="faq2.html">FAQ 2</a>
                                          </li>
                                       </ul>
                                    </li>
                                    <li>
                                       <a href="404.html">404</a>
                                    </li>

                                 </ul> 
                                 -->
                              </li>
                              <!-- eof pages -->
                              <li>
                                 <a href="galleryList">Gallery</a>
 <!--                                 <ul>
                                    <li>
                                       <a href="services.html">Programs 1</a>
                                    </li>
                                    <li>
                                       <a href="services2.html">Programs 2</a>
                                    </li>
                                    <li>
                                       <a href="service-single.html">Single Program</a>
                                    </li>
                                 </ul> -->
                              </li>
                              <!-- eof services -->
                              <li>
                                 <a href="bookList">Info</a>
<!--                                  <div class="mega-menu">
                                    <ul class="mega-menu-row">
                                       <li class="mega-menu-col">
                                          <a href="#">Headers</a>
                                          <ul>
                                             <li>
                                                <a href="header1.html">Header Type 1</a>
                                             </li>
                                             <li>
                                                <a href="header2.html">Header Type 2</a>
                                             </li>
                                             <li>
                                                <a href="header3.html">Header Type 3</a>
                                             </li>
                                             <li>
                                                <a href="header4.html">Header Type 4</a>
                                             </li>
                                             <li>
                                                <a href="header5.html">Header Type 5</a>
                                             </li>
                                             <li>
                                                <a href="header6.html">Header Type 6</a>
                                             </li>
                                          </ul>
                                       </li>
                                       <li class="mega-menu-col">
                                          <a href="#">Side Menus</a>
                                          <ul>
                                             <li>
                                                <a href="header-side.html">Push Left</a>
                                             </li>
                                             <li>
                                                <a href="header-side-right.html">Push Right</a>
                                             </li>
                                             <li>
                                                <a href="header-side-slide.html">Slide Left</a>
                                             </li>
                                             <li>
                                                <a href="header-side-slide-right.html">Slide Right</a>
                                             </li>
                                             <li>
                                                <a href="header-side-sticked.html">Sticked Left</a>
                                             </li>
                                             <li>
                                                <a href="header-side-sticked-right.html">Sticked Right</a>
                                             </li>
                                          </ul>
                                       </li>
                                       <li class="mega-menu-col">
                                          <a href="title1.html">Title Sections</a>
                                          <ul>
                                             <li>
                                                <a href="title1.html">Title section 1</a>
                                             </li>
                                             <li>
                                                <a href="title2.html">Title section 2</a>
                                             </li>
                                             <li>
                                                <a href="title3.html">Title section 3</a>
                                             </li>
                                             <li>
                                                <a href="title4.html">Title section 4</a>
                                             </li>
                                             <li>
                                                <a href="title5.html">Title section 5</a>
                                             </li>
                                             <li>
                                                <a href="title6.html">Title section 6</a>
                                             </li>
                                          </ul>
                                       </li>
                                       <li class="mega-menu-col">
                                          <a href="footer1.html#footer">Footers</a>
                                          <ul>
                                             <li>
                                                <a href="footer1.html#footer">Footer Type 1</a>
                                             </li>
                                             <li>
                                                <a href="footer2.html#footer">Footer Type 2</a>
                                             </li>
                                             <li>
                                                <a href="footer3.html#footer">Footer Type 3</a>
                                             </li>
                                             <li>
                                                <a href="footer4.html#footer">Footer Type 4</a>
                                             </li>
                                             <li>
                                                <a href="footer5.html#footer">Footer Type 5</a>
                                             </li>
                                             <li>
                                                <a href="footer6.html#footer">Footer Type 6</a>
                                             </li>
                                          </ul>
                                       </li>
                                       <li class="mega-menu-col">
                                          <a href="copyright1.html#copyright">Copyright</a>

                                          <ul>
                                             <li>
                                                <a href="copyright1.html#copyright">Copyright 1</a>
                                             </li>
                                             <li>
                                                <a href="copyright2.html#copyright">Copyright 2</a>
                                             </li>
                                             <li>
                                                <a href="copyright3.html#copyright">Copyright 3</a>
                                             </li>
                                             <li>
                                                <a href="copyright4.html#copyright">Copyright 4</a>
                                             </li>
                                             <li>
                                                <a href="copyright5.html#copyright">Copyright 5</a>
                                             </li>
                                             <li>
                                                <a href="copyright6.html#copyright">Copyright 6</a>
                                             </li>
                                          </ul>
                                       </li>

                                    </ul>
                                 </div> --> <!-- eof mega menu -->
                              </li>
                              <!-- eof features -->
                              <!-- gallery -->
                              <li>
                                 <a href="friend">Friend</a>
<!--                                  <ul>
                                    Gallery image only
                                    <li>
                                       <a href="gallery-image.html">Regular</a>
                                       <ul>
                                          <li>
                                             <a href="gallery-image-2-cols.html">2 columns</a>
                                          </li>
                                          <li>
                                             <a href="gallery-image.html">3 columns</a>
                                          </li>
                                          <li>
                                             <a href="gallery-image-4-cols-fullwidth.html">4 columns fullwidth</a>
                                          </li>

                                       </ul>
                                    </li>
                                    eof Gallery image only

                                    Gallery with title
                                    <li>
                                       <a href="gallery-title.html">Image With Title</a>
                                       <ul>
                                          <li>
                                             <a href="gallery-title-2-cols.html">2 columns</a>
                                          </li>
                                          <li>
                                             <a href="gallery-title.html">3 column</a>
                                          </li>
                                          <li>
                                             <a href="gallery-title-4-cols-fullwidth.html">4 columns fullwidth</a>
                                          </li>
                                       </ul>
                                    </li>
                                    eof Gallery with title

                                    Gallery with excerpt
                                    <li>
                                       <a href="gallery-excerpt.html">Extended</a>
                                       <ul>
                                          <li>
                                             <a href="gallery-excerpt-2-cols.html">2 columns</a>
                                          </li>
                                          <li>
                                             <a href="gallery-excerpt.html">3 column</a>
                                          </li>
                                          <li>
                                             <a href="gallery-excerpt-4-cols-fullwidth.html">4 columns fullwdith</a>
                                          </li>
                                       </ul>
                                    </li>
                                    eof Gallery with excerpt

                                    <li>
                                       <a href="gallery-tiled.html">Tiled Gallery</a>
                                    </li>

                                    Gallery item
                                    <li>
                                       <a href="gallery-single.html">Gallery Item</a>
                                       <ul>
                                          <li>
                                             <a href="gallery-single.html">Style 1</a>
                                          </li>
                                          <li>
                                             <a href="gallery-single2.html">Style 2</a>
                                          </li>
                                       </ul>
                                    </li>
                                    eof Gallery item
                                 </ul> -->
                              </li>
                              <!-- eof Gallery -->
                              <!-- contacts -->
                              <li>
                                 <a href="chatpage.do">Chat</a>
<!--                                  <ul>
                                    <li>
                                       <a href="contact.html">Contact 1</a>
                                    </li>
                                    <li>
                                       <a href="contact2.html">Contact 2</a>
                                    </li>
                                    <li>
                                       <a href="contact3.html">Contact 3</a>
                                    </li>
                                    <li>
                                       <a href="contact4.html">Contact 4</a>
                                    </li>
                                 </ul> -->
                              </li>
                              <!-- eof contacts -->
                              <!-- blog -->
                              <li>
                                 <a href="lossList">Find</a>
                                 <ul>

                                    <li>
                                       <a href="lossList">실종신고 목록</a>
                                    </li>
                                    <li>
                                       <a href="lossInsert">실종신고서 작성</a>
                                    </li>


                                 </ul>
                              </li>
                              <!-- eof blog -->
                           </ul>
				
                        </nav>
                <div id="login-header">	
					<c:if test="${empty sessionScope.user }">
					<div id="login-header" style="display:flex;">
						<div style=margin-left:30px;><a href="loginForm">로그인</a></div>
						<div style=margin-left:30px;><a href="joinForm">회원가입</a></div>
					</div>
					</c:if>
					<c:if test="${not empty sessionScope.user}">

					<div id="login-header" style="display:flex;">
						<%-- <img src="/resources/images/profile/${user.user_img}" width="30px" height="30px"> --%>
						<div style=margin-right:30px;>${user.user_nick}</div>
						<div style=margin-right:30px;><a href="mypageModify">마이 페이지</a></div>
						<div style=margin-right:30px;><a href="/logout" id="session_logout">로그아웃</a></div>

					</div> 
					</c:if>
				</div>
                        <!-- eof main nav -->
<!--       
                  <span class="mr-5">
							<a href="#" class="search_modal_button hidden-below-xl">
								<i class="fa fa-search"></i>
							</a>
						</span> 
-->
                        
                      </div>
                  </div>
               </div>
            </div>
            
            
            
            <!-- header toggler -->
            <span class="toggle_menu"><span></span></span>
         </header>
         
		</div><!-- eof #box_wrapper -->
	</div><!-- eof #canvas -->
 <!-- header end --> 
 
	<script src="${path}/resources/js/compressed.js"></script>
	<script src="${path}/resources/js/main.js"></script>
</body>
</html>