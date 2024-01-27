<%@page import="model.CartList"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/views/client/assets" var="url"></c:url>
<c:url value="/views/admin" var="url1"></c:url>
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
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700"
	rel="stylesheet">

<!-- Bootstrap -->
<link type="text/css" rel="stylesheet"
	href="${url}/css/bootstrap.min.css" />

<!-- Slick -->
<link type="text/css" rel="stylesheet" href="${url}/css/slick.css" />
<link type="text/css" rel="stylesheet" href="${url}/css/slick-theme.css" />

<!-- nouislider -->
<link type="text/css" rel="stylesheet"
	href="${url}/css/nouislider.min.css" />

<!-- Font Awesome Icon -->
<link rel="stylesheet" href="${url}/css/font-awesome.min.css">

<!-- Custom stlylesheet -->
<link type="text/css" rel="stylesheet" href="${url}/css/style.css" />

<!-- Favicons -->
<link href="${url1}/assets/img/favicon.png" rel="icon">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.css" />
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.js"></script>

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
					<!-- /LOGO -->

					<!-- SEARCH BAR -->
					<div class="col-md-6">
						<div class="header-search">
							<form>
								<select class="input-select">
									<option value="0">Tất cả</option>
									<c:forEach items="${sessionScope.categories}" var="listcate">
										<option value="1">${listcate.getName()}</option>
									</c:forEach>
								</select> <input class="input" placeholder="Nhập tên sản phẩm">
								<button class="search-btn">Tìm kiếm</button>
							</form>
						</div>
					</div>
					<!-- /SEARCH BAR -->

					<!-- ACCOUNT -->
					<div class="col-md-3 clearfix">
						<div class="header-ctn">
							<!-- Wishlist -->
							<div>
								<a href="#"> <i class="fa fa-heart-o"></i> <span>Yêu
										thích</span>
									<div class="qty">2</div>
								</a>
							</div>
							<!-- /Wishlist -->

							<!-- Cart -->
							<c:if test="${sessionScope.cartlistdata != null}">
								<div class="dropdown">
									<a class="dropdown-toggle" data-toggle="dropdown"
										aria-expanded="true"> <i class="fa fa-shopping-cart"></i>
										<span>Giỏ hàng</span>
										<div class="qty">
											<%=soluong%></div>
									</a>
									<div class="cart-dropdown">
										<div class="cart-list">
											<c:forEach items="${sessionScope.cartlistdata}" var="cart">
												<div class="product-widget">
													<div class="product-img">
														<img src="${url}/img/${cart.getThumbnail()}" alt="">
													</div>
													<div class="product-body">
														<h3 class="product-name">
															<a href="#">${cart.getName()}</a>
														</h3>
														<h4 class="product-price">
															<span class="qty">x${cart.getSl()}</span>${cart.getPrice()*cart.getSl() - cart.getDiscount()*cart.getSl()}VNĐ
														</h4>
													</div>
													<button class="delete">
														<i class="fa fa-close"></i>
													</button>
												</div>
											</c:forEach>
										</div>
										<div class="cart-summary">
											<small><%=soluong%> sản phẩm đã chọn</small>
											<h5>
												Tổng tiền:
												<%=tongtien%>VNĐ
											</h5>
										</div>
										<div class="cart-btns">
											<a href="/ShopOnline/views/client/cart.jsp">Giỏ Hàng</a> <a
												href="/ShopOnline/check-out">Thanh Toán <i
												class="fa fa-arrow-circle-right"></i></a>
										</div>
									</div>
								</div>
							</c:if>
							<c:if test="${sessionScope.cartlistdata == null}">
								<div class="dropdown">
									<a class="dropdown-toggle" data-toggle="dropdown"
										aria-expanded="true"> <i class="fa fa-shopping-cart"></i>
										<span>Giỏ hàng</span>
										<div class="qty">0</div>
									</a>
									<div class="cart-dropdown">
										<div class="cart-list"></div>
										<div class="cart-summary">
											<small>0 Sản phẩm đã chọn</small>
											<h5>Tổng tiền: 0VNĐ</h5>
										</div>
										<div class="cart-btns">
											<a href="/ShopOnline/views/client/cart.jsp">Giỏ Hàng</a> <a
												href="/ShopOnline/check-out">Thanh Toán <i class="fa fa-arrow-circle-right"></i></a>
										</div>
									</div>
								</div>
							</c:if>
							<!-- /Cart -->

							<!-- Menu Toogle -->
							<div class="menu-toggle">
								<a href="#"> <i class="fa fa-bars"></i> <span>Menu</span>
								</a>
							</div>
							<!-- /Menu Toogle -->
						</div>
					</div>
					<!-- /ACCOUNT -->
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
					<li class="active"><a href="/ShopOnline/store">Cửa hàng</a></li>
					<li class="active"><a href="#">Ưu đãi</a></li>
					<c:forEach items="${sessionScope.categories}" var="listcate">
						<li><a href="showproduct?id=${listcate.getId()}">${listcate.getName()}</a></li>
					</c:forEach>
					<li class="active"><a href="order">Đơn hàng</a></li>
				</ul>
				<!-- /NAV -->
			</div>
			<!-- /responsive-nav -->
		</div>
		<!-- /container -->
	</nav>
	<!-- /NAVIGATION -->


	<!-- SECTION -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<h3>Thông tin hóa đơn</h3>
				<table class="table" id="myTable">
					<thead>
						<tr>
							<th>Tên</th>
							<th>Địa chỉ</th>
							<th>Số điện thoại</th>
							<th>Ngày đặt</th>
							<th>Tình trạng</th>
							<th>Tổng tiền</th>
							<th>Chi tiết hóa đơn</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${sessionScope.orderlist}" var="order">
							<tr>
								<td>${order.fullname}</td>
								<td>${order.address}</td>
								<td>${order.phonenumber}</td>
								<td>${order.orderdate}</td>
								<td><c:if test="${order.status == 1}">
											Đang chờ xác nhận
										</c:if> <c:if test="${order.status == 2}">
											Đang giao hàng
										</c:if></td>
								<td>${order.total}</td>
								<td><a href = "orderDetail?id=${order.id}" style="color:red" >chi tiết <i class="fa fa-address-card-o"></i></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
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
						<p>
							Sign Up for the <strong>NEWSLETTER</strong>
						</p>
						<form>
							<input class="input" type="email" placeholder="Enter Your Email">
							<button class="newsletter-btn">
								<i class="fa fa-envelope"></i> Subscribe
							</button>
						</form>
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
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
								sed do eiusmod tempor incididunt ut.</p>
							<ul class="footer-links">
								<li><a href="#"><i class="fa fa-map-marker"></i>1734
										Stonecoal Road</a></li>
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
						<span class="copyright"> <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							Copyright &copy;<script>
								document.write(new Date().getFullYear());
							</script> All rights reserved | This template is made with <i
							class="fa fa-heart-o" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a> <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
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
	<script>
	  $(document).ready( function () {
		    $('#myTable').DataTable();
		} );
</script>
</body>
</html>
