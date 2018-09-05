<%@page import="common.StringProcess"%>
<%@page import="model.bean.PhuHuynh"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.NamHoc"%>
<%@page import="model.bean.Lop"%>
<%@page import="model.bean.HocSinh"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="box-body">
	<!-- Công cụ lọc -->
	<div class="row">
		<form>
			<div class="col-md-6 mt-10">
				<input name="q" class="form-control" type="text"
					value="<%=request.getParameter("q") == null ? "" : request.getParameter("q")%>"
					placeholder="Tìm kiếm phụ huynh..." />
			</div>
			<div class="col-md-2 mt-10">
				<select name="namHoc" id="namHoc" class="form-control">
					<option value="0">Năm học</option>
					<%
						String namHoc = StringProcess.ifNullIsEmpty(request.getParameter("namHoc"));
						String lop = StringProcess.ifNullIsEmpty(request.getParameter("lop"));
						ArrayList<NamHoc> listNH = (ArrayList<NamHoc>) request.getAttribute("listNH");
						for (NamHoc nh : listNH) {
					%>
					<option
						<%=namHoc.equals("" + nh.getMaNH() + "") ? "selected" : ""%>
						value="<%=nh.getMaNH()%>"><%=nh.getNamHoc()%></option>
					<%
						}
					%>
				</select> <input type="hidden" id="maLopHidden" value="<%=lop%>" />
			</div>
			<div class="col-md-2 mt-10">

				<select name="lop" class="form-control">
					<option value="0">Lớp</option>
					<%
						ArrayList<Lop> listLop = (ArrayList<Lop>) request.getAttribute("listLop");
						for (Lop c : listLop) {
					%>
					<option <%=lop.equals("" + c.getMaLop() + "") ? "selected" : ""%>
						value="<%=c.getMaLop()%>"><%=c.getTenLop()%></option>
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
		<table class="table table-hover" id="dataTable">
			<thead>
				<tr>
					<th>STT</th>
					<th>Họ tên</th>
					<th>Giới tính</th>
					<th>Ngày sinh</th>
					<th>Điện thoại</th>
					<th>Email</th>
					<th>Địa chỉ</th>
					<th>Thao tác</th>
				</tr>
			</thead>
			<tbody>

				<%
					ArrayList<PhuHuynh> list = (ArrayList<PhuHuynh>) request.getAttribute("listPH");
					int i = 1;
					for (PhuHuynh ph : list) {
				%>
				<tr>
					<td><%=i%></td>
					<td><%=ph.getHoTen()%></td>
					<td><%=StringProcess.getGender(ph.isGioiTinh())%></td>
					<td><%=StringProcess.toFriendlyDateFormat(ph.getNgaySinh())%></td>
					<td><%=ph.getDienThoai()%></td>
					<td><a href="mailto:<%=ph.getEmail()%>" title="Gửi mail tới <%=ph.getEmail()%>"><%=ph.getEmail()%></a></td>
					<td><%=ph.getDiaChi()%></td>
					<td>
						<a href="chitietphuhuynh?maph=<%=ph.getMaPH()%>"><i class="fa fa-eye"></i></a>
						<a href="suaphuhuynh?maph=<%=ph.getMaPH()%>"><i class="fa fa-edit"></i> </a>
						<a onclick="return confirm('Bạn muốn xoá lớp này?')" href="xoaphuhuynh?maph=<%=ph.getMaPH()%>"><i class="fa text-danger fa-trash"></i></a>
					</td>
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

				$("select[name='lop']").html(html);
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