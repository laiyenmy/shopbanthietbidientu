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
											<%= soluong %></div>
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
											<small><%= soluong %> sản phẩm đã chọn</small>
											<h5>
												Tổng tiền:
												<%= tongtien %>VNĐ
											</h5>
										</div>
										<div class="cart-btns">
											<a href="/ShopOnline/views/client/cart.jsp">View Cart</a> <a
												href="#">Checkout <i class="fa fa-arrow-circle-right"></i></a>
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
											<a href="/ShopOnline/views/client/cart.jsp">View Cart</a> <a
												href="#">Checkout <i class="fa fa-arrow-circle-right"></i></a>
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
						<li><a href="#">${listcate.getName()}</a></li>
					</c:forEach>
					<li class="active"><a href="/ShopOnline/order">Đơn hàng</a></li>
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
					<ul class="breadcrumb-tree">
						<li><a href="#">Home</a></li>
						<li><a href="#">All Categories</a></li>
						<li><a href="#">Accessories</a></li>
						<li class="active">Headphones (227,490 Results)</li>
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
				<!-- ASIDE -->
				<div id="aside" class="col-md-3">
					<!-- aside Widget -->
					<div class="aside">
						<h3 class="aside-title">Categories</h3>
						<div class="checkbox-filter">

							<div class="input-checkbox">
								<input type="checkbox" id="category-1"> <label
									for="category-1"> <span></span> Laptops <small>(120)</small>
								</label>
							</div>

							<div class="input-checkbox">
								<input type="checkbox" id="category-2"> <label
									for="category-2"> <span></span> Smartphones <small>(740)</small>
								</label>
							</div>

							<div class="input-checkbox">
								<input type="checkbox" id="category-3"> <label
									for="category-3"> <span></span> Cameras <small>(1450)</small>
								</label>
							</div>

							<div class="input-checkbox">
								<input type="checkbox" id="category-4"> <label
									for="category-4"> <span></span> Accessories <small>(578)</small>
								</label>
							</div>

							<div class="input-checkbox">
								<input type="checkbox" id="category-5"> <label
									for="category-5"> <span></span> Laptops <small>(120)</small>
								</label>
							</div>

							<div class="input-checkbox">
								<input type="checkbox" id="category-6"> <label
									for="category-6"> <span></span> Smartphones <small>(740)</small>
								</label>
							</div>
						</div>
					</div>
					<!-- /aside Widget -->

					<!-- aside Widget -->
					<div class="aside">
						<h3 class="aside-title">Price</h3>
						<div class="price-filter">
							<div id="price-slider"></div>
							<div class="input-number price-min">
								<input id="price-min" type="number"> <span
									class="qty-up">+</span> <span class="qty-down">-</span>
							</div>
							<span>-</span>
							<div class="input-number price-max">
								<input id="price-max" type="number"> <span
									class="qty-up">+</span> <span class="qty-down">-</span>
							</div>
						</div>
					</div>
					<!-- /aside Widget -->

					<!-- aside Widget -->
					<div class="aside">
						<h3 class="aside-title">Brand</h3>
						<div class="checkbox-filter">
							<div class="input-checkbox">
								<input type="checkbox" id="brand-1"> <label
									for="brand-1"> <span></span> SAMSUNG <small>(578)</small>
								</label>
							</div>
							<div class="input-checkbox">
								<input type="checkbox" id="brand-2"> <label
									for="brand-2"> <span></span> LG <small>(125)</small>
								</label>
							</div>
							<div class="input-checkbox">
								<input type="checkbox" id="brand-3"> <label
									for="brand-3"> <span></span> SONY <small>(755)</small>
								</label>
							</div>
							<div class="input-checkbox">
								<input type="checkbox" id="brand-4"> <label
									for="brand-4"> <span></span> SAMSUNG <small>(578)</small>
								</label>
							</div>
							<div class="input-checkbox">
								<input type="checkbox" id="brand-5"> <label
									for="brand-5"> <span></span> LG <small>(125)</small>
								</label>
							</div>
							<div class="input-checkbox">
								<input type="checkbox" id="brand-6"> <label
									for="brand-6"> <span></span> SONY <small>(755)</small>
								</label>
							</div>
						</div>
					</div>
					<!-- /aside Widget -->

					<!-- aside Widget -->
					<div class="aside">
						<h3 class="aside-title">Top selling</h3>
						<div class="product-widget">
							<div class="product-img">
								<img src="${url}/img/product01.png" alt="">
							</div>
							<div class="product-body">
								<p class="product-category">Category</p>
								<h3 class="product-name">
									<a href="#">product name goes here</a>
								</h3>
								<h4 class="product-price">
									$980.00
									<del class="product-old-price">$990.00</del>
								</h4>
							</div>
						</div>

						<div class="product-widget">
							<div class="product-img">
								<img src="${url}/img/product02.png" alt="">
							</div>
							<div class="product-body">
								<p class="product-category">Category</p>
								<h3 class="product-name">
									<a href="#">product name goes here</a>
								</h3>
								<h4 class="product-price">
									$980.00
									<del class="product-old-price">$990.00</del>
								</h4>
							</div>
						</div>

						<div class="product-widget">
							<div class="product-img">
								<img src="./img/product03.png" alt="">
							</div>
							<div class="product-body">
								<p class="product-category">Category</p>
								<h3 class="product-name">
									<a href="#">product name goes here</a>
								</h3>
								<h4 class="product-price">
									$980.00
									<del class="product-old-price">$990.00</del>
								</h4>
							</div>
						</div>
					</div>
					<!-- /aside Widget -->
				</div>
				<!-- /ASIDE -->

				<!-- STORE -->
				<div id="store" class="col-md-9">
					<!-- store top filter -->
					<div class="store-filter clearfix">
						<div class="store-sort">
							<label> Sort By: <select class="input-select">
									<option value="0">Popular</option>
									<option value="1">Position</option>
							</select>
							</label> <label> Show: <select class="input-select">
									<option value="0">20</option>
									<option value="1">50</option>
							</select>
							</label>
						</div>
						<ul class="store-grid">
							<li class="active"><i class="fa fa-th"></i></li>
							<li><a href="#"><i class="fa fa-th-list"></i></a></li>
						</ul>
					</div>
					<!-- /store top filter -->

					<!-- store products -->
					<div class="row">
						<!-- product -->
						<div class="col-md-4 col-xs-6">
							<div class="product">
								<div class="product-img">
									<img src="${url}/img/product01.png" alt="">
									<div class="product-label">
										<span class="sale">-30%</span> <span class="new">NEW</span>
									</div>
								</div>
								<div class="product-body">
									<p class="product-category">Category</p>
									<h3 class="product-name">
										<a href="#">product name goes here</a>
									</h3>
									<h4 class="product-price">
										$980.00
										<del class="product-old-price">$990.00</del>
									</h4>
									<div class="product-rating">
										<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i>
									</div>
									<div class="product-btns">
										<button class="add-to-wishlist">
											<i class="fa fa-heart-o"></i><span class="tooltipp">add
												to wishlist</span>
										</button>
										<button class="add-to-compare">
											<i class="fa fa-exchange"></i><span class="tooltipp">add
												to compare</span>
										</button>
										<button class="quick-view">
											<i class="fa fa-eye"></i><span class="tooltipp">quick
												view</span>
										</button>
									</div>
								</div>
								<div class="add-to-cart">
									<button class="add-to-cart-btn">
										<i class="fa fa-shopping-cart"></i> add to cart
									</button>
								</div>
							</div>
						</div>
						<!-- /product -->

						<!-- product -->
						<div class="col-md-4 col-xs-6">
							<div class="product">
								<div class="product-img">
									<img src="${url}/img/product02.png" alt="">
									<div class="product-label">
										<span class="new">NEW</span>
									</div>
								</div>
								<div class="product-body">
									<p class="product-category">Category</p>
									<h3 class="product-name">
										<a href="#">product name goes here</a>
									</h3>
									<h4 class="product-price">
										$980.00
										<del class="product-old-price">$990.00</del>
									</h4>
									<div class="product-rating">
										<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star-o"></i>
									</div>
									<div class="product-btns">
										<button class="add-to-wishlist">
											<i class="fa fa-heart-o"></i><span class="tooltipp">add
												to wishlist</span>
										</button>
										<button class="add-to-compare">
											<i class="fa fa-exchange"></i><span class="tooltipp">add
												to compare</span>
										</button>
										<button class="quick-view">
											<i class="fa fa-eye"></i><span class="tooltipp">quick
												view</span>
										</button>
									</div>
								</div>
								<div class="add-to-cart">
									<button class="add-to-cart-btn">
										<i class="fa fa-shopping-cart"></i> add to cart
									</button>
								</div>
							</div>
						</div>
						<!-- /product -->

						<div class="clearfix visible-sm visible-xs"></div>

						<!-- product -->
						<div class="col-md-4 col-xs-6">
							<div class="product">
								<div class="product-img">
									<img src="${url}/img/product03.png" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">Category</p>
									<h3 class="product-name">
										<a href="#">product name goes here</a>
									</h3>
									<h4 class="product-price">
										$980.00
										<del class="product-old-price">$990.00</del>
									</h4>
									<div class="product-rating"></div>
									<div class="product-btns">
										<button class="add-to-wishlist">
											<i class="fa fa-heart-o"></i><span class="tooltipp">add
												to wishlist</span>
										</button>
										<button class="add-to-compare">
											<i class="fa fa-exchange"></i><span class="tooltipp">add
												to compare</span>
										</button>
										<button class="quick-view">
											<i class="fa fa-eye"></i><span class="tooltipp">quick
												view</span>
										</button>
									</div>
								</div>
								<div class="add-to-cart">
									<button class="add-to-cart-btn">
										<i class="fa fa-shopping-cart"></i> add to cart
									</button>
								</div>
							</div>
						</div>
						<!-- /product -->

						<div class="clearfix visible-lg visible-md"></div>

						<!-- product -->
						<div class="col-md-4 col-xs-6">
							<div class="product">
								<div class="product-img">
									<img src="${url}/img/product04.png" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">Category</p>
									<h3 class="product-name">
										<a href="#">product name goes here</a>
									</h3>
									<h4 class="product-price">
										$980.00
										<del class="product-old-price">$990.00</del>
									</h4>
									<div class="product-rating"></div>
									<div class="product-btns">
										<button class="add-to-wishlist">
											<i class="fa fa-heart-o"></i><span class="tooltipp">add
												to wishlist</span>
										</button>
										<button class="add-to-compare">
											<i class="fa fa-exchange"></i><span class="tooltipp">add
												to compare</span>
										</button>
										<button class="quick-view">
											<i class="fa fa-eye"></i><span class="tooltipp">quick
												view</span>
										</button>
									</div>
								</div>
								<div class="add-to-cart">
									<button class="add-to-cart-btn">
										<i class="fa fa-shopping-cart"></i> add to cart
									</button>
								</div>
							</div>
						</div>
						<!-- /product -->

						<div class="clearfix visible-sm visible-xs"></div>

						<!-- product -->
						<div class="col-md-4 col-xs-6">
							<div class="product">
								<div class="product-img">
									<img src="${url}/img/product05.png" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">Category</p>
									<h3 class="product-name">
										<a href="#">product name goes here</a>
									</h3>
									<h4 class="product-price">
										$980.00
										<del class="product-old-price">$990.00</del>
									</h4>
									<div class="product-rating"></div>
									<div class="product-btns">
										<button class="add-to-wishlist">
											<i class="fa fa-heart-o"></i><span class="tooltipp">add
												to wishlist</span>
										</button>
										<button class="add-to-compare">
											<i class="fa fa-exchange"></i><span class="tooltipp">add
												to compare</span>
										</button>
										<button class="quick-view">
											<i class="fa fa-eye"></i><span class="tooltipp">quick
												view</span>
										</button>
									</div>
								</div>
								<div class="add-to-cart">
									<button class="add-to-cart-btn">
										<i class="fa fa-shopping-cart"></i> add to cart
									</button>
								</div>
							</div>
						</div>
						<!-- /product -->

						<!-- product -->
						<div class="col-md-4 col-xs-6">
							<div class="product">
								<div class="product-img">
									<img src="${url}/img/product06.png" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">Category</p>
									<h3 class="product-name">
										<a href="#">product name goes here</a>
									</h3>
									<h4 class="product-price">
										$980.00
										<del class="product-old-price">$990.00</del>
									</h4>
									<div class="product-rating">
										<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star-o"></i>
									</div>
									<div class="product-btns">
										<button class="add-to-wishlist">
											<i class="fa fa-heart-o"></i><span class="tooltipp">add
												to wishlist</span>
										</button>
										<button class="add-to-compare">
											<i class="fa fa-exchange"></i><span class="tooltipp">add
												to compare</span>
										</button>
										<button class="quick-view">
											<i class="fa fa-eye"></i><span class="tooltipp">quick
												view</span>
										</button>
									</div>
								</div>
								<div class="add-to-cart">
									<button class="add-to-cart-btn">
										<i class="fa fa-shopping-cart"></i> add to cart
									</button>
								</div>
							</div>
						</div>
						<!-- /product -->

						<div class="clearfix visible-lg visible-md visible-sm visible-xs"></div>

						<!-- product -->
						<div class="col-md-4 col-xs-6">
							<div class="product">
								<div class="product-img">
									<img src="${url}/img/product07.png" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">Category</p>
									<h3 class="product-name">
										<a href="#">product name goes here</a>
									</h3>
									<h4 class="product-price">
										$980.00
										<del class="product-old-price">$990.00</del>
									</h4>
									<div class="product-rating">
										<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i>
									</div>
									<div class="product-btns">
										<button class="add-to-wishlist">
											<i class="fa fa-heart-o"></i><span class="tooltipp">add
												to wishlist</span>
										</button>
										<button class="add-to-compare">
											<i class="fa fa-exchange"></i><span class="tooltipp">add
												to compare</span>
										</button>
										<button class="quick-view">
											<i class="fa fa-eye"></i><span class="tooltipp">quick
												view</span>
										</button>
									</div>
								</div>
								<div class="add-to-cart">
									<button class="add-to-cart-btn">
										<i class="fa fa-shopping-cart"></i> add to cart
									</button>
								</div>
							</div>
						</div>
						<!-- /product -->

						<!-- product -->
						<div class="col-md-4 col-xs-6">
							<div class="product">
								<div class="product-img">
									<img src="${url}/img/product08.png" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">Category</p>
									<h3 class="product-name">
										<a href="#">product name goes here</a>
									</h3>
									<h4 class="product-price">
										$980.00
										<del class="product-old-price">$990.00</del>
									</h4>
									<div class="product-rating"></div>
									<div class="product-btns">
										<button class="add-to-wishlist">
											<i class="fa fa-heart-o"></i><span class="tooltipp">add
												to wishlist</span>
										</button>
										<button class="add-to-compare">
											<i class="fa fa-exchange"></i><span class="tooltipp">add
												to compare</span>
										</button>
										<button class="quick-view">
											<i class="fa fa-eye"></i><span class="tooltipp">quick
												view</span>
										</button>
									</div>
								</div>
								<div class="add-to-cart">
									<button class="add-to-cart-btn">
										<i class="fa fa-shopping-cart"></i> add to cart
									</button>
								</div>
							</div>
						</div>
						<!-- /product -->

						<div class="clearfix visible-sm visible-xs"></div>

						<!-- product -->
						<div class="col-md-4 col-xs-6">
							<div class="product">
								<div class="product-img">
									<img src="${url}/img/product09.png" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">Category</p>
									<h3 class="product-name">
										<a href="#">product name goes here</a>
									</h3>
									<h4 class="product-price">
										$980.00
										<del class="product-old-price">$990.00</del>
									</h4>
									<div class="product-rating"></div>
									<div class="product-btns">
										<button class="add-to-wishlist">
											<i class="fa fa-heart-o"></i><span class="tooltipp">add
												to wishlist</span>
										</button>
										<button class="add-to-compare">
											<i class="fa fa-exchange"></i><span class="tooltipp">add
												to compare</span>
										</button>
										<button class="quick-view">
											<i class="fa fa-eye"></i><span class="tooltipp">quick
												view</span>
										</button>
									</div>
								</div>
								<div class="add-to-cart">
									<button class="add-to-cart-btn">
										<i class="fa fa-shopping-cart"></i> add to cart
									</button>
								</div>
							</div>
						</div>
						<!-- /product -->
					</div>
					<!-- /store products -->

					<!-- store bottom filter -->
					<div class="store-filter clearfix">
						<span class="store-qty">Showing 20-100 products</span>
						<ul class="store-pagination">
							<li class="active">1</li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#"><i class="fa fa-angle-right"></i></a></li>
						</ul>
					</div>
					<!-- /store bottom filter -->
				</div>
				<!-- /STORE -->
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
						<ul class="newsletter-follow">
							<li><a href="#"><i class="fa fa-facebook"></i></a></li>
							<li><a href="#"><i class="fa fa-twitter"></i></a></li>
							<li><a href="#"><i class="fa fa-instagram"></i></a></li>
							<li><a href="#"><i class="fa fa-pinterest"></i></a></li>
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
							</script>
							All rights reserved | This template is made with <i
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

</body>
</html>
