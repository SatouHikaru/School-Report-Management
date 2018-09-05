<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:layout pageTitle="Danh sách lớp">

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
				
				<div class="table-responsive mt-10">
					<table class="table table-hover">
						<tbody>
							<tr>
								<th>STT</th>
								<th>Tên lớp</th>
								<th>Thao tác</th>
							</tr>
							<tr>
								<td>183</td>
								<td>10A1</td>
								<td>
									<a href="danhSachHS.jsp" class="fs-14">Danh sách</a>
									<a href="thongKe.jsp" class="fs-14 ml-10">Thống kê</a>
								</td>
							</tr>
							<tr>
								<td>183</td>
								<td>10A1</td>
								<td>
									<a href="danhSachHS.jsp" class="fs-14">Danh sách</a>
									<a href="thongKe.jsp" class="fs-14 ml-10">Thống kê</a>
								</td>
							</tr>
							<tr>
								<td>183</td>
								<td>10A1</td>
								<td>
									<a href="danhSachHS.jsp" class="fs-14">Danh sách</a>
									<a href="thongKe.jsp" class="fs-14 ml-10">Thống kê</a>
								</td>
							</tr>
							<tr>
								<td>183</td>
								<td>10A1</td>
								<td>
									<a href="danhSachHS.jsp" class="fs-14">Danh sách</a>
									<a href="thongKe.jsp" class="fs-14 ml-10">Thống kê</a>
								</td>
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
