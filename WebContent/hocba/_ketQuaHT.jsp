<%@page import="common.Utilities"%>
<%@page import="model.bean.KetQuaHocTap"%>
<%@page import="model.bean.NamHoc"%>
<%@page import="model.bean.Lop"%>
<%@page import="model.bean.ChiTietHocBa"%>
<%@page import="java.util.ArrayList"%>
<%@page import="common.StringProcess"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% if (session.getAttribute("admin") != null) { %>
<!-- Content Header (Page header) -->
<div class="content-header">
	<h1>
		<i class="fa fa-th"></i>
	</h1>
	<ol class="breadcrumb">
		<li><a href="trangchu"><i class="fa fa-home"></i> Trang chủ</a></li>
		<li><a href="danhsachhocba">Danh sách học bạ</a></li>
		<li class="active">Chi tiết học bạ </li>
	</ol>
</div>
<% } %>

<!-- Main content -->
<div class="content">
	<div class="box box-default">
	<% ChiTietHocBa model = (ChiTietHocBa) request.getAttribute("cthb"); %>
		<div class="box-header with-border">
			<h3 class="box-title text-center">Chi tiết học bạ <%=model.getTenHS()%></h3>
		</div>
		<div class="box-body">
			<!-- Công cụ lọc -->
			<div class="row">
				<form method="post">
					<div class="col-md-4 mb-10 mt-10">
						<strong>Học sinh: <%=model.getTenHS()%></strong> <input
							type="hidden" id="mahs" value="<%=request.getParameter("mahs")%>" />
					</div>

					<div class="col-md-2 mt-10 hidden-print">

						<select name="lop" id="lop" class="form-control">
							<option value="0">Lớp</option>
							<%
								int maLop = StringProcess.ifNullToInt(request.getParameter("lop"));

								ArrayList<Lop> listLop = request.getAttribute("listLop") == null
										? new ArrayList<Lop>()
										: (ArrayList<Lop>) request.getAttribute("listLop");
								for (Lop l : listLop) {
							%>
							<option <%=maLop == l.getMaLop() ? "selected" : ""%>
								value="<%=l.getMaLop()%>"><%=l.getTenLop()%></option>
							<%
								}
							%>
						</select>
					</div>

					<div class="col-md-2 mt-10 hidden-print">
						<select name="namHoc" id="namHoc" class="form-control">
							<option value="0">Năm học</option>

						</select>
					</div>

					<div class="col-md-2 mt-10 mb-10 hidden-print">
						<button type="submit" value="submit" name="submit"
							class="btn btn-primary btn-flat">Lọc</button>
					</div>

				</form>
			</div>


			<div class="table-responsive mt-10">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>STT</th>
							<th>Môn học</th>
							<th>Học kỳ 1</th>
							<th>Học kỳ 2</th>
							<th>Cả năm</th>
						</tr>
					</thead>
					<tbody>
						<%
							float hk1 = 0, hk2 = 0;
							int i = 1;
							float diemTB = 0;
							for (KetQuaHocTap item : model.getKqHT()) {
						%>
						<tr>
							<td><%=i%></td>
							<td><%=item.getTenMH()%></td>
							<td><%=item.getHk1()%></td>
							<td><%=item.getHk2()%></td>
							<td><%=StringProcess.formatMark(item.getCaNam())%></td>
						</tr>

						<%
							hk1 += item.getHk1();
								hk2 += item.getHk2();
								diemTB += item.getCaNam();
								i++;
							}
						%>
						
						<%
							if (request.getAttribute("submitted") != null) {
						%>
						<tr>
							<td colspan="2" class="text-right"><strong>Điểm TB</strong></td>
							<td><%=StringProcess.formatMark(hk1 / (i - 1))%></td>
							<td><%=StringProcess.formatMark(hk2 / (i - 1))%></td>
							<td><%=StringProcess.formatMark(diemTB / (i - 1))%> <input
								id="diemCaNam" type="hidden"
								value="<%=StringProcess.formatMark(diemTB / (i - 1))%>" /></td>
						</tr>
						<%
							}
						%>
					</tbody>

					<tfoot>
					</tfoot>
				</table>

			</div>

			<%
				if (request.getAttribute("submitted") != null) {
			%>
			<div class="row">
				<div class="form-inline">

					<div class="col-md-4">

						<p>
							<strong>Danh hiệu: <%=Utilities.xetDanhHieu(StringProcess.xetHocLuc(diemTB / (i - 1)), "Tốt")%></strong>
						</p>
					</div>

					<div class="col-md-12 mt-10">
						<table class="table thongTinDanhGia">
							<tr>
								<th rowspan="2" style="vertical-align: middle;"
									class="text-center">Học kỳ</th>
								<th colspan="2" style="vertical-align: middle;"
									class="text-center">Kết quả xếp loại</th>
								<th rowspan="2" style="vertical-align: middle;"
									class="text-center">Số ngày nghỉ</th>
								<th rowspan="2" style="vertical-align: middle;"
									class="text-center">Nhận xét</th>
							</tr>
							<tr>
								<th class="text-center">Học lực</th>
								<th class="text-center">Hạnh kiểm</th>
							</tr>
							<%
								int ngayNghi = 0;
									String hkiem1 = "", hkiem2 = "";
									for (ChiTietHocBa item : model.getDsChiTiet()) {
							%>
							<tr data-hk="<%=item.getMaHK()%>"
								data-hl="<%=StringProcess.xetHocLuc(item.getMaHK() == 1 ? hk1 : hk2 / (i - 1))%>"
								class="item-info">
								<td><%=item.getMaHK()%></td>
								<td><%=StringProcess.xetHocLuc(item.getMaHK() == 1 ? hk1 : hk2 / (i - 1))%></td>
								<td><span class="hanhKiemText"><%=item.getHanhKiem()%></span>
									<select name="hanhKiem"
									class="form-control hanhKiem hide ml-10">
										<option
											<%=item.getHanhKiem().equals("Tốt") ? "selected" : ""%>
											value="Tốt">Tốt</option>
										<option
											<%=item.getHanhKiem().equals("Khá") ? "selected" : ""%>
											value="Khá">Khá</option>
										<option
											<%=item.getHanhKiem().equals("Trung bình") ? "selected" : ""%>
											value="Trung bình">Trung bình</option>
										<option
											<%=item.getHanhKiem().equals("Yếu") ? "selected" : ""%>
											value="Yếu">Yếu</option>
										<option
											<%=item.getHanhKiem().equals("Kém") ? "selected" : ""%>
											value="Kém">Kém</option>
								</select></td>
								<td><span class="soNNText"><%=item.getNgayNghi()%></span>
									<input class="hide form-control" type="number"
									value="<%=item.getNgayNghi()%>" /></td>
								<td><textarea class="nhanXet form-control"
										<%=item.getNhanXet()%> rows="" cols=""> <%=item.getNhanXet()%></textarea>
								</td>
							</tr>
							<%
								ngayNghi += item.getNgayNghi();
										if (item.getMaHK() == 1)
											hkiem1 = item.getHanhKiem();
										else
											hkiem2 = item.getHanhKiem();
									}
							%>

							<tr>
								<td>CN</td>
								<td><%=StringProcess.xetHocLuc(diemTB / (i - 1))%></td>
								<td><%=Utilities.xetHanhKiem(hkiem1, hkiem2)%></td>
								<td><%=ngayNghi%></td>
							</tr>
						</table>
						<div class="clear-fix"></div>
						<div class="form-group mt-10 hidden-print">
							<% if (session.getAttribute("admin") != null) { %>
							<a class="btn btn-flat btn-success hide" id="btnLuu" href="#">Lưu lại</a>
							<a class="btn btn-flat btn-success" id="btnCapNhat" href="#">Cập nhật</a>
							<a
								class="btn btn-flat btn-xuat btn-info hidden-print" href="#">Xuất
								PDF</a>
							<a class="btn btn-flat btn-info" href="danhsachhocba">Trở về</a>
							<% } %>
						</div>
					</div>
				</div>

			</div>
			<%
				}
			%>

		</div>
	</div>
	<!-- /.box-body -->
