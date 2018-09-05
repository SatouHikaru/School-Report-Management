<%@page import="common.StringProcess"%>
<%@page import="model.bean.ThongKeHocLuc"%>
<%@page import="model.bean.Lop"%>
<%@page import="model.bean.NamHoc"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Content Header (Page header) -->
<div class="content-header">
	<h1>Bảng thống kê</h1>
	<ol class="breadcrumb">
		<li><a href="#"><i class="fa fa-home"></i> Trang chủ</a></li>
		<li class="active">Bảng thống kê</li>
	</ol>
</div>

<!-- Main content -->
<div class="content">
	<div class="box box-default">
		<div class="box-header with-border">
			<h3 class="box-title">Thống kê học sinh</h3>
		</div>
		<div class="box-body">
			<!-- Công cụ lọc -->
			<div class="row">
				<form method="post">
					<jsp:include page="/_lopTheoNamHocComponent.jsp"></jsp:include>
					<% 
						int maHK = request.getParameter("hocKy") == null ? 0 
								: Integer.parseInt(request.getParameter("hocKy")); 
								String hocLuc = request.getParameter("hocKy") == null ? "0"
								: request.getParameter("hocLuc");  %>
					<div class="col-md-2 mt-10 mb-10">
						<select class="form-control" name="hocKy">
							<option selected value="0">Học kỳ</option>
							<option <%=maHK == 1 ? "selected" : "" %> value="1">Học kỳ 1</option>
							<option <%=maHK == 2 ? "selected" : "" %> value="2">Học kỳ 2</option>
							<option <%=maHK == 3 ? "selected" : "" %> value="3">Cả năm</option>
						</select>
					</div>

					<div class="col-md-2 mt-10 mb-10">
						<select class="form-control" name="hocLuc">
							<option <%=hocLuc.equals("0") ? "selected" : "" %>  value="0">Học lực</option>
							<option <%=hocLuc.equals("Giỏi") ? "selected" : "" %> value="Giỏi">Giỏi</option>
							<option <%=hocLuc.equals("Khá") ? "selected" : "" %> value="Khá">Khá</option>
							<option <%=hocLuc.equals("Trung bình") ? "selected" : "" %> value="Trung bình">Trung bình</option>
							<option <%=hocLuc.equals("Yếu") ? "selected" : "" %> value="Yếu">Yếu</option>
							<option <%=hocLuc.equals("Kém") ? "selected" : "" %> value="Kém">Kém</option>
						</select>
					</div>
					<div class="col-md-2 mt-10 mb-10">
						<button type="submit" name="submit" value="submit"
							class="btn btn-primary btn-flat">Thống kê</button>
					</div>
				</form>
			</div>
			<!-- Kết quả -->
			<div class="row mt-10">
				<div class="col-md-12">
					<%
						ArrayList<ThongKeHocLuc> list = request.getAttribute("tkhl") == null
								? new ArrayList<ThongKeHocLuc>()
								: (ArrayList<ThongKeHocLuc>) request.getAttribute("tkhl");
						String gioi = (String) request.getAttribute("gioi");
						String kha = (String) request.getAttribute("kha");
						String trungBinh = (String) request.getAttribute("trungBinh");
						String yeu = (String) request.getAttribute("yeu");
						String kem = (String) request.getAttribute("kem");
						if (((gioi != null && !gioi.equals("0")) || (kha != null && !kha.equals("0"))
								|| (trungBinh != null && !trungBinh.equals("0")) || (yeu != null && !yeu.equals("0"))
								|| (kem != null && !kem.equals("0"))) && list.size() != 0) {
					%>
					<p class="alert alert-success">
						&nbsp;<%=gioi%>
						học sinh giỏi<br> &nbsp;<%=kha%>
						học sinh khá<br> &nbsp;<%=trungBinh%>
						học sinh trung bình<br> &nbsp;<%=yeu%>
						học sinh yếu<br> &nbsp;<%=kem%>
						học sinh kém<br>
					</p>
					<%
						}
					%>
				</div>
			</div>

			<!-- Bảng thống kê -->
			<div class="table-responsive">
				<table class="table table-hover" id="dataTable">
					<thead>
						<tr>
							<th>STT</th>
							<th>Họ tên</th>
							<th>Giới tính</th>
							<th>Ngày sinh</th>
							<th>Lớp</th>
						</tr>
					</thead>

					<tbody>
						<%
							int i = 1;
							for (ThongKeHocLuc tkhl : list) {
						%>
						<tr>
							<td><%=i%></td>
							<td><%=tkhl.getTenHS()%></td>
							<td><%=StringProcess.getGender(tkhl.isGioiTinh())%></td>
							<td><%=StringProcess.toFriendlyDateFormat(tkhl.getNgaySinh())%></td>
							<td><%=tkhl.getLop()%></td>
						</tr>
						<%
							i++;
							}
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
