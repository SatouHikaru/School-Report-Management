<%@page import="model.bean.MonHoc"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="box-body">
	<!-- Công cụ lọc -->
	<div class="row">
		<div class="col-md-2">
			<a class="btn btn-flat btn-primary" href="themmonhoc">Thêm mới</a>
		</div>
	</div>

	<div class="table-responsive mt-10">
		<table class="table table-hover" id="dataTable" isSearching="true">
			<thead>
				<tr>
					<th>STT</th>
					<th>Tên môn học</th>
					<th>Thao tác</th>
				</tr>
			</thead>
			<tbody>
				<%
					ArrayList<MonHoc> list = (ArrayList<MonHoc>) request.getAttribute("listMH");
					int i = 1;
					for (MonHoc mh : list) {
				%>
				<tr>
					<td><%=i%></td>
					<td><%=mh.getTenMH()%></td>
					<td>
						<a href="suamonhoc?mamh=<%=mh.getMaMH()%>"><i class="fa fa-edit"></i> </a>
						<a onclick="return confirm('Bạn muốn xoá môn học này?')" href="xoamonhoc?mamh=<%=mh.getMaMH()%>"><i class="fa text-danger fa-trash"></i> </a></td>
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