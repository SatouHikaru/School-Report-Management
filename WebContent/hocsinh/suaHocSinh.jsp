<%@page import="model.bean.HocSinh"%>
<%@page import="common.StringProcess"%>
<%@page import="model.bean.PhuHuynh"%>
<%@page import="model.bean.Lop"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Sửa học sinh</title>
	</head>
	
	<body>
		<% HocSinh hs = (HocSinh)request.getAttribute("hocSinh"); %>
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<h1>Sửa học sinh</h1>
			<ol class="breadcrumb">
				<li><a href="trangchu"><i class="fa fa-home"></i> Trang chủ</a></li>
				<li><a href="danhsachhocsinh">Danh sách học sinh</a></li>
				<li class="active">Sửa học sinh</li>
			</ol>
		</div>
	
		<!-- Main content -->
		<div class="content">
			<div class="box box-default">
				<div class="box-header with-border">
					<h3 class="box-title text-center">Thông tin học sinh</h3>
				</div>
				<div class="box-body">
					<!-- Công cụ lọc -->
					<div class="row">
						<div class="col-md-6 col-md-offset-2">
							<form action="suahocsinh" method="post" class="form-horizontal" id="form">
								<div class="box-body">
									<div class="form-group">
										<label class="col-sm-3 control-label">Mã học sinh</label>
										<div class="col-sm-9">
											<input type="text" class="form-control" readonly="readonly" name="mahs" value="<%= hs.getMaHS() %>">
										</div>
									</div>
								
									<div class="form-group">
										<label class="col-sm-3 control-label">Họ tên</label>
										<div class="col-sm-9">
											<input type="text" required class="form-control" name="hoTen" value="<%= hs.getHoTen() %>">
										</div>
									</div>
	
									<div class="form-group">
										<label class="col-sm-3 control-label">Giới tính</label>
										<div class="col-sm-9">
											<label class="radio-inline"><input type="radio" name="gioiTinh" <%= hs.isGioiTinh() == true ? "checked" : "" %> value="true" />Nam</label>
											<label class="radio-inline"><input type="radio" name="gioiTinh" <%= hs.isGioiTinh() == false ? "checked" : "" %> value="false" />Nữ</label>
										</div>
									</div>
	
									<div class="form-group">
										<label class="col-sm-3 control-label">Ngày sinh</label>
										<div class="col-sm-9">
											<div class="input-group">
												<input type="text" style="z-index: 99;" class="form-control pull-right"
													id="datepicker" required placeholder="ngày / tháng / năm" name="ngaySinh" value="<%= StringProcess.toFriendlyDateFormat(hs.getNgaySinh()) %>">
												<div class="input-group-addon">
													<i class="fa fa-calendar"></i>
												</div>
											</div>
										</div>
									</div>
	
									<div class="form-group">
										<label class="col-sm-3 control-label">Số điện thoại</label>
										<div class="col-sm-9">
											<input type="text" class="form-control" name="dienThoai" value="<%= hs.getDienThoai() %>">
										</div>
									</div>
									
									<div class="form-group">
										<label class="col-sm-3 control-label">Địa chỉ</label>
										<div class="col-sm-9">
											<input type="text" class="form-control" name="diaChi" value="<%= hs.getDiaChi() %>">
										</div>
									</div>
									
									<div class="form-group">
										<label class="col-sm-3 control-label">Lớp</label>
										<div class="col-sm-9">
											<select required class="form-control select2 select2" name="lop">
												<%
													ArrayList<Lop> listLop = (ArrayList<Lop>)request.getAttribute("listLop");
													for (Lop l : listLop) {
												%>
												<option <%= l.getMaLop() == hs.getMaLop() ? "selected" : "" %> value="<%= l.getMaLop() %>"><%= l.getTenLop() %></option>
												<%	} %>
											</select>
										</div>
									</div>
									
									<div class="form-group">
										<label class="col-sm-3 control-label">Phụ huynh</label>
										<div class="col-sm-9">
											<select class="form-control select2 select2" name="phuHuynh">
												<%
													ArrayList<PhuHuynh> listPH = (ArrayList<PhuHuynh>)request.getAttribute("listPH");
													for (PhuHuynh ph : listPH) {
												%>
												<option <%= ph.getMaPH() == hs.getMaPH() ? "selected" : "" %> value="<%= ph.getMaPH() %>"><%= ph.getHoTen() %></option>
												<%	} %>
											</select>
										</div>
									</div>
								</div>
								<!-- /.box-body -->
								<div class="box-footer">
									<div class="pull-right">
										<button type="submit" class="btn btn-info btn-flat" name="submit" value="submit">Lưu lại</button>
										<a class="btn btn-default btn-flat" href="">Quay lại</a>
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