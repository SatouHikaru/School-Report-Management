<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:layout pageTitle="Chi tiết lớp">

	<!-- Content Header (Page header) -->
	<div class="content-header">
		<h1>
			<i class="fa fa-th"></i>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-home"></i> Trang chủ</a></li>
			<li><a href="#">Danh sách lớp</a></li>
			<li class="active">Chi tiết</li>
		</ol>
	</div>

	<!-- Main content -->
	<div class="content">
		<div class="box box-default">
			<div class="box-header with-border">
				<h3 class="box-title text-center">Danh sách học sinh lớp 10A2</h3>
			</div>
			<div class="box-body">
				<!-- Công cụ lọc -->
				<div class="row">
					<div class="col-md-8">
						<form>
							<input class="form-control" type="text"
								placeholder="Tìm kiếm học sinh..." />
						</form>
					</div>
					<div class="col-md-4">
						<a href="${pageContext.request.contextPath}/hocsinh/themHocSinh" class="btn btn-primary btn-flat">Thêm</a>
					
					</div>
				</div>


				<div class="table-responsive mt-10">
					<table class="table table-hover">
						<tbody>
							<tr>
								<th>STT</th>
								<th>Họ tên</th>
								<th>Ngày sinh</th>
								<th>Giới tính</th>
								<th>Địa chỉ</th>
								<th>Thao tác</th>
							</tr>
							<tr>
								<td>183</td>
								<td>John Doe</td>
								<td>11-7-2014</td>
								<td><span class="label label-success">Approved</span></td>
								<td>Abc Def</td>
								<td>
									<a href="chiTietHocSinh.jsp">
										<i class="fa fa-eye"></i>
									</a>
									<a href="#">
										<i class="fa fa-trash"></i>
									</a>
								</td>
							</tr>
							<tr>
								<td>219</td>
								<td>Alexander Pierce</td>
								<td>11-7-2014</td>
								<td><span class="label label-warning">Pending</span></td>
								<td>Abc Def</td>

								<td>
									<a href="chiTietHocSinh.jsp">
										<i class="fa fa-eye"></i>
									</a>
									<a href="#">
										<i class="fa fa-trash"></i>
									</a>
								</td>
							</tr>
							<tr>
								<td>657</td>
								<td>Bob Doe</td>
								<td>11-7-2014</td>
								<td><span class="label label-primary">Approved</span></td>
								<td>Abc Def</td>
								<td>
									<a href="chiTietHocSinh.jsp">
										<i class="fa fa-eye"></i>
									</a>
									<a href="#">
										<i class="fa fa-trash"></i>
									</a>
								</td>
							</tr>
							<tr>
								<td>175</td>
								<td>Mike Doe</td>
								<td>11-7-2014</td>
								<td><span class="label label-danger">Denied</span></td>
								<td>Abc Def</td>
								<td>
									<a href="chiTietHocSinh.jsp">
										<i class="fa fa-eye"></i>
									</a>
									<a href="#">
										<i class="fa fa-trash"></i>
									</a>
								</td>
							</tr>
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
</t:layout>