</div>
<!-- /.box -->


<input type="hidden" id="maNamHocHidden"
	value="<%=StringProcess.ifNullIsEmpty(request.getParameter("namHoc"))%>" />

<script>
	var hocBa = function() {
		$(".hanhKiem").on('change', function() {
			var hkText = $(this).parent().find(".hanhKiemText");
			$(hkText).text($(this).val());
		});

		$("#btnCapNhat").on('click', function(e) {
			e.preventDefault();
			capNhatHocBa();
		})
		
		$(".btn-xuat").on('click', function(e) {
			e.preventDefault();
			window.print();

		});

		$(".hanhKiemText").click(function() {
			var hkSelect = $(this).parent().find(".hanhKiem");
			hkSelect.toggleClass('hide');
		})

		$(".soNNText").click(function() {
			var input = $(this).parent().find(".form-control");
			input.toggleClass('hide');
			input.val($(this).text());
			$(this).hide();
		})

	}

	var capNhatHocBa = function() {
		$.each($('.item-info'), function() {
			var data = {
				maHS : $("#mahs").val(),
				maLop : $("#lop").val(),
				maNH : $("#namHoc").val(),
				maHK : $(this).data('hk'),
				hocLuc : $(this).data('hl'),
				hanhKiem : $(this).find(".hanhKiem").val(),
				nhanXet : $(this).find(".nhanXet").val(),
				ngayNghi : $(this).find('td').find("input").val()
			}
			console.log(data);
			//return;
			$.ajax({
				url : "CapNhatHocBaServlet",
				type : 'post',
				data : {
					"data" : JSON.stringify(data)
				},
				success : function(res) {
					swal("Thành công", "Cập nhật học bạ thành công", "success");
				},
				error : function(err) {
					console.log(err);
				}
			})
		});

	}

	var danhSachNamHoc = function(input) {
		$.ajax({
			url : "DanhSachNamHocTheoLopServlet?maLop=" + $(input).val(),
			type : 'get',
			success : function(res) {
				let html = "";
				var maNH = $("#maNamHocHidden").val();
				if (res.length === 0) {
					html = "<option value='0'>Năm học</option>";
				}
				res.forEach(function(item) {
					var isSelected = maNH == item.maNH ? "selected" : "";
					html += "<option "+isSelected+" value='"+item.maNH+"'>"
							+ item.namHoc + "</option>";
				});

				$("#namHoc").html(html);
			},
			error : function(error) {
				console.log(error);
			}
		});
	}

	danhSachNamHoc($("#lop"));

	$("#lop").on('change', function() {
		danhSachNamHoc($(this));
	});
	hocBa();
</script>
