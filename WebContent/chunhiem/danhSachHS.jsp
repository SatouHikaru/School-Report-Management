<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:layout pageTitle="Danh sách học sinh">

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
				<h3 class="box-title text-center">Danh sách học sinh</h3>
			</div>
			<div class="box-body">
				<!-- Công cụ lọc -->
				<div class="row">
					<div class="col-md-2 mt-10 mb-10">
						<strong>Lớp: 10A2</strong>
					</div>
					<div class="col-md-4 mt-10 mb-10">
						<strong>Năm học: 2014-2015</strong>
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
								<td><a href="chiTietHS.jsp"><i class="fa fa-eye"></i>
										Xem</a></td>
							</tr>
							<tr>
								<td>219</td>
								<td>Alexander Pierce</td>
								<td>11-7-2014</td>
								<td><span class="label label-warning">Pending</span></td>
								<td>Abc Def</td>

								<td><a href="chiTietHS.jsp"><i class="fa fa-eye"></i>
										Xem</a></td>
							</tr>
							<tr>
								<td>657</td>
								<td>Bob Doe</td>
								<td>11-7-2014</td>
								<td><span class="label label-primary">Approved</span></td>
								<td>Abc Def</td>
								<td><a href="chiTietHS.jsp"><i class="fa fa-eye"></i>
										Xem</a></td>
							</tr>
							<tr>
								<td>175</td>
								<td>Mike Doe</td>
								<td>11-7-2014</td>
								<td><span class="label label-danger">Denied</span></td>
								<td>Abc Def</td>
								<td><a href="chiTietHS.jsp"><i class="fa fa-eye"></i>
										Xem</a></td>
							</tr>
						</tbody>

						<tfoot>
						</tfoot>
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

