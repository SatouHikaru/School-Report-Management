<%@page import="model.bean.NamHoc"%>
<%@page import="common.StringProcess"%>
<%@page import="model.bean.HocSinh"%>
<%@page import="model.bean.HocKy"%>
<%@page import="model.bean.MonHoc"%>
<%@page import="model.bean.Lop"%>
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
		<li class="active">Danh sách</li>
	</ol>
</div>
<% } %>

<!-- Main content -->
<div class="content">
	<div class="box box-default">
		<div class="box-header with-border">
			<h3 class="box-title text-center">Quản lý điểm</h3>
		</div>
		<div class="box-body">
			<!-- Công cụ lọc -->
			<div class="row">
				<div class="col-md-12">
					<form>
						<%
							long maLop = StringProcess.ifNullToLong(request.getParameter("maLop"));

							int maMH = StringProcess.ifNullToInt(request.getParameter("maMH"));

							int maHK = StringProcess.ifNullToInt(request.getParameter("maHK"));

							long maNH = StringProcess.ifNullToLong(request.getParameter("maNH"));

							ArrayList<Lop> dsLop = (ArrayList<Lop>) request.getAttribute("listLop");
							ArrayList<MonHoc> dsMH = (ArrayList<MonHoc>) request.getAttribute("listMH");
							ArrayList<HocKy> dsHK = (ArrayList<HocKy>) request.getAttribute("listHK");
							ArrayList<NamHoc> dsNH = (ArrayList<NamHoc>) request.getAttribute("listNH");
						%>
						<div class="col-md-2 mb-10">
							<select name="maNH" id="namHoc" class="form-control">
								<%
									for (NamHoc nh : dsNH) {
								%>
								<option <%=maNH == nh.getMaNH() ? "selected" : ""%>
									value="<%=nh.getMaNH()%>"><%=nh.getNamHoc()%></option>
								<%
									}
								%>
							</select>
						</div>
						<div class="col-md-2 mb-10">
							<select name="maLop" class="form-control">
								<%
									for (Lop lop : dsLop) {
								%>
								<option <%=maLop == lop.getMaLop() ? "selected" : ""%>
									value="<%=lop.getMaLop()%>"><%=lop.getTenLop()%></option>
								<%
									}
								%>
							</select>
						</div>

						<div class="col-md-2 mb-10">
							<select name="maMH" class="form-control">

								<%
									for (MonHoc mh : dsMH) {
								%>
								<option <%=maMH == mh.getMaMH() ? "selected" : ""%>
									value="<%=mh.getMaMH()%>"><%=mh.getTenMH()%></option>
								<%
									}
								%>
							</select>
						</div>

						<div class="col-md-2 mb-10">
							<select name="maHK" class="form-control">
								<%
									for (HocKy hk : dsHK) {
								%>
								<option <%=maHK == hk.getMaHK() ? "selected" : ""%>
									value="<%=hk.getMaHK()%>"><%=hk.getTenHK()%></option>
								<%
									}
								%>
							</select>
						</div>

						<div class="col-md-2 mb-10">
							<input class="btn btn-flat btn-primary" type="submit" value="Lọc" />
						</div>
					</form>
				</div>

			</div>
			<div class="table-responsive mt-10" style="position: relative;">
				<table class="table table-hover" id="dataTable" isSearching="true">
					<thead>
						<tr>
							<th>STT</th>
							<th>Học sinh</th>							
							<th>Điểm miệng</th>
							<th>Điểm 15 phút</th>
							<th>Điểm 1 tiết</th>
							<th>Điểm thi</th>
							<th>Điểm tổng</th>
						</tr>
					</thead>
					<tbody>
						<%
							ArrayList<HocSinh> hs = request.getAttribute("listHS") == null
									? new ArrayList<HocSinh>()
									: (ArrayList<HocSinh>) request.getAttribute("listHS");
							int i = 1;
							for (HocSinh h : hs) {
						%>

						<tr data-mahs="<%=h.getMaHS()%>"
							data-mahk="<%=maHK%>">
							<td><%=i%></td>
							<td><%=h.getHoTen()%></td>
														<td>
								<div>
									<span class="markText"><%=StringProcess.showTextIfMarkIsEmpty(StringProcess.formatMarkHTML(h.getDiem().getDiemMieng()))%></span>
									<input type="text" style="width: 100px;"
										class="form-control markInput diemMieng"
										value="<%=h.getDiem().getDiemMieng()%>" />
								</div>
							</td>
							<td>
								<div>
									<span class="markText"><%=StringProcess.showTextIfMarkIsEmpty(StringProcess.formatMarkHTML(h.getDiem().getDiem15Phut()))%></span>
									<input type="text" style="width: 100px;"
										class="form-control markInput diem15"
										value="<%=h.getDiem().getDiem15Phut()%>" />
								</div>
							</td>
							<td>
								<div>
									<span class="markText"><%=StringProcess.showTextIfMarkIsEmpty(StringProcess.formatMarkHTML(h.getDiem().getDiem1Tiet()))%></span>
									<input type="text" style="width: 100px;"
										class="form-control markInput diem45"
										value="<%=h.getDiem().getDiem1Tiet()%>" />
								</div>
							</td>
							<td>
								<div>
									<span class="markText"><%=h.getDiem().getDiemThi()%></span> <input
										type="text" style="width: 100px;"
										class="form-control markInput diemThi"
										value="<%=h.getDiem().getDiemThi()%>" />
								</div>
							</td>
							<td><%=h.getDiem().getDiemTongKet()%></td>
						</tr>
						<%
							i++;
							}
						%>
					</tbody>
				</table>
				<input type="button" id="btn-update"
					class="btn btn-flat btn-primary" value="Cập nhật"
					style="position: absolute; bottom: 3px; right: 31%;">
			</div>
		</div>
		<!-- /.box-body -->
	</div>
	<!-- /.box -->
</div>
<input type="hidden" id="maLopHidden" value="<%=maLop%>" />
<script>
	var danhSachLop = function(input) {
		$.ajax({
			url : "DanhSachLopTheoNamServlet?namHoc=" + $(input).val(),
			type : 'get',
			success : function(res) {
				let html = "";
				var maLop = $("#maLopHidden").val();
				if (res.length === 0) {
					html = "<option value='0'>Lớp</option>";
				}
				res.forEach(function(item) {
					
					var isSelected = maLop == item.maLop ? "selected" : "";
					html += "<option "+isSelected+" value='"+item.maLop+"'>"
							+ item.tenLop + "</option>";
				});

				$("select[name='maLop']").html(html);
			},
			error : function(error) {
				console.log(error);
			}
		});
	}

	danhSachLop($("#namHoc"));

	$("#namHoc").on('change', function() {
		danhSachLop($(this));
	});
</script>