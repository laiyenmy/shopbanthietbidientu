
<%@page import="model.Order"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/views/admin" var="url"></c:url>
<%
	
	List<Order> orders = (ArrayList<Order>) session.getAttribute("orders");
	long tongtien = 0;
	for (int i = 0; i < orders.size(); i++) {
		tongtien = tongtien + orders.get(i).getTotal();
	}

%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>DANH SÁCH HÓA ĐƠN</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="${url}/assets/img/favicon.png" rel="icon">
<link href="${url}/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="${url}/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${url}/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="${url}/assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="${url}/assets/vendor/quill/quill.snow.css" rel="stylesheet">
<link href="${url}/assets/vendor/quill/quill.bubble.css"
	rel="stylesheet">
<link href="${url}/assets/vendor/remixicon/remixicon.css"
	rel="stylesheet">
<link href="${url}/assets/vendor/simple-datatables/style.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link href="${url}/assets/css/style.css" rel="stylesheet">
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
	<!-- ======= Header ======= -->
	<%@include file="layout/header.jsp"%>
	<!-- ======= Sidebar ======= -->
	<%@include file="layout/sidebar.jsp"%>

	<main id="main" class="main">

		<div class="pagetitle">
			<h1>Hóa Đơn</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="index.html">Trang Trủ</a></li>
					<li class="breadcrumb-item active">Hóa Đơn</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section dashboard">
			<div class="row">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Danh sách hóa đơn</h5>
						<button class="btn btn-success" onclick="exportTableToExcel('myTable', 'OrderList');">Xuất Excel</button>
						<table class="table" id="myTable">
							<thead>
								<tr>
									<th>Tên</th>
									<th>Địa chỉ</th>
									<th>Số điện thoại</th>
									<th>Ngày đặt</th>
									<th>Tình trạng</th>
									<th>Tổng tiền</th>
									<th>Chi tiết HĐ</th>
								</tr>
							</thead>
							<tbody>

								<c:forEach items="${sessionScope.orders}" var="order">
									<tr>
										<td>${order.fullname}</td>
										<td>${order.address}</td>
										<td>${order.phonenumber}</td>
										<td>${order.orderdate}</td>
										<td>
											<c:if test="${order.status == 1}">
												Đang chờ xác nhận
												<a href="updateStatus?id=${order.getId()}&userid=${order.getUser_id()}"><i class="fa-solid fa-pen-to-square"></i></a>
											</c:if> <c:if test="${order.status == 2}">
												Đang giao hàng
											</c:if>
										</td>
										<td>${order.total} VNĐ</td>
										<td><a href = "orderDetailAdmin?id=${order.id}" style="color: red;">Chi tiết <i class="bi-card-checklist"></i></a></td>
										
									</tr>
								</c:forEach>
							</tbody>
							<tr>
									<td>Doanh Thu</td>
									<td></td>
								    <td></td>
								    <td></td>
								    <td></td>
								    <td></td>	
									<td><%= tongtien + " "%> VNĐ</td>
								</tr>
						</table>
					</div>
				</div>
			</div>

		</section>
		<a href="/ShopOnline/orderbytoday" class="btn btn-info">Thống Kê Hóa Đơn Theo Ngày</a>
		<a href="/ShopOnline/orderbylastweek" class="btn btn-info">Thống Kê Hóa Đơn Theo Tuần</a>
		<a href="#" class="btn btn-info">Thống Kê Hóa Đơn Theo Tháng</a>
	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<%@include file="layout/footer.jsp"%>
	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script src="${url}/assets/vendor/apexcharts/apexcharts.min.js"></script>
	<script src="${url}/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${url}/assets/vendor/chart.js/chart.min.js"></script>
	<script src="${url}/assets/vendor/echarts/echarts.min.js"></script>
	<script src="${url}/assets/vendor/quill/quill.min.js"></script>
	<script
		src="${url}/assets/vendor/simple-datatables/simple-datatables.js"></script>
	<script src="${url}/assets/vendor/tinymce/tinymce.min.js"></script>
	<script src="${url}/assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="${url}/assets/js/main.js"></script>
	<script>
		function deleteCategory(id) {
			let answer = confirm("Bạn có đồng ý xóa?");
			if (answer) {
				window.location = "deleteCategory?id=" + id;
			}
		}
	</script>
	<script>
		$(document).ready(function() {
			$('#myTable').DataTable();
		});
	</script>
	<script type="text/javascript">
		function exportTableToExcel(tableID, filename = ''){
		    var downloadLink;
		    var dataType = 'application/vnd.ms-excel';
		    var tableSelect = document.getElementById(tableID);
		    var tableHTML = tableSelect.outerHTML.replace(/ /g, '%20');
		    
		    // Specify file name
		    filename = filename?filename+'.xls':'excel_data.xls';
		    
		    // Create download link element
		    downloadLink = document.createElement("a");
		    
		    document.body.appendChild(downloadLink);
		    
		    if(navigator.msSaveOrOpenBlob){
		        var blob = new Blob(['\ufeff', tableHTML], {
		            type: dataType
		        });
		        navigator.msSaveOrOpenBlob( blob, filename);
		    }else{
		        // Create a link to the file
		        downloadLink.href = 'data:' + dataType + ', ' + tableHTML;
		    
		        // Setting the file name
		        downloadLink.download = filename;
		        
		        //triggering the function
		        downloadLink.click();
		    }
		}
	</script>
</body>
</html>