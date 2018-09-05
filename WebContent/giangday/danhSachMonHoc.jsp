<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:layout pageTitle="Danh sách môn học">

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
				<h3 class="box-title text-center">Danh sách môn học</h3>
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
						<div class="col-md-2 mb-10">
							<select name="hocKy" class="form-control">
								<option value="">Học kỳ</option>
								<option value="1">Học kỳ 1</option>
								<option value="2">Học kỳ 2</option>
							</select>
						</div>
						<div class="col-md-2">
							<button type="submit" class="btn btn-primary btn-flat">Tìm kiếm</button>
						</div>
					</form>
				</div>


				<div class="table-responsive mt-10">
					<table class="table table-hover">
						<tbody>
							<tr>
								<th>STT</th>
								<th>Tên môn học</th>
								<th>Giáo viên bộ môn</th>
								<th>Thao tác</th>
							</tr>
							<tr>
								<td>183</td>
								<td>Toán</td>
								<td>Nguyễn Văn Nam</td>
								<td><a href="phanCong.jsp"><i
										class="fa fa-edit ml-10"></i></a></td>
							</tr>
							<tr>
								<td>183</td>
								<td>Lý</td>
								<td></td>
								<td><a href="phanCong.jsp"><i
										class="fa fa-plus ml-10"></i></a></td>
							</tr>
							<tr>
								<td>183</td>
								<td>Hóa học</td>
								<td>Trần Văn Nam</td>
								<td><a href="phanCong.jsp"><i
										class="fa fa-edit ml-10"></i></a></td>
							</tr>
							<tr>
								<td>183</td>
								<td>Sinh học</td>
								<td>Nguyễn Văn Đạt</td>
								<td><a href="phanCong.jsp"><i
										class="fa fa-edit ml-10"></i></a></td>
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
