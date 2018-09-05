<%@page import="model.bean.MonHoc"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Xoá môn học</title>
	</head>
	
	<body>
		<% MonHoc mh = (MonHoc)request.getAttribute("monHoc"); %>
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<h1>Xoá môn học</h1>
			<ol class="breadcrumb">
				<li><a href="trangchu"><i class="fa fa-home"></i> Trang chủ</a></li>
				<li><a href="danhsachhocsinh">Danh sách môn học</a></li>
				<li class="active">Sửa môn học</li>
			</ol>
		</div>
	
		<!-- Main content -->
		<div class="content">
			<div class="box box-default">
				<div class="box-header with-border">
					<h3 class="box-title text-center">Thông tin môn học</h3>
				</div>
				<div class="box-body">
					<!-- Công cụ lọc -->
					<div class="row">
						<div class="col-md-6 col-md-offset-2">
							<form action="suamonhoc" method="post" class="form-horizontal">
								<div class="box-body">
									<div class="form-group">
										<label class="col-sm-3 control-label">Mã môn học</label>
										<div class="col-sm-9">
											<input type="text" class="form-control" readonly="readonly" name="mamh" value="<%= mh.getMaMH() %>">
										</div>
									</div>
								
									<div class="form-group">
										<label class="col-sm-3 control-label">Tên môn học</label>
										<div class="col-sm-9">
											<input type="text" class="form-control" name="tenMH" value="<%= mh.getTenMH() %>">
										</div>
									</div>
								</div>
								<!-- /.box-body -->
								<div class="box-footer">
									<div class="pull-right">
										<button type="submit" class="btn btn-info btn-flat" name="submit" value="submit">Lưu lại</button>
										<a class="btn btn-default btn-flat" href="danhsachmonhoc">Quay lại</a>
									</div>
								</div>
								<!-- /.box-footer -->
							</form>
						</div>
	
					</div>
	
				</div>
				<!-- /.box-body -->
			</div>
			<!-- /.box -->
		</div>
	</body>
</html>