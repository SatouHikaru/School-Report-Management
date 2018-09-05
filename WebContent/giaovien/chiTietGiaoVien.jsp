<%@page import="common.StringProcess"%>
<%@page import="model.bean.GiaoVien"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Chi tiết giáo viên</title>
	</head>
	
	<body>
		<% GiaoVien gv = (GiaoVien)request.getAttribute("giaoVien"); %>
		<% if (session.getAttribute("admin") != null) { %>
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<h1>
				<i class="fa fa-th"></i>
			</h1>
			<ol class="breadcrumb">
				<li><a href="trangchu"><i class="fa fa-home"></i> Trang chủ</a></li>
				<li><a href="danhsachgiaovien">Danh sách giáo viên</a></li>
				<li class="active">Chi tiết giáo viên</li>
			</ol>
		</div>
		<% } %>
	
		<!-- Main content -->
		<div class="content">
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">Thông tin giáo viên</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<div class="col-md-6">					
						<table class="table">
							<tbody>
								<tr>
									<th style="width: 30%">Mã giáo viên</th>
									<td><%= gv.getMaGV() %></td>
								</tr>
								<tr>
								<tr>
									<th>Họ tên</th>
									<td><%= gv.getHoTen() %></td>
								</tr>
								<tr>
									<th>Giới tính</th>
									<td><%= StringProcess.getGender(gv.isGioiTinh()) %></td>
								</tr>
								<tr>
									<th>Ngày sinh</th>
									<td><%= StringProcess.toFriendlyDateFormat(gv.getNgaySinh()) %></td>
								</tr>
								<tr>
									<th>Số điện thoại</th>
									<td><%= gv.getDienThoai() %></td>
								</tr>
								<tr>
									<th>Email</th>
									<td><a href="mailto:<%= gv.getEmail() %>"><%= gv.getEmail() %></a></td>
								</tr>
								<tr>
									<th>Địa chỉ</th>
									<td><%= gv.getDiaChi() %></td>
								</tr>
								<tr>
									<th>Chuyên môn</th>
									<td><%= gv.getChuyenMon() %></td>
								</tr>
								<tr>
									<th>Tài khoản</th>
									<td><%= gv.getTaiKhoan() %></td>
								</tr>
							</tbody>
						</table>
						<div class="col-md-12">
						<% if (session.getAttribute("admin") != null) { %>
							<a href="danhsachgiaovien" class="btn btn-info btn-flat mb-10">Trở về</a>
							<a href="suagiaovien?magv=<%= gv.getMaGV() %>" class="btn btn-primary btn-flat mb-10">Chỉnh sửa</a>
							<a href="xoagiaovien?magv=<%= gv.getMaGV() %>" class="btn btn-danger btn-flat mb-10">Xóa</a>
						<% } else { %>
							<a href="DanhSachLopCuaGiaoVien?maGV=<%= gv.getMaGV() %>&maHK=1" class="btn btn-primary btn-flat mb-10">Lớp giảng dạy</a>
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