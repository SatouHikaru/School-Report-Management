<%@page import="model.bean.HocSinh"%>
<%@page import="java.util.ArrayList"%>
<%@page import="common.StringProcess"%>
<%@page import="model.bean.PhuHuynh"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Chi tiết phụ huynh</title>
	</head>
	
	<body>
		<% PhuHuynh ph = (PhuHuynh)request.getAttribute("phuHuynh"); %>
		<% if (session.getAttribute("admin") != null) { %>
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<h1>
				<i class="fa fa-th"></i>
			</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-home"></i> Trang chủ</a></li>
				<li><a href="#">Danh sách học sinh</a></li>
				<li class="active">Chi tiết phụ huynh</li>
			</ol>
		</div>
		<% } %>
		
		<!-- Main content -->
		<div class="content">
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">Thông tin phụ huynh</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<div class="col-md-8">
						<table class="table">
							<tbody>
								<tr>
									<th>Họ tên</th>
									<td><%= ph.getHoTen() %></td>
								</tr>
								
								<tr>
									<th>Giới tính</th>
									<td><%= StringProcess.getGender(ph.isGioiTinh()) %></td>
								</tr>
								
								<tr>
									<th>Ngày sinh</th>
									<td><%= StringProcess.toFriendlyDateFormat(ph.getNgaySinh()) %></td>
								</tr>
								
								<tr>
									<th>Số điện thoại</th>
									<td><%= ph.getDienThoai() %></td>
								</tr>
								
								<tr>
									<th>Email</th>
									<td><a href="mailto:<%= ph.getEmail() %>"><%= ph.getEmail() %></a></td>
								</tr>
								
								<tr>
									<th>Địa chỉ</th>
									<td><%= ph.getDiaChi() %></td>
								</tr>
								
								<tr>
									<th>Tài khoản</th>
									<td><%= ph.getTaiKhoan() %></td>
								</tr>
							</tbody>
						</table>
						<div class="col-md-12">
							<% if (session.getAttribute("admin") != null) { %>
							<a href="danhsachphuhuynh" class="btn btn-default btn-flat mb-10">Trở về</a>
							<% } %>
							
							<% if (session.getAttribute("hocSinh") != null) { %>
							<a href="chitiethocsinh?mahs=<%= session.getAttribute("userName") %>" class="btn btn-default btn-flat mb-10">Trở về</a>
							<% } %>
							
							<%
								if (session.getAttribute("phuHuynh") != null) {
									ArrayList<HocSinh> list = (ArrayList<HocSinh>)session.getAttribute("listHS");
									for (HocSinh hs : list) {
								%>
									<a href="chitiethocba?mahs=<%= hs.getMaHS() %>" class="btn btn-primary btn-flat mb-10">Kết quả học tập của học sinh <%= hs.getHoTen() %></a>
								<%  } %>
							<a href="#" class="btn btn-primary btn-flat mb-10">Liên lạc</a>
							<%  } %>
						</div>
					</div>
				</div>
				<!-- /.box-body -->
			</div>
			<!-- /.box-body -->
		</div>
	</body>
</html>