<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:layout pageTitle="Phân công giáo viên">

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
				<h3 class="box-title text-center">Phân công giáo viên</h3>
			</div>
			<div class="box-body">
				<!-- Công cụ lọc -->
				<div class="row">
					<form>
						<div class="col-md-2 ml-10 mb-10 mt-10">
							<p>
								<strong>Lớp: 10A1</strong>
							</p>
						</div>
						<div class="col-md-2 mb-10 mt-10">
							<p>
								<strong>Năm học: 2011-2012</strong>
							</p>
						</div>
						<div class="col-md-2 mt-10 mb-10">
							<p>
								<strong>Học kỳ 2</strong>
							</p>
						</div>
						<div class="col-md-2 mb-10">
							<select class="form-control select2" name="giaoVien">
								<option value="1">Giáo viên 1</option>
								<option value="2">Giáo viên 2</option>
								<option value="3">Giáo viên 3</option>
							</select>
						</div>
						<div class="col-md-2">
							<button type="submit" class="btn btn-primary btn-flat">Lưu lại</button>
						</div>
					</form>
				</div>

			</div>
			<!-- /.box-body -->
		</div>
		<!-- /.box -->
	</div>
</t:layout>
