<%@page import="model.bean.HocKy"%>
<%@page import="model.bean.ThongTinGiangDay"%>
<%@page import="model.bean.Lop"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.MonHoc"%>
<%@page import="model.bean.GiaoVien"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Sửa thông tin giảng dạy</title>
	</head>
	
	<body>
		<% ThongTinGiangDay ttgd = (ThongTinGiangDay)request.getAttribute("ttgd"); %>			
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<h1>Sửa phân công giảng dạy</h1>
			<ol class="breadcrumb">
				<li><a href="trangchu"><i class="fa fa-home"></i> Trang chủ</a></li>
				<li><a href="danhsachphanconggiangday">Danh sách giảng dạy</a></li>
				<li><a>Sửa</a></li>
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
							<form action="suaphanconggiangday" method="post" class="form-horizontal">
								<div class="box-body">
									<div class="form-group">
										<label class="col-sm-3 control-label">Giáo viên</label>
										<div class="col-sm-9">
											<select class="form-control select2" name="magv">
												<%
													long maGV = Long.valueOf(request.getParameter("magv"));
													ArrayList<GiaoVien> listGV = (ArrayList<GiaoVien>)request.getAttribute("listGV");
													for (GiaoVien gv : listGV) {
												%>
												<option <%= gv.getMaGV() == maGV ? "selected" : "" %> value="<%= gv.getMaGV() %>"><%= gv.getHoTen() %> (<%= gv.getTaiKhoan() %>)</option>
												<%	} %>
											</select>
										</div>
									</div>
									
									<div class="form-group">
										<label class="col-sm-3 control-label">Môn học</label>
										<div class="col-sm-9">
											<select class="form-control select2" name="mamh">
												<%
												long maMH = Long.valueOf(request.getParameter("mamh"));
													ArrayList<MonHoc> listMH = (ArrayList<MonHoc>)request.getAttribute("listMH");
													for (MonHoc mh : listMH) {
												%>
												<option <%= mh.getMaMH() == maMH ? "selected" : "" %> value="<%= mh.getMaMH() %>"><%= mh.getTenMH() %></option>
												<%	} %>
											</select>
										</div>
									</div>
									
									<div class="form-group">
										<label class="col-sm-3 control-label">Lớp</label>
										<div class="col-sm-9">
											<select class="form-control select2" name="lop">
												<%
													ArrayList<Lop> listLop = (ArrayList<Lop>)request.getAttribute("listLop");
													for (Lop l : listLop) {
												%>
												<option <%= l.getMaLop() == ttgd.getMaLop() ? "selected" : "" %> value="<%= l.getMaLop() %>"><%= l.getTenLop() %></option>
												<%	} %>
											</select>
										</div>
									</div>
									
									<div class="form-group">
										<label class="col-sm-3 control-label">Học kỳ</label>
										<div class="col-sm-9">
											<select class="form-control select2" name="hocKy">
												<%
													ArrayList<HocKy> hocKy = (ArrayList<HocKy>)request.getAttribute("hocKy");
													for (HocKy hk : hocKy) {
												%>
												<option <%= hk.getMaHK() == ttgd.getMaHK() ? "selected" : "" %> value="<%= hk.getMaHK() %>"><%= hk.getTenHK() %></option>
												<%	} %>
											</select>
										</div>
									</div>
								</div>
								<!-- /.box-body -->
								<div class="box-footer">
									<div class="pull-right">
										<button type="submit" class="btn btn-info btn-flat" name="submit" value="submit">Lưu lại</button>
										<a class="btn btn-default btn-flat previous" href="">Quay lại</a>
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