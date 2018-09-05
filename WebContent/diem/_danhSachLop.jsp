<%@page import="common.LopCuaGiaoVien"%>
<%@page import="common.StringProcess"%>
<%@page import="model.bean.HocKy"%>
<%@page import="model.bean.Lop"%>
<%@page import="model.bean.NamHoc"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% if (session.getAttribute("admin") != null) { %>
	<!-- Content Header (Page header) -->
	<div class="content-header">
		<h1>
			<i class="fa fa-th"></i>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-home"></i> Trang chủ</a></li>
			<li class="active">Danh sách lớp dạy</li>
		</ol>
	</div>
	<% } %>

<div class="box-body">

	<div class="row">
		<form>
			<input type="hidden" value="1" name="maGV" />
			<div class="col-md-2 mt-10">
				<select name="maNH" id="namHoc" class="form-control">
					<option value="0">Năm học</option>
					<%
						String maNH = StringProcess.ifNullIsEmpty(request.getParameter("maNH"));
						String maHK = StringProcess.ifNullIsEmpty(request.getParameter("maHK"));
						ArrayList<NamHoc> listNH = (ArrayList<NamHoc>) request.getAttribute("listNH");
						for (NamHoc nh : listNH) {
					%>
					<option <%=maNH.equals("" + nh.getMaNH() + "") ? "selected" : ""%>
						value="<%=nh.getMaNH()%>"><%=nh.getNamHoc()%></option>
					<%
						}
					%>
				</select>
			</div>
			<div class="col-md-2 mt-10">

				<select name="maHK" class="form-control">
					<option value="0">Học kỳ</option>
					<%
						ArrayList<HocKy> listHK = (ArrayList<HocKy>) request.getAttribute("listHK");
						for (HocKy hk : listHK) {
					%>
					<option <%=maHK.equals("" + hk.getMaHK() + "") ? "selected" : ""%>
						value="<%=hk.getMaHK()%>"><%=hk.getTenHK()%></option>
					<%
						}
					%>
				</select>
			</div>
			<div class="col-md-2 mt-10">
				<button type="submit" class="btn btn-primary btn-flat">Tìm
					kiếm</button>
			</div>
		</form>
	</div>
	<div class="table-responsive mt-10">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>STT</th>
					<th>Tên lớp</th>
					<th>Năm học</th>
					<th>Thao tác</th>
				</tr>
			</thead>
			<tbody>
				<%
					ArrayList<LopCuaGiaoVien> dsLop = (ArrayList<LopCuaGiaoVien>) request.getAttribute("listLopCuaGV");
					int i = 1;
					for (LopCuaGiaoVien lop : dsLop) {
				%>
				<tr>
					<td><%=i%></td>
					<td><%=lop.getTenLop()%></td>
					<td><%=lop.getNamHoc()%></td>
					<td><a
						href="HocSinhCuaToiServlet?maLop=<%=lop.getMaLop()%>&maNH=<%=maNH%>&maHK=<%=maHK%>"><i
							class="fa fa-eye ml-10"></i></a></td>
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