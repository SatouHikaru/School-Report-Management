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
				<form>
					<div class="col-md-6 mt-10">
						<input name="q" class="form-control" type="text"
							value="<%=request.getParameter("q") == null ? "" : request.getParameter("q")%>"
							placeholder="Tìm kiếm học sinh..." />
					</div>
					<jsp:include page="/_lopTheoNamHocComponent.jsp"></jsp:include>
					<div class="col-md-2 mt-10">
						<button type="submit" class="btn btn-primary btn-flat">Tìm
							kiếm</button>
					</div>
				</form>
			</div>

			<div class="table-responsive mt-10">
				<table class="table table-hover" id="dataTable">
					<thead>
						<tr>
							<th>STT</th>
							<th>Họ tên</th>
							<th>Giới tính</th>
							<th>Ngày sinh</th>
							<th>Điện thoại</th>
							<th>Địa chỉ</th>
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
							<td><%=StringProcess.getGender(hs.isGioiTinh())%></td>
							<td><%=StringProcess.toFriendlyDateFormat(hs.getNgaySinh())%></td>
							<td><%=hs.getDienThoai()%></td>
							<td><%=hs.getDiaChi()%></td>
							<td>
								<a href="chitiethocsinh?mahs=<%=hs.getMaHS()%>"><i class="fa fa-eye"></i></a>
								<a href="suahocsinh?mahs=<%=hs.getMaHS()%>"><i class="fa fa-edit"></i></a>
								<a onclick="return confirm('Bạn muốn xoá học sinh này?')" href="xoahocsinh?mahs=<%=hs.getMaHS()%>"><i class="fa fa-trash"></i></a></td>
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

