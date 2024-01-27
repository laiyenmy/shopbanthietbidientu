<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value = "/views/admin" var="url"></c:url>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>DANH SÁCH NGƯỜI DÙNG</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="${url}/assets/img/favicon.png" rel="icon">
  <link href="${url}/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="${url}/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${url}/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="${url}/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="${url}/assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="${url}/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="${url}/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="${url}/assets/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="${url}/assets/css/style.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.css" /> 
  <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.js"></script>

  </head>

<body>
  <!-- ======= Header ======= -->
  <%@include file="layout/header.jsp" %>
  <!-- ======= Sidebar ======= -->
  <%@include file="layout/sidebar.jsp" %>

  <main id="main" class="main">

    <div class="pagetitle">
      <c:if test="${sessionScope.role_id == 1}">
      	<h1>Quản trị viên</h1>
      </c:if>
      <c:if test="${sessionScope.role_id == 2}">
      	<h1>Người dùng</h1>
      </c:if>		
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Trang Chủ</a></li>
          <c:if test="${sessionScope.role_id == 1}">
          	 <li class="breadcrumb-item active">Quản trị viên</li>  
          </c:if>
          <c:if test="${sessionScope.role_id == 2}">
          	 <li class="breadcrumb-item active">Người dùng</li>  
          </c:if>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section dashboard">
      <div class="row">
			<div class="card">
				<div class="card-body">
					<c:if test="${sessionScope.role_id == 1}">
			          	 <h5 class="card-title">Danh sách quản trị viên </h5> 
			         </c:if>
			         <c:if test="${sessionScope.role_id == 2}">
			          	 <h5 class="card-title">Danh sách người dùng </h5>  
			         </c:if>
					<a class="btn btn-primary mb-2" href="#">Thêm mới</a>
					<table class="table" id="myTable">
						<thead>
							<tr>
								<th>Mã</th>
								<th>Họ Tên</th>
								<th>Tên tài khoản</th>
								<th>Mật khẩu</th>
								<th>Email</th>
								<th>Số điện thoại</th>
								<th>Địa chỉ</th>
								<th>Trạng thái</th>
								<th>Chức năng</th> 
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${sessionScope.listuser}" var="user">
								<tr>
									<td>${user.getId()}</td>
									<td>${user.getFullname()}</td>
									<td>${user.getUsername()}</td>
									<td>${user.getPassword()}</td>
									<td>${user.getEmail()}</td>
									<td>${user.getPhonenumber()}</td>
									<td>${user.getAddress()}</td>
									<td>${user.getStatus()}</td>
									<td>
										<a href="#"><i class="fa-solid fa-pen-to-square"></i></a> &ensp; | &ensp;
										<a href="#"><i class="fa-solid fa-trash"></i></a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
       </div>

    </section>

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <%@include file="layout/footer.jsp" %>
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="${url}/assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="${url}/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${url}/assets/vendor/chart.js/chart.min.js"></script>
  <script src="${url}/assets/vendor/echarts/echarts.min.js"></script>
  <script src="${url}/assets/vendor/quill/quill.min.js"></script>
  <script src="${url}/assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="${url}/assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="${url}/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="${url}/assets/js/main.js"></script>
  <script>
  		function deleteCategory(id) {
			let answer = confirm("Bạn có đồng ý xóa?");
			if(answer){
				window.location = "deleteCategory?id="+id;
			}
		}
  </script>
  <script>
	  $(document).ready( function () {
		    $('#myTable').DataTable();
		} );
  </script>
</body>

</html>