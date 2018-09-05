<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:layout pageTitle="Liên lạc phụ huynh">

	<!-- Content Header (Page header) -->
	<div class="content-header">
		<h1>
			<i class="fa fa-th"></i>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-home"></i> Trang chủ</a></li>
			<li><a href="#">Danh sách học sinh</a></li>
			<li class="active">Liên lạc phụ huynh</li>
		</ol>
	</div>

	<!-- Main content -->
	<div class="content">
		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title">Thông tin liên lạc</h3>
			</div>
			<!-- /.box-header -->
			<div class="box-body">
				<div class="col-md-8">
					<table class="table">
						<tbody>
							<tr>
								<th style="width: 30%">Họ tên học sinh</th>
								<td>Thâm Davies</td>
							</tr>

							<tr>
								<th>Họ tên phụ huynh</th>
								<td>T Davies</td>
							</tr>
							<tr>
								<th>Số điện thoại</th>
								<td>016 5213 0546</td>
							</tr>
							<tr>
								<th>Email</th>
								<td><a href="mailto:tdavies@gmail.com">tdavies@gmail.com</a></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="col-md-12">
					<div class="box-header with-border">
						<h3 class="box-title">Nội dung liên lạc</h3>
						<form class="mt-10">
							<textarea name="noiDung" class="form-control"></textarea>
							<div class="form-group mt-10">
								<input type="button" value="Gửi SMS" class="btn btn-flat btn-primary mb-10"/>
								<input type="button" value="Gửi mail" class="btn btn-flat btn-success mb-10"/>
							</div>
						</form>
					</div>
				</div>

			</div>
			<!-- /.box-body -->
		</div>
		<!-- /.box-body -->
	</div>
</t:layout>
