<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value = "/views/admin" var="url"></c:url>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Đăng Ký Tài Khoản</title>
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

</head>

<body>

  <main>
    <div class="container">

      <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

              <div class="d-flex justify-content-center py-4">
                <a href="index.html" class="logo d-flex align-items-center w-auto">
                  <img src="assets/img/logo.png" alt="">
                  <span class="d-none d-lg-block">NiceRegister</span>
                </a>
              </div><!-- End Logo -->

              <div class="card mb-3">

                <div class="card-body">

                  <div class="pt-4 pb-2">
                    <h5 class="card-title text-center pb-0 fs-4">Tạo Tài Khoản</h5>
                    <p class="text-center small">Nhập thông tin cá nhân của bạn để tạo tài khoản</p>
                  </div>
                  <form class="row g-3 needs-validation" action ="/ShopOnline/register" method="post" novalidate>
                    <div class="col-12">
                      <label for="yourName" class="form-label">Họ Tên</label>
                      <input type="text" name="fullname" class="form-control" id="fullname" required>
                      <div class="invalid-feedback">Vui lòng, nhập họ tên của bạn!</div>
                    </div>

                    <div class="col-12">
                      <label for="yourUserName" class="form-label">Tên Tài Khoản</label>
                      <input type="text" name="username" class="form-control" id="username" required>
                      <div class="invalid-feedback">Vui lòng, nhập tên tài khoản của bạn!</div>
                    </div>
                    
                    <div class="col-12">
                      <label for="yourPassword" class="form-label">Mật Khẩu</label>
                      <input type="password" name="password" class="form-control" id="password" required>
                      <div class="invalid-feedback">Vui lòng, nhập tên mật khẩu của bạn!</div>
                    </div>

                   <div class="col-12">
                      <label for="yourEmail" class="form-label">Email</label>
                      <input type="email" name="email" class="form-control" id="email" required>
                      <div class="invalid-feedback">Vui lòng, nhập email của bạn!</div>
                    </div>
					
					<div class="col-12">
                      <label for="yourPhoneNumber" class="form-label">Số Điện Thoại</label>
                      <input type="text" name="phonenumber" class="form-control" id="phonenumber" required>
                      <div class="invalid-feedback">Vui lòng, nhập số điện thoại của bạn!</div>
                    </div>
					
					<div class="col-12">
                      <label for="yourAddress" class="form-label">Địa Chỉ</label>
                      <input type="text" name="address" class="form-control" id="address" required>
                      <div class="invalid-feedback">Vui lòng, nhập địa chỉ của bạn</div>
                    </div>
                    <div class="col-12">
                      <div class="form-check">
                        <input class="form-check-input" name="conditions" type="checkbox" value="" id="conditions" required>
                        <label class="form-check-label" for="conditions">Tôi đồng ý chấp nhận <a href="#">các điều khoản</a></label>
                        <div class="invalid-feedback">Bạn phải đồng ý trước khi gửi!</div>
                      </div>
                      <c:if test="${requestScope.registerError != null}">
                      	<p class="alert alert-danger">${requestScope.registerError}</p>
                      </c:if>
                    </div>
                    <div class="col-12">
                      <button class="btn btn-primary w-100" type="submit">Tạo Tài Khoản</button>
                    </div>
                    <div class="col-12">
                      <p class="small mb-0">Bạn đã có tài khoản ? <a href="login.jsp">Đăng nhập</a></p>
                    </div>
                  </form>

                </div>
              </div>

              <div class="credits">
               Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
              </div>

            </div>
          </div>
        </div>

      </section>

    </div>
  </main><!-- End #main -->

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

</body>

</html>