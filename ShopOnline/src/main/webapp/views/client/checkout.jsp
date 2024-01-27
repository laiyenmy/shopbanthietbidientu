<%@page import="model.CartList"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/views/client/assets" var="url"></c:url>
<c:url value = "/views/admin" var="url1"></c:url>
<%
	
	List<CartList> cartlist = (ArrayList<CartList>) session.getAttribute("cartlistdata");
	int soluong = 0;
	long tongtien = 0;
	if (cartlist != null) {
		request.setAttribute("cartlist", cartlist);
		for (int i = 0; i < cartlist.size(); i++) {
			soluong = soluong + cartlist.get(i).getSl();
			tongtien = tongtien + (cartlist.get(i).getPrice() * cartlist.get(i).getSl()
			- cartlist.get(i).getDiscount() * cartlist.get(i).getSl());
		}
	
	}
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		 <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

		<title>Electro - HTML Ecommerce Template</title>

 		<!-- Google font -->
 		<link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

 		<!-- Bootstrap -->
 		<link type="text/css" rel="stylesheet" href="${url}/css/bootstrap.min.css"/>

 		<!-- Slick -->
 		<link type="text/css" rel="stylesheet" href="${url}/css/slick.css"/>
 		<link type="text/css" rel="stylesheet" href="${url}/css/slick-theme.css"/>

 		<!-- nouislider -->
 		<link type="text/css" rel="stylesheet" href="${url}/css/nouislider.min.css"/>

 		<!-- Font Awesome Icon -->
 		<link rel="stylesheet" href="${url}/css/font-awesome.min.css">

 		<!-- Custom stlylesheet -->
 		<link type="text/css" rel="stylesheet" href="${url}/css/style.css"/>
  		
  		<!-- Favicons -->
		<link href="${url1}/assets/img/favicon.png" rel="icon">

    </head>
	<body>
		<!-- HEADER -->
	<header class="header fixed-top d-flex align-items-center">
		<!-- TOP HEADER -->
		<div id="top-header"
			class="d-flex align-items-center justify-content-between">
			<div class="container">
				<ul class="header-links pull-left">
					<li><a href="#"><i class="fa fa-phone"></i>0327636651</a></li>
					<li><a href="#"><i class="fa fa-envelope-o"></i>
							laithiyenmy21032002@gmail.com</a></li>
					<li><a href="#"><i class="fa fa-map-marker"></i>Liêm Túc -
							Thanh Liêm - Hà Nam </a></li>
				</ul>
				<ul class="header-links pull-right">
					<c:if test="${sessionScope.fullname == null}">
						<li><a href="/ShopOnline/views/admin/login.jsp"><i
								class="fa fa-user-circle-o"></i> Đăng nhập</a></li>
					</c:if>
					<c:if test="${sessionScope.fullname != null}">
						<li><a href="#"><i class="fa fa-user-circle-o"></i> <%=session.getAttribute("fullname")%></a>
						</li>
					</c:if>
					&nbsp;&nbsp;
					<li><a href="myProfile"><i class="fa fa-gear"></i>Sửa Tài
							Khoản</a></li> &nbsp;&nbsp;
					<li><a href="/ShopOnline/views/admin/login.jsp"><i
							class="fa fa-reorder"></i>Đăng xuất</a></li>
				</ul>
			</div>
		</div>
		<!-- /TOP HEADER -->

		<!-- MAIN HEADER -->
		<div id="header">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<!-- LOGO -->
					<div class="col-md-3">
						<div class="header-logo">
							<a href="#" class="logo"> <img src="${url}/img/logo.png"
								alt="">
							</a>
						</div>
					</div>
				</div>
				<!-- row -->
			</div>
			<!-- container -->
		</div>
		<!-- /MAIN HEADER -->
	</header>
	<!-- /HEADER -->


		<!-- NAVIGATION -->
	<nav id="navigation">
		<!-- container -->
		<div class="container">
			<!-- responsive-nav -->
			<div id="responsive-nav">
				<!-- NAV -->
				<ul class="main-nav nav navbar-nav">
					<li class="active"><a href="/ShopOnline/index">Trang chủ</a></li>

				</ul>
				<!-- /NAV -->
			</div>
			<!-- /responsive-nav -->
		</div>
		<!-- /container -->
	</nav>
	<!-- /NAVIGATION -->


		<!-- BREADCRUMB -->
		<div id="breadcrumb" class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-md-12">
						<h3 class="breadcrumb-header">Thanh Toán</h3>
						<ul class="breadcrumb-tree">
							<li><a href="/ShopOnline/index">Trang Chủ</a></li>
							<li class="active">Thanh Toán</li>
						</ul>
					</div>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /BREADCRUMB -->

		<!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-md-7">
						<!-- Billing Details -->
						<div class="billing-details">
							<div class="section-title">
								<h3 class="title" >Thông Tin Cá Nhân</h3>
							</div>
							<div class="form-group">
								<input class="input" type="text" name="HoTen" placeholder="Họ và Tên">
							</div>
							<div class="form-group">
								<input class="input" type="email" name="Email" placeholder="Email">
							</div>
							<div class="form-group">
								<input class="input" type="text" name="DiaChi" placeholder="Địa Chỉ">
							</div>
							<div class="form-group">
								<input class="input" type="text" name="ThanhPho" placeholder="Thành Phố">
							</div>
							<div class="form-group">
								<input class="input" type="text" name="GioiTinh" placeholder="Giới Tính">
							</div>
							<div class="form-group">
								<input class="input" type="tel" name="SoDienThoai" placeholder="Số Điện Thoại">
							</div>
							
						</div>
						<!-- /Billing Details -->

						<!-- Shiping Details -->
						<div class="shiping-details">
							<div class="section-title">
								<h3 class="title">Địa Chỉ Nhận Hàng</h3>
							</div>
						</div>
						<!-- /Shiping Details -->

						<!-- Order notes -->
						<div class="order-notes">
							<textarea class="input" placeholder="Nhập Địa Chỉ"></textarea>
						</div>
						<!-- /Order notes -->
					</div>

					<!-- Order Details -->
					<div class="col-md-5 order-details">
						<div class="section-title text-center">
							<h3 class="title">Hoán Đơn</h3>
						</div>
						<div class="order-summary">
							<div class="order-col">
								<div><strong>Sản Phẩm</strong></div>
								<div><strong>Đơn Giá</strong></div>
							</div>
							<div class="order-products">
								<c:forEach items="${sessionScope.cartlistdata}" var="cart">
									<div class="order-col">
										<div>${cart.getName()}</div>
										<div>${cart.getPrice()*cart.getSl() - cart.getDiscount()*cart.getSl()}VNĐ</div>
									</div>
								</c:forEach>
							</div>
							<div class="order-col">
								<div>Phí Giao Hàng</div>
								<div><strong>FREE</strong></div>
							</div>
							<div class="order-col">
								<div><strong>Tổng Tiền</strong></div>
								<div><strong class="order-total"><%= tongtien %>VNĐ</strong></div>
							</div>
						</div>
						<div class="payment-method">
							<div class="input-radio">
								<input type="radio" name="payment" id="payment-1">
								<label for="payment-1">
									<span></span>
									Chuyển Khoản
								</label>
								<div class="caption">
									<p>Ngân hàng: Agribank </p>
									<p>STK: 3215205396941</p>
									<p>Số tiền: <%= tongtien %>VNĐ</p>
									<p>Nội dung: <%=session.getAttribute("fullname")%> </p>
									<p>Vui lòng ấn xác nhận sau khi thanh toán thành công</p>
								</div>
							</div>
							<div class="input-radio">
								<input type="radio" name="payment" id="payment-2">
								<label for="payment-2">
									<span></span>
									Trả Tiền Mặt
								</label>
								<div class="caption">
									<p>Nhận hàng sau khi thanh toán</p>
								</div>
							</div>
						</div>
						<a href="/ShopOnline/insert-order" class="primary-btn order-submit">Đặt Hàng</a>
					</div>
					<!-- /Order Details -->
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->

		<!-- NEWSLETTER -->
		<div id="newsletter" class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-md-12">
						<div class="newsletter">
							<p>Đăng Ký <strong> Nhận Thông Báo Tình Trạng Đơn Hàng Qua Email</strong></p>
							<form>
								<input class="input" type="email" placeholder="Enter Your Email">
								<button class="newsletter-btn"><i class="fa fa-envelope"></i> Subscribe</button>
							</form>
							<ul class="newsletter-follow">
								<li>
									<a href="#"><i class="fa fa-facebook"></i></a>
								</li>
								<li>
									<a href="#"><i class="fa fa-twitter"></i></a>
								</li>
								<li>
									<a href="#"><i class="fa fa-instagram"></i></a>
								</li>
								<li>
									<a href="#"><i class="fa fa-pinterest"></i></a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /NEWSLETTER -->

		<!-- FOOTER -->
		<footer id="footer">
			<!-- top footer -->
			<div class="section">
				<!-- container -->
				<div class="container">
					<!-- row -->
					<div class="row">
						<div class="col-md-3 col-xs-6">
							<div class="footer">
								<h3 class="footer-title">About Us</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut.</p>
								<ul class="footer-links">
									<li><a href="#"><i class="fa fa-map-marker"></i>1734 Stonecoal Road</a></li>
									<li><a href="#"><i class="fa fa-phone"></i>+021-95-51-84</a></li>
									<li><a href="#"><i class="fa fa-envelope-o"></i>email@email.com</a></li>
								</ul>
							</div>
						</div>

						<div class="col-md-3 col-xs-6">
							<div class="footer">
								<h3 class="footer-title">Categories</h3>
								<ul class="footer-links">
									<li><a href="#">Hot deals</a></li>
									<li><a href="#">Laptops</a></li>
									<li><a href="#">Smartphones</a></li>
									<li><a href="#">Cameras</a></li>
									<li><a href="#">Accessories</a></li>
								</ul>
							</div>
						</div>

						<div class="clearfix visible-xs"></div>

						<div class="col-md-3 col-xs-6">
							<div class="footer">
								<h3 class="footer-title">Information</h3>
								<ul class="footer-links">
									<li><a href="#">About Us</a></li>
									<li><a href="#">Contact Us</a></li>
									<li><a href="#">Privacy Policy</a></li>
									<li><a href="#">Orders and Returns</a></li>
									<li><a href="#">Terms & Conditions</a></li>
								</ul>
							</div>
						</div>

						<div class="col-md-3 col-xs-6">
							<div class="footer">
								<h3 class="footer-title">Service</h3>
								<ul class="footer-links">
									<li><a href="#">My Account</a></li>
									<li><a href="#">View Cart</a></li>
									<li><a href="#">Wishlist</a></li>
									<li><a href="#">Track My Order</a></li>
									<li><a href="#">Help</a></li>
								</ul>
							</div>
						</div>
					</div>
					<!-- /row -->
				</div>
				<!-- /container -->
			</div>
			<!-- /top footer -->

			<!-- bottom footer -->
			<div id="bottom-footer" class="section">
				<div class="container">
					<!-- row -->
					<div class="row">
						<div class="col-md-12 text-center">
							<ul class="footer-payments">
								<li><a href="#"><i class="fa fa-cc-visa"></i></a></li>
								<li><a href="#"><i class="fa fa-credit-card"></i></a></li>
								<li><a href="#"><i class="fa fa-cc-paypal"></i></a></li>
								<li><a href="#"><i class="fa fa-cc-mastercard"></i></a></li>
								<li><a href="#"><i class="fa fa-cc-discover"></i></a></li>
								<li><a href="#"><i class="fa fa-cc-amex"></i></a></li>
							</ul>
							<span class="copyright">
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							</span>
						</div>
					</div>
						<!-- /row -->
				</div>
				<!-- /container -->
			</div>
			<!-- /bottom footer -->
		</footer>
		<!-- /FOOTER -->
		<!-- jQuery Plugins -->
		<script src="${url}/js/jquery.min.js"></script>
		<script src="${url}/js/bootstrap.min.js"></script>
		<script src="${url}/js/slick.min.js"></script>
		<script src="${url}/js/nouislider.min.js"></script>
		<script src="${url}/js/jquery.zoom.min.js"></script>
		<script src="${url}/js/main.js"></script>

	</body>
</html>
