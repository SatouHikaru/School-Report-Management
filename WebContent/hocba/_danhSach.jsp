<%@page import="model.bean.NamHoc"%>
<%@page import="model.bean.Lop"%>
<%@page import="model.bean.HocSinh"%>
<%@page import="java.util.ArrayList"%>
<%@page import="common.StringProcess"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Content Header (Page header) -->
<div class="content-header">
	<h1>
		<i class="fa fa-th"></i>
	</h1>
	<ol class="breadcrumb">
		<li><a href="#"><i class="fa fa-home"></i> Trang chủ</a></li>
		<li class="active">Danh sách học bạ</li>
	</ol>
</div>

<!-- Main content -->
<div class="content">
	<div class="box box-default">
		<div class="box-header with-border">
			<h3 class="box-title text-center">Danh sách học bạ</h3>
		</div>
		<div class="box-body">

			<div class="table-responsive mt-10">
				<table class="table table-hover" id="dataTable" isSearching="true">
					<thead>
						<tr>
							<th>STT</th>
							<th>Họ tên</th>
							<th>Thao tác</th>
						</tr>
					</thead>
					<tbody>
						<%
							ArrayList<HocSinh> listHS = (ArrayList<HocSinh>) request.getAttribute("listHS");
							int i = 1;
							for (HocSinh hs : listHS) {
						%>
						<tr>
							<td><%=i%></td>
							<td><%=hs.getHoTen()%></td>
							<td><a href="chitiethocba?mahs=<%=hs.getMaHS()%>"><i
									class="fa fa-eye" title="Xem học bạ" force="false"></i> Xem</a></td>
						</tr>
						<%
							i++;
							}
						%>
					</tbody>
				</table>

			</div>
		</div>
		<!-- /.box-body -->
	</div>
	<!-- /.box -->
</div>

