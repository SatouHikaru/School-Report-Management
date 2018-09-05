<%@page import="model.bean.GiaoVien"%>
<%@page import="model.bean.MonHoc"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Xoá giáo viên</title>
	</head>
	
	<body>
		<% GiaoVien gv = (GiaoVien)request.getAttribute("giaoVien"); %>			
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<h1>Xoá giáo viên</h1>
			<ol class="breadcrumb">
				<li><a href="trangchu"><i class="fa fa-home"></i> Trang chủ</a></li>
				<li><a href="danhsachgiaovien">Danh sách giáo viên</a></li>
				<li><an">Xoá giáo viên</a></li>
			</ol>
		</div>
	
		<!-- Main content -->
		<div class="content">
			<div class="box box-default">
				<div class="box-header with-border">
					<h3 class="box-title text-center">Thông tin giáo viên</h3>
				</div>
				<div class="box-body">
					<!-- Công cụ lọc -->
					<div class="row">
						<div class="col-md-6 col-md-offset-2">
							<form action="xoagiaovien" method="post" class="form-horizontal">
								<div class="box-body">
									<div class="form-group">
										<label class="col-sm-3 control-label">Mã giáo viên</label>
										<div class="col-sm-9">
											<input type="text" class="form-control" readonly="readonly" name="magv" value="<%= gv.getMaGV() %>">
										</div>
									</div>
								
									<div class="form-group">
										<label class="col-sm-3 control-label">Họ tên</label>
										<div class="col-sm-9">
											<input type="text" class="form-control" readonly="readonly" name="hoTen" value="<%= gv.getHoTen() %>">
										</div>
									</div>
	
									<div class="form-group">
										<label class="col-sm-3 control-label">Giới tính</label>
										<div class="col-sm-9">
											<label class="radio-inline"><input type="radio" name="gioiTinh" <%= gv.isGioiTinh() == true ? "checked" : "" %> readonly="readonly" value="true" />Nam</label>
											<label class="radio-inline"><input type="radio" name="gioiTinh" <%= gv.isGioiTinh() == false ? "checked" : "" %> readonly="readonly" value="false" />Nữ</label>
										</div>
									</div>
									
									<div class="form-group">
										<label class="col-sm-3 control-label">Ngày sinh</label>
										<div class="col-sm-9">
											<div class="input-group">
												<input type="text" style="z-index: 99;" class="form-control pull-right"
													id="datepicker" readonly="readonly" placeholder="ngày / tháng / năm" name="ngaySinh"
													value="<%= gv.getNgaySinh() %>">
												<div class="input-group-addon">
													<i class="fa fa-calendar"></i>
												</div>
											</div>
										</div>
									</div>
	
									<div class="form-group">
										<label class="col-sm-3 control-label">Số điện thoại</label>
										<div class="col-sm-9">
											<input type="text" class="form-control" readonly="readonly"  name="dienThoai" value="<%= gv.getDienThoai() %>">
										</div>
									</div>
	
									<div class="form-group">
										<label class="col-sm-3 control-label">Email</label>
										<div class="col-sm-9">
											<input type="email" class="form-control" readonly="readonly"  name="email" value="<%= gv.getEmail() %>">
										</div>
									</div>
									
									<div class="form-group">
										<label class="col-sm-3 control-label">Địa chỉ</label>
										<div class="col-sm-9">
											<input type="text" class="form-control" readonly="readonly" name="diaChi" value="<%= gv.getDiaChi() %>">
										</div>
									</div>
									
									<div class="form-group">
										<label class="col-sm-3 control-label">Chuyên môn</label>
										<div class="col-sm-9">
											<input type="text" class="form-control" readonly="readonly" name="chuyenMon" value="<%= gv.getChuyenMon() %>">
										</div>
									</div>
									
								</div>
								<!-- /.box-body -->
								<div class="box-footer">
									<div class="pull-right">
										<button type="submit" class="btn btn-info btn-flat" name="submit" value="submit">Xoá</button>
										<a class="btn btn-default btn-flat" href="danhsachgiaovien">Quay lại</a>
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