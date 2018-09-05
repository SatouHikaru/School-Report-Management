<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:layout pageTitle="Chi tiết học sinh">

	<!-- Content Header (Page header) -->
	<div class="content-header">
		<h1>
			<i class="fa fa-th"></i>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-home"></i> Trang chủ</a></li>
			<li><a href="#">Danh sách học sinh</a></li>
			<li class="active">Chi tiết học sinh</li>
		</ol>
	</div>

	<!-- Main content -->
	<div class="content">
		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title">Thông tin học sinh</h3>
			</div>
			<!-- /.box-header -->
			<div class="box-body">
				<div class="col-md-8">
					<jsp:include page="/hocsinh/chiTietHocSinh.jsp"></jsp:include>
					<div class="col-md-12">
						<a href="lienLacPH.jsp" class="btn btn-primary btn-flat mb-10">Liên lạc phụ huynh</a>
						<a href="#" class="btn btn-default btn-flat mb-10">Trở về</a>
					</div>
				</div>
			</div>
			<!-- /.box-body -->
		</div>
		<!-- /.box-body -->
	</div>
</t:layout>
