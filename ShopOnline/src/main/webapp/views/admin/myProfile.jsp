<%@page import="java.util.Map"%>
<%@page import="model.Language"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value = "/views/admin" var="url"></c:url>
<%
 Language language = new Language();
Map<String, String> showLanguage = language.vietnamLanguage();
String lang = (String) session.getAttribute("lang");
if(lang != null){
	if(lang.equals("Vietnamese")){
		showLanguage = new Language().vietnamLanguage();
	}
	else{
		showLanguage = new Language().englishLanguage();
	}
}
%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Users / Profile - NiceAdmin Bootstrap Template</title>
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

  <!-- ======= Header ======= -->
  <%@include file="layout/header.jsp" %>

  <!-- ======= Sidebar ======= -->
  <%@include file="layout/sidebar.jsp" %>

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Profile</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
          <li class="breadcrumb-item">Users</li>
          <li class="breadcrumb-item active">Profile</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section profile">
      <div class="row">
        <div class="col-xl-4">

          <div class="card">
            <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">

              <img src="${url}/assets/img/my-ly.png" alt="Profile" class="rounded-circle">
              <h2><%= session.getAttribute("fullname") %></h2>
              <c:if test="${sessionScope.role_id == 1}">
               		<h3>Quản trị viên</h3>
               </c:if>
               <c:if test="${sessionScope.role_id == 2}">
               		<h3>Khách hàng</h3>
               </c:if>

              <div class="social-links mt-2">
                <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
                <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
                <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
                <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
              </div>
            </div>
          </div>

        </div>

        <div class="col-xl-8">

          <div class="card">
            <div class="card-body pt-3">
              <!-- Bordered Tabs -->
              <ul class="nav nav-tabs nav-tabs-bordered">

                <li class="nav-item">
                  <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#profile-overview">Tổng quan</button>
                </li>

                <li class="nav-item">
                  <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-edit">Sửa thông tin</button>
                </li>

                <li class="nav-item">
                  <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-settings">Thông báo cài đặt</button>
                </li>

                <li class="nav-item">
                  <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-change-password">Thay đổi mật khẩu</button>
                </li>

              </ul>
              <div class="tab-content pt-2">
                <div class="tab-pane fade show active profile-overview" id="profile-overview">
                  <h5 class="card-title">
                  	<%=showLanguage.get("User.Note") %>
                  </h5>
                  <p class="small fst-italic">
                  	<%=showLanguage.get("User.Text") %>
                  </p>
                  <h5 class="card-title"><%=showLanguage.get("User.ProInfo") %></h5>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label "><%=showLanguage.get("User.FullName") %></div>
                    <div class="col-lg-9 col-md-8"><%= session.getAttribute("fullname") %></div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label"><%=showLanguage.get("User.UserName") %></div>
                    <div class="col-lg-9 col-md-8"><%= session.getAttribute("username") %></div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label"><%=showLanguage.get("User.Password") %></div>
                    <div class="col-lg-9 col-md-8"><%= session.getAttribute("password") %></div>
                  </div>
					
				  <div class="row">
                    <div class="col-lg-3 col-md-4 label"><%=showLanguage.get("User.Email") %></div>
                    <div class="col-lg-9 col-md-8"><%= session.getAttribute("email") %></div>
                  </div>
					
                  <div class="row">
                    <div class="col-lg-3 col-md-4 label"><%=showLanguage.get("User.PhoneNumber") %></div>
                    <div class="col-lg-9 col-md-8"><%= session.getAttribute("phonenumber") %></div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label"><%=showLanguage.get("User.Address") %></div>
                    <div class="col-lg-9 col-md-8"><%= session.getAttribute("address") %></div>
                  </div>

            	 <div class="row">
                    <div class="col-lg-3 col-md-4 label"><%=showLanguage.get("User.Position") %></div>
                    <c:if test="${sessionScope.role_id == 1}">
                    	<div class="col-lg-9 col-md-8">Quản trị viên</div>
                    </c:if>
                    <c:if test="${sessionScope.role_id == 2}">
                    	<div class="col-lg-9 col-md-8">Khách hàng</div>
                    </c:if>
                  </div> 

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label"><%=showLanguage.get("User.Status") %></div>
	                    <c:if test="${sessionScope.status == 1}">
	                    	 <div class="col-lg-9 col-md-8">Đang hoạt động</div>
	                    </c:if>
	                    <c:if test="${sessionScope.status == 2}">
	                    	<div class="col-lg-9 col-md-8">Đã dừng hoạt động</div>
	                    </c:if>
                  </div>
                <a  style="width: 150px" class="btn btn-secondary" href="/ShopOnline/multilanguage?lang=Vietnamese">Vietnamese</a>
				<a  style="width: 150px" class="btn btn-secondary"  href="/ShopOnline/multilanguage?lang=Englist">English</a>				
                </div>

                <div class="tab-pane fade profile-edit pt-3" id="profile-edit">

                  <!-- Profile Edit Form -->
                  <form action="/ShopOnline/updateInfo?id=${sessionScope.id}" method="POST">
                    <div class="row mb-3">
                      <label for="profileImage" class="col-md-4 col-lg-3 col-form-label">Profile Image</label>
                      <div class="col-md-8 col-lg-9">
                        <img src="${url}/assets/img/my-ly.png" alt="Profile">
                        <div class="pt-2">
                          <a href="#" class="btn btn-primary btn-sm" title="Upload new profile image"><i class="bi bi-upload"></i></a>
                          <a href="#" class="btn btn-danger btn-sm" title="Remove my profile image"><i class="bi bi-trash"></i></a>
                        </div>
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="fullName" class="col-md-4 col-lg-3 col-form-label">Họ Tên</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="hoten" type="text" class="form-control" id="fullName" value="<%= session.getAttribute("fullname") %>">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="company" class="col-md-4 col-lg-3 col-form-label">Tài Khoản</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="taikhoan" type="text" class="form-control" id="username" value="<%= session.getAttribute("username") %>">
                      </div>
                    </div>
                    
                     <div class="row mb-3">
                      <label for="company" class="col-md-4 col-lg-3 col-form-label">Mật Khẩu</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="matkhau" type="text" class="form-control" id="username" value="<%= session.getAttribute("password") %>">
                      </div>
                    </div>
                    
                    <div class="row mb-3">
                      <label for="Job" class="col-md-4 col-lg-3 col-form-label">Email</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="email" type="text" class="form-control" id="email" value="<%= session.getAttribute("email") %>">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="Job" class="col-md-4 col-lg-3 col-form-label">Số Điện Thoại</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="sdt" type="text" class="form-control" id="phonenumber" value="<%= session.getAttribute("phonenumber") %>">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="Country" class="col-md-4 col-lg-3 col-form-label">Địa Chỉ</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="dc" type="text" class="form-control" id="address" value="<%= session.getAttribute("address") %>">
                      </div>
                    </div>      

                    <div class="row mb-3">
                      <label for="Twitter" class="col-md-4 col-lg-3 col-form-label">Twitter</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="twitter" type="text" class="form-control" id="Twitter" value="https://twitter.com/#">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="Facebook" class="col-md-4 col-lg-3 col-form-label">Facebook</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="facebook" type="text" class="form-control" id="Facebook" value="https://facebook.com/#">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="Instagram" class="col-md-4 col-lg-3 col-form-label">Instagram</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="instagram" type="text" class="form-control" id="Instagram" value="https://instagram.com/#">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="Linkedin" class="col-md-4 col-lg-3 col-form-label">Linkedin</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="linkedin" type="text" class="form-control" id="Linkedin" value="https://linkedin.com/#">
                      </div>
                    </div>

                    <div class="text-center">
                      <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
                    </div>
                  </form><!-- End Profile Edit Form -->

                </div>

                <div class="tab-pane fade pt-3" id="profile-settings">

                  <!-- Settings Form -->
                  <form>

                    <div class="row mb-3">
                      <label for="fullName" class="col-md-4 col-lg-3 col-form-label">Thông báo thư điện tử</label>
                      <div class="col-md-8 col-lg-9">
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="changesMade" checked>
                          <label class="form-check-label" for="changesMade">
                            Những thay đổi được thực hiện đối với tài khoản của bạn
                          </label>
                        </div>
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="newProducts" checked>
                          <label class="form-check-label" for="newProducts">
                            Thông tin về sản phẩm và dịch vụ mới
                          </label>
                        </div>
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="proOffers">
                          <label class="form-check-label" for="proOffers">
                            Ưu đãi tiếp thị và khuyến mãi
                          </label>
                        </div>
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="securityNotify" checked disabled>
                          <label class="form-check-label" for="securityNotify">
                            Cảnh báo bảo mật
                          </label>
                        </div>
                      </div>
                    </div>

                    <div class="text-center">
                      <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
                    </div>
                  </form><!-- End settings Form -->

                </div>

                <div class="tab-pane fade pt-3" id="profile-change-password">
                  <!-- Change Password Form -->
                  <form>

                    <div class="row mb-3">
                      <label for="currentPassword" class="col-md-4 col-lg-3 col-form-label">Mật khẩu hiện tại</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="password" type="password" class="form-control" id="currentPassword">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="newPassword" class="col-md-4 col-lg-3 col-form-label">Mật khẩu mới</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="newpassword" type="password" class="form-control" id="newPassword">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="renewPassword" class="col-md-4 col-lg-3 col-form-label">Nhập lại mật khẩu mới</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="renewpassword" type="password" class="form-control" id="renewPassword">
                      </div>
                    </div>

                    <div class="text-center">
                      <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
                    </div>
                  </form><!-- End Change Password Form -->

                </div>

              </div><!-- End Bordered Tabs -->

            </div>
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

</body>

</html>