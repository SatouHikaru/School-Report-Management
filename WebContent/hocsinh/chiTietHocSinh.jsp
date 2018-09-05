<%@page import="common.StringProcess"%>
<%@page import="model.bean.HocSinh"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Chi tiết học sinh</title>
	</head>
	
	<body>
		<% HocSinh hs = (HocSinh)request.getAttribute("hocSinh"); %>
		<!-- Content Header (Page header) -->
		<% if (session.getAttribute("admin") != null) { %>
		<div class="content-header">
			<h1>
				<i class="fa fa-th"></i>
			</h1>
			<ol class="breadcrumb">
				<li><a href="trangchu"><i class="fa fa-home"></i> Trang chủ</a></li>
				
				<li><a href="danhsachhocsinh">Danh sách học sinh</a></li>
				<li class="active">Chi tiết học sinh</li>
			</ol>
		</div>
		<% } %>
	
		<!-- Main content -->
		<div class="content">
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">Thông tin học sinh</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<div class="col-md-6">
						<table class="table">
							<tbody>
								<tr>
									<th style="width: 30%">Mã học sinh</th>
									<td><%= hs.getMaHS() %></td>
								</tr>
						
								<tr>
									<th>Họ tên</th>
									<td><%= hs.getHoTen() %></td>
								</tr>
						
								<tr>
									<th>Giới tính</th>
									<td><%= StringProcess.getGender(hs.isGioiTinh()) %></td>
								</tr>
								
								<tr>
									<th>Ngày sinh</th>
									<td><%= StringProcess.toFriendlyDateFormat(hs.getNgaySinh()) %></td>
								</tr>
								
								<tr>
									<th>Điện thoại</th>
									<td><%= hs.getDienThoai() %></td>
								</tr>
								
								<tr>
									<th>Địa chỉ</th>
									<td><%= hs.getDiaChi() %></td>
								</tr>
								
								<tr>
									<th>Tên lớp</th>
									<td><%= hs.getTenLop() %></td>
								</tr>
							</tbody>
						</table>
						
						<div class="col-md-12">
							<a href="chitiethocba?mahs=<%= hs.getMaHS() %>" class="btn btn-info btn-flat mb-10">Kết quả học tập</a>
							<a href="chitietphuhuynh?maph=<%= hs.getMaPH() %>" class="btn btn-primary btn-flat mb-10">Phụ huynh</a>
							<% if (session.getAttribute("admin") != null) { %>
							<a href="suahocsinh?mahs=<%= hs.getMaHS() %>" class="btn btn-warning btn-flat mb-10">Chỉnh sửa</a>
							<a href="xoahocsinh?mahs=<%= hs.getMaHS() %>" class="btn btn-danger btn-flat mb-10">Xóa</a>
							<a href="danhsachhocsinh" class="btn btn-default btn-flat mb-10">Trở về</a>
							<% } %>
							
						</div>
					</div>
				</div>
				<!-- /.box-body -->
			</div>
			<!-- /.box-body -->
		</div>
	</body>
</html>