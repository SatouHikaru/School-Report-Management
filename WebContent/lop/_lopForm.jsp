<%@page import="model.bean.Lop"%>
<%@page import="common.StringProcess"%>
<%@page import="model.bean.NamHoc"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Content Header (Page header) -->
<div class="content-header">
	<h1>Thêm lớp</h1>
	<ol class="breadcrumb">
		<li><a href="#"><i class="fa fa-home"></i> Trang chủ</a></li>
		<li><a href="#">Danh sách lớp</a></li>
		<li class="active">Thêm lớp</li>
	</ol>
</div>

<!-- Main content -->
<div class="content">
	<div class="box box-default">
		<div class="box-header with-border">
			<h3 class="box-title text-center">Thông tin lớp</h3>
		</div>
		<div class="box-body">
			<!-- Công cụ lọc -->
			<div class="row">
				<div class="col-md-6 col-md-offset-1">
					<form class="form-horizontal" method="post">
						<%
							Lop lop = request.getAttribute("lop") == null ? new Lop() : (Lop) request.getAttribute("lop");
						%>
						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-3 control-label">Tên lớp</label>
								<div class="col-sm-9">
									<input type="text" value="<%=StringProcess.ifNullIsEmpty(lop.getTenLop()) %>" name="tenLop" class="form-control"
										placeholder="">
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label">Năm học</label>
								<div class="col-sm-9">
									<%
										if (lop.getMaLop() <= 0) {
									%>
									<select name="maNH" class="form-control select2">
										<%
												int maNH = StringProcess.ifNullToInt(request.getParameter("namHoc"));
												ArrayList<NamHoc> dsNH = (ArrayList<NamHoc>) request.getAttribute("listNH");

												for (NamHoc item : dsNH) {
										%>
										<option <%=maNH == item.getMaNH() ? "selected" : ""%>
											value="<%=item.getMaNH()%>"><%=item.getNamHoc()%></option>
										<%
											}
										%>
									</select>
									<%
										} else {
									%>
									<select name="maNH" multiple="multiple" class="form-control select2">
									<%
									
									ArrayList<NamHoc> dsNH = (ArrayList<NamHoc>) request.getAttribute("listNH");
													ArrayList<Long> chuyenMon = (ArrayList<Long>)request.getAttribute("dsNHText");
													for (NamHoc mh : dsNH) {
												%>
												<option <%=chuyenMon.contains(mh.getMaNH()) == true ? "selected" : "" %> value="<%= mh.getMaNH()%>"><%= mh.getNamHoc() %></option>
												<%	} %>
									
									<%
										}
									%>
									</select>
								</div>
							</div>
						</div>
						<!-- /.box-body -->
						<div class="box-footer">
							<div class="pull-right">
								<button value="submit" name="submit" type="submit"
									class="btn btn-info btn-flat">Lưu lại</button>
								<a class="btn btn-default btn-flat" href="danhsachlop">Hủy</a>
							</div>
						</div>
						<!-- /.box-footer -->
					</form>
				</div>

			</div>

		</div>
		<!-- /.box-body -->
	</div>
	<!-- /.box -->
</div>