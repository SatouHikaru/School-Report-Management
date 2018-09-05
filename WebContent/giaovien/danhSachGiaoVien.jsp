<%@page import="common.StringProcess"%>
<%@page import="model.bean.MonHoc"%>
<%@page import="model.bean.GiaoVien"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="box-body">
	<!-- Công cụ lọc -->
	<div class="row">
		<form>
			<div class="col-md-8">

				<input name="q" class="form-control" type="text"
					value="<%=StringProcess.ifNullIsEmpty(request.getParameter("q"))%>"
					placeholder="Nhập tên giảng viên..." />

			</div>
			<div class="col-md-2">
				<select name="monHoc" class="form-control">
					<option value="0">Chuyên môn</option>
					<%
						long maMH = StringProcess.ifNullToLong(request.getParameter("monHoc"));
						ArrayList<MonHoc> listMH = (ArrayList<MonHoc>) request.getAttribute("listMH");
						for (MonHoc mh : listMH) {
					%>
					<option <%=maMH == mh.getMaMH() ? "selected" : ""%>
						value="<%=mh.getMaMH()%>">
						<%=mh.getTenMH()%>
					</option>
					<%
						}
					%>
				</select>
			</div>
			<div class="col-md-2">
				<button type="submit" class="btn btn-primary btn-flat">Tìm
					kiếm</button>
			</div>
		</form>
	</div>

	<div class="table-responsive mt-10">
		<table class="table table-hover">
			<tbody>
				<tr>
					<th>STT</th>
					<th>Họ tên</th>
					<th>Giới tính</th>
					<th>Ngày sinh</th>
					<th>Điện thoại</th>
					<th>Email</th>
					<th>Chuyên môn</th>
					<th>Thao tác</th>
				</tr>
				<%
					ArrayList<GiaoVien> listGV = (ArrayList<GiaoVien>) request.getAttribute("listGV");
					int i = 1;
					for (GiaoVien gv : listGV) {
				%>
				<tr>
					<td><%=i%></td>
					<td><%=gv.getHoTen()%></td>
					<td><%=StringProcess.getGender(gv.isGioiTinh())%></td>
					<td><%=gv.getFormattedNgaySinh()%></td>
					<td><%=gv.getDienThoai()%></td>
					<td><a title="Gửi mail tới <%=gv.getEmail()%>"
						href="mailto:<%=gv.getEmail()%>"><%=gv.getEmail()%></a></td>
					<td><%=StringProcess.ifNullIsEmpty(gv.getChuyenMon())%></td>
					<td><a href="chitietgiaovien?magv=<%=gv.getMaGV()%>"><i
							class="fa fa-eye"></i></a> <a
						href="suagiaovien?magv=<%=gv.getMaGV()%>"><i
							class="fa fa-edit"></i></a> <a
							onclick="return confirm('Bạn chắc chắn muốn xóa dòng này?')"
						href="xoagiaovien?magv=<%=gv.getMaGV()%>"><i
							class="fa fa-trash"></i></a></td>
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
