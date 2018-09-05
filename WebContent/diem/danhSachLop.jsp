<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:layout pageTitle="Danh sách lớp tôi dạy">

	

	<!-- Main content -->
	<div class="content">
		<div class="box box-default">
			<div class="box-header with-border">
				<h3 class="box-title text-center">Danh sách lớp dạy</h3>
			</div>
			<jsp:include page="/diem/_danhSachLop.jsp"></jsp:include>
		</div>
		<!-- /.box -->
	</div>
</t:layout>
