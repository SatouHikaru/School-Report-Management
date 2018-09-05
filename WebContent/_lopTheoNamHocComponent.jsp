<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="common.StringProcess"%>
<%@page import="model.bean.HocKy"%>
<%@page import="model.bean.Lop"%>
<%@page import="model.bean.NamHoc"%>
<%@page import="java.util.ArrayList"%>

<div class="col-md-2 mt-10">
	<select name="namHoc" id="namHoc" class="form-control">
		<option value="0">Năm học</option>
		<%
			String namHoc = StringProcess.ifNullIsEmpty(request.getParameter("namHoc"));
			String maLop = StringProcess.ifNullIsEmpty(request.getParameter("lop"));
			ArrayList<NamHoc> listNH = (ArrayList<NamHoc>) request.getAttribute("listNH");
			for (NamHoc nh : listNH) {
		%>
		<option <%=namHoc.equals("" + nh.getMaNH() + "") ? "selected" : ""%>
			value="<%=nh.getMaNH()%>"><%=nh.getNamHoc()%></option>
		<%
			}
		%>
	</select> <input type="hidden" id="maLopHidden" value="<%=maLop%>" />
</div>
<div class="col-md-2 mt-10">

	<select name="lop" class="form-control">
		<option value="0">Lớp</option>
		<%
		ArrayList<Lop> listLop = request.getAttribute("listLop") == null ? new ArrayList<Lop>() : (ArrayList<Lop>) request.getAttribute("listLop");
			for (Lop c : listLop) {
		%>
		<option <%=maLop.equals("" + c.getMaLop() + "") ? "selected" : ""%>
			value="<%=c.getMaLop()%>"><%=c.getTenLop()%></option>
		<%
			}
		%>
	</select>
</div>

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