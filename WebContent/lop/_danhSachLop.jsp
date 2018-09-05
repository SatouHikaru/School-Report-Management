<%@page import="common.StringProcess"%>
<%@page import="model.bean.NamHoc"%>
<%@page import="model.bean.Lop"%>
<%@page import="java.util.ArrayList"%>
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
			<h3 class="box-title text-center">Danh sách lớp</h3>
		</div>
		<div class="box-body">
			<!-- Công cụ lọc -->
			<div class="row">
				<div class="col-md-2">
					<a class="btn btn-flat btn-primary" href="LopFormServlet?maLop=0">Thêm
						mới</a>
				</div>
				<form method="post">
					<div class="col-md-2">

						<select name="namHoc" class="form-control select2">
							<%
								int maNH = StringProcess.ifNullToInt(request.getParameter("namHoc"));
								ArrayList<NamHoc> dsNH = (ArrayList<NamHoc>) request.getAttribute("listNH");
								
								for (NamHoc item : dsNH) {
							%>
							<option <%=maNH == item.getMaNH() ? "selected" : "" %> value="<%=item.getMaNH()%>"><%=item.getNamHoc()%></option>
							<%
								}
							%>
						</select>

					</div>
					<div class="col-md-2">
						<button class="btn btn-primary btn-flat">Tìm kiếm</button>
					</div>
				</form>
			</div>


			<div class="table-responsive mt-10">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>STT</th>
							<th>Tên lớp</th>
							<th>Thao tác</th>
						</tr>
					</thead>
					<tbody>
						<%
							ArrayList<Lop> list = (ArrayList<Lop>) request.getAttribute("listLop");
							int i = 1;
							for (Lop c : list) {
						%>
						<tr>
							<td><%=i%></td>
							<td><%=c.getTenLop()%></td>
							<td>
								<a href="LopFormServlet?maLop=<%=c.getMaLop()%>"><i class="fa fa-edit"></i> </a> 
								<a href="#"><i class="fa text-danger fa-trash"></i> </a>
							</td>
						</tr>
						<%
							i++; }
						%>
					</tbody>

					<tfoot>
					</tfoot>
				</table>

			</div>
		</div>
		<!-- /.box-body -->
	</div>
	<!-- /.box -->
</div>
