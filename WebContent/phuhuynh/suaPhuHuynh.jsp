<%@page import="model.bean.PhuHuynh"%>
<%@page import="java.util.ArrayList"%>
<%@page import="common.StringProcess"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Sửa phụ huynh</title>
	</head>
	
	<body>
		<% PhuHuynh ph = (PhuHuynh)request.getAttribute("phuHuynh"); %>			
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<h1>Sửa phụ huynh</h1>
			<ol class="breadcrumb">
				<li><a href="trangchu"><i class="fa fa-home"></i> Trang chủ</a></li>
				<li><a href="danhsachphuhuynh">Danh sách phụ huynh</a></li>
				<li><a>Sửa</a></li>
			</ol>
		</div>
	
		<!-- Main content -->
		<div class="content">
			<div class="box box-default">
				<div class="box-header with-border">
					<h3 class="box-title text-center">Thông tin phụ huynh</h3>
				</div>
				<div class="box-body">
					<!-- Công cụ lọc -->
					<div class="row">
						<div class="col-md-6 col-md-offset-2">
							<form action="suaphuhuynh" method="post" class="form-horizontal">
								<div class="box-body">
									<div class="form-group">
										<label class="col-sm-3 control-label">Mã phụ huynh</label>
										<div class="col-sm-9">
											<input type="text" class="form-control" readonly="readonly" name="maph" value="<%= ph.getMaPH() %>">
										</div>
									</div>
								
									<div class="form-group">
										<label class="col-sm-3 control-label">Họ tên</label>
										<div class="col-sm-9">
											<input type="text" class="form-control" name="hoTen" value="<%= ph.getHoTen() %>">
										</div>
									</div>
	
									<div class="form-group">
										<label class="col-sm-3 control-label">Giới tính</label>
										<div class="col-sm-9">
											<label class="radio-inline"><input type="radio" name="gioiTinh" <%= ph.isGioiTinh() == true ? "checked" : "" %> value="true" />Nam</label>
											<label class="radio-inline"><input type="radio" name="gioiTinh" <%= ph.isGioiTinh() == false ? "checked" : "" %> value="false" />Nữ</label>
										</div>
									</div>
									
									<div class="form-group">
										<label class="col-sm-3 control-label">Ngày sinh</label>
										<div class="col-sm-9">
											<div class="input-group">
												<input type="text" style="z-index: 99;" class="form-control pull-right"
													id="datepicker" placeholder="ngày / tháng / năm" name="ngaySinh"
													value="<%= StringProcess.toFriendlyDateFormat(ph.getNgaySinh()) %>">
												<div class="input-group-addon">
													<i class="fa fa-calendar"></i>
												</div>
											</div>
										</div>
									</div>
	
									<div class="form-group">
										<label class="col-sm-3 control-label">Số điện thoại</label>
										<div class="col-sm-9">
											<input type="text" class="form-control" name="dienThoai" value="<%= ph.getDienThoai() %>">
										</div>
									</div>
	
									<div class="form-group">
										<label class="col-sm-3 control-label">Email</label>
										<div class="col-sm-9">
											<input type="email" class="form-control" name="email" value="<%= ph.getEmail() %>">
										</div>
									</div>
									
									<div class="form-group">
										<label class="col-sm-3 control-label">Địa chỉ</label>
										<div class="col-sm-9">
											<input type="text" class="form-control" name="diaChi" value="<%= ph.getDiaChi() %>">
										</div>
									</div>									
								</div>
								<!-- /.box-body -->
								<div class="box-footer">
									<div class="pull-right">
										<button type="submit" class="btn btn-info btn-flat" name="submit" value="submit">Lưu lại</button>
										<a class="btn btn-default btn-flat" href="danhsachphuhuynh">Quay lại</a>
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