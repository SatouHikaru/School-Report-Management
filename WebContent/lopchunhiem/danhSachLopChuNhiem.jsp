<%@page import="model.bean.LopChuNhiem"%>
<%@page import="model.bean.NamHoc"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Danh sách lớp chủ nhiệm</title>
	</head>
	
	<body>
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<h1>
				<i class="fa fa-th"></i>
			</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-home"></i> Trang chủ</a></li>
				<li class="active">Danh sách</li>
			</ol>
		</div>
	
		<!-- Main content -->
		<div class="content">
			<div class="box box-default">
				<div class="box-header with-border">
					<h3 class="box-title text-center">Danh sách lớp chủ nhiệm</h3>
				</div>
				<div class="box-body">
					<!-- Công cụ lọc -->
					<div class="row">
						<div class="col-md-8">
							<form>
								<input class="form-control" type="text"
									placeholder="Tìm kiếm giáo viên..." />
							</form>
						</div>
						<div class="col-md-2">
							<select class="form-control select2">
								<option value="">Năm học</option>
								<%
									ArrayList<NamHoc> listNH = (ArrayList<NamHoc>)request.getAttribute("listNH");
									for (NamHoc nh : listNH) {
								%>
								<option value="<%= nh.getMaNH() %>"><%= nh.getNamHoc() %></option>
								<%	} %>
							</select>
						</div>
	
						<div class="col-md-2">
							<button class="btn btn-primary btn-flat">Tìm kiếm</button>
						</div>
					</div>
	
	
					<div class="table-responsive mt-10">
						<table class="table table-hover">
							<tbody>
								<tr>
									<th>STT</th>
									<th>Giáo viên chủ nhiệm</th>
									<th>Lớp</th>
									<th>Sĩ số</th>
									<th>Niên khoá</th>
								</tr>
								<%
									ArrayList<LopChuNhiem> listLCN = (ArrayList<LopChuNhiem>)request.getAttribute("listLCN");
									int i = 1;
									for (LopChuNhiem lcn : listLCN) {
								%>
								<tr>
									<td><%= i %></td>
									<td><%= lcn.getTenGV() %></td>
									<td><%= lcn.getTenLop() %></td>
									<td><%= lcn.getSiSo() %></td>
									<td><%= lcn.getNienKhoa() %></td>
								</tr>
								<%
										i++;
									}
								%>
							</tbody>
						</table>
	
					</div>
					<ul class="pagination pagination-sm no-margin pull-right">
						<li><a href="#">«</a></li>
						<li><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">»</a></li>
					</ul>
				</div>
				<!-- /.box-body -->
			</div>
			<!-- /.box -->
		</div>
	</body>
</html>