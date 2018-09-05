<%@page import="model.bean.MonHoc"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Thêm giáo viên</title>
	</head>
	
	<body>
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<h1>Thêm giáo viên</h1>
			<ol class="breadcrumb">
				<li><a href="trangchu"><i class="fa fa-home"></i> Trang chủ</a></li>
				<li><a href="danhsachgiaovien">Danh sách giáo viên</a></li>
				<li class="active">Thêm giáo viên</li>
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
							<form action="themgiaovien" method="post" id="form" class="form-horizontal">
								<div class="box-body">
									<div class="form-group">
										<label class="col-sm-3 control-label">Họ tên</label>
										<div class="col-sm-9">
											<input type="text" required class="form-control" name="hoTen">
										</div>
									</div>
	
									<div class="form-group">
										<label class="col-sm-3 control-label">Giới tính</label>
										<div class="col-sm-9">
											<label class="radio-inline"><input type="radio" checked="checked" name="gioiTinh" value="true" />Nam</label>
											<label class="radio-inline"><input type="radio" name="gioiTinh" value="false" />Nữ</label>
										</div>
									</div>
	
									<div class="form-group">
										<label class="col-sm-3 control-label">Ngày sinh</label>
										<div class="col-sm-9">
											<div class="input-group">
												<input type="text" style="z-index: 99;" class="form-control pull-right"
													id="datepicker" required placeholder="ngày / tháng / năm" name="ngaySinh">
												<div class="input-group-addon">
													<i class="fa fa-calendar"></i>
												</div>
											</div>
										</div>
									</div>
	
									<div class="form-group">
										<label class="col-sm-3 control-label">Số điện thoại</label>
										<div class="col-sm-9">
											<input type="text" required class="form-control" name="dienThoai">
										</div>
									</div>
	
									<div class="form-group">
										<label class="col-sm-3 control-label">Email</label>
										<div class="col-sm-9">
											<input type="email" required class="form-control" name="email">
										</div>
									</div>
									
									<div class="form-group">
										<label class="col-sm-3 control-label">Địa chỉ</label>
										<div class="col-sm-9">
											<input type="text" class="form-control" name="diaChi">
										</div>
									</div>
									
									<div class="form-group">
										<label class="col-sm-3 control-label">Chuyên môn</label>
										<div class="col-sm-9">
											<select class="form-control select2 select2" multiple="multiple" name="chuyenMon">
												<%
													ArrayList<MonHoc> list = (ArrayList<MonHoc>)request.getAttribute("listMH");
													for (MonHoc mh : list) {
												%>
												<option value="<%= mh.getMaMH() %>"><%= mh.getTenMH() %></option>
												<%	} %>
											</select>
										</div>
									</div>
									
								</div>
								<!-- /.box-body -->
								<div class="box-footer">
									<div class="pull-right">
										<button type="submit" class="btn btn-info btn-flat" name="submit" value="submit">Lưu lại</button>
										<a class="btn btn-default btn-flat" href="">Hủy</a>
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