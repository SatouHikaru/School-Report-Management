<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:layout pageTitle="Báo cáo thống kê">

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
				<h3 class="box-title text-center">Báo cáo thống kê</h3>
			</div>
			<div class="box-body">
				<!-- Công cụ lọc -->
				<div class="row">
					<div class="col-md-6 mt-10 mb-10 col-md-offset-5">
						<strong>Lớp: 10A2</strong>
					</div>
				</div>

				<div class="table-responsive mt-10">
					<table class="table table-hover">
						<tbody>
							<tr>
								<th>STT</th>
								<th>Họ tên</th>
								<th>Ngày sinh</th>
								<th>Điểm TB</th>
								<th>Học lực</th>
								<th>Hạnh kiểm</th>
								<th>Danh hiệu</th>
							</tr>
							<tr>
								<td>183</td>
								<td>John Doe</td>
								<td>11-7-2014</td>
								<td>10</td>
								<td>Tốt</td>
								<td>Giỏi</td>
								<td>Xuất xắc</td>

							</tr>
							<tr>
								<td>183</td>
								<td>John Doe</td>
								<td>11-7-2014</td>
								<td>10</td>
								<td>Tốt</td>
								<td>Giỏi</td>
								<td>Xuất xắc</td>
							</tr>
							<tr>
								<td>183</td>
								<td>John Doe</td>
								<td>11-7-2014</td>
								<td>10</td>
								<td>Tốt</td>
								<td>Giỏi</td>
								<td>Xuất xắc</td>
							</tr>
							<tr>
								<td>183</td>
								<td>John Doe</td>
								<td>11-7-2014</td>
								<td>10</td>
								<td>Tốt</td>
								<td>Giỏi</td>
								<td>Xuất xắc</td>
							</tr>
						</tbody>

						<tfoot>
						</tfoot>
					</table>

				</div>
				<div class="box-header with-border">
					<h3 class="box-title text-center">Báo cáo</h3>
				</div>
				<div class="box-body">
					<p><strong>Số học sinh xuất xắc: </strong> <span>4 (100%)</span></p>
					<p><strong>Số học sinh xuất giỏi: </strong> <span>0 (0%)</span></p>
					<p><strong>Số học sinh xuất khá: </strong> <span>0 (0%)</span></p>
					<p><strong>Số học sinh xuất trung bình: </strong> <span>0 (0%)</span></p>
					<p><strong>Số học sinh xuất yếu: </strong> <span>0 (0%)</span></p>
				</div>
			</div>

			<!-- /.box-body -->
		</div>
		<!-- /.box -->
	</div>
</t:layout>

