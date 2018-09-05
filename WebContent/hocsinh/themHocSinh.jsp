<%@page import="model.bean.PhuHuynh"%>
<%@page import="model.bean.Lop"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Content Header (Page header) -->
<div class="content-header">
	<h1>Thêm học sinh</h1>
	<ol class="breadcrumb">
		<li><a href="trangchu"><i class="fa fa-home"></i> Trang chủ</a></li>
		<li><a href="danhsachhocsinh">Danh sách học sinh</a></li>
		<li class="active">Thêm học sinh</li>
	</ol>
</div>

<!-- Main content -->
<div class="content">
	<form class="form-horizontal" method="post" id="form">
		<div class="nav-tabs-custom">
			<ul class="nav nav-tabs">
				<li class="active"><a href="#tths" data-toggle="tab"
					aria-expanded="true">Thông tin học sinh</a></li>
				<li class=""><a href="#ttph" data-toggle="tab"
					aria-expanded="false">Thông tin phụ huynh</a></li>

			</ul>

			<div class="tab-content">
				<div class="tab-pane active" id="tths">
					<div class="box-body">
						<div class="form-group">
							<label class="col-sm-3 control-label">Họ tên</label>
							<div class="col-sm-7">
								<input type="text" required class="form-control" name="hoTenHS">
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">Giới tính</label>
							<div class="col-sm-7">
								<label class="radio-inline"><input type="radio" checked
									name="gioiTinhHS" value="true" />Nam</label> <label
									class="radio-inline"><input type="radio"
									name="gioiTinhHS" value="false" />Nữ</label>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">Ngày sinh</label>
							<div class="col-sm-7">
								<div class="input-group">
									<input type="text" style="z-index: 99;"
										class="form-control pull-right" id="datepicker" required
										placeholder="ngày / tháng / năm" name="ngaySinhHS">
									<div class="input-group-addon">
										<i class="fa fa-calendar"></i>
									</div>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">Số điện thoại</label>
							<div class="col-sm-7">
								<input type="text" required class="form-control"
									name="dienThoaiHS">
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">Địa chỉ</label>
							<div class="col-sm-7">
								<input type="text" required class="form-control" name="diaChiHS">
							</div>
						</div>


						<jsp:include page="/_lopTheoNHForm.jsp"></jsp:include>


					</div>
				</div>
				<!-- /.tab-pane -->

				<div class="tab-pane" id="ttph">
					<div class="box-body">
						<div class="form-group">
							<div class="col-md-3">
								<div class="checkbox pull-right">
									<label> <input checked="checked" type="checkbox"
										id="cbChonPH" value="true" name="cbChonPH"> Chọn từ
										danh sách
									</label>
								</div>
							</div>
							<div class="col-sm-7">
								<select class="form-control select2 select2" name="maPHDanhSach">
									<%
										ArrayList<PhuHuynh> phuHuynhList = (ArrayList<PhuHuynh>) request.getAttribute("listPH");
										for (PhuHuynh p : phuHuynhList) {
									%>
									<option value="<%=p.getMaPH()%>"><%=p.getHoTen()%></option>
									<%
										}
									%>
								</select>
							</div>
						</div>

						<div id="phuHuynhInfo" class="fade-in hide">
							<div class="form-group">
								<label class="col-sm-3 control-label">Họ tên</label>
								<div class="col-sm-7">
									<input type="text" class="form-control" name="hoTenPH">
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label">Giới tính</label>
								<div class="col-sm-7">
									<label class="radio-inline"><input type="radio" checked
										name="gioiTinhPH" value="true" />Nam</label> <label
										class="radio-inline"><input type="radio"
										name="gioiTinhPH" value="false" />Nữ</label>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label">Ngày sinh</label>
								<div class="col-sm-7">
									<div class="input-group">
										<input type="text" style="z-index: 99;"
											class="form-control pull-right" id="datepicker"
											placeholder="ngày / tháng / năm" name="ngaySinhPH">
										<div class="input-group-addon">
											<i class="fa fa-calendar"></i>
										</div>
									</div>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label">Số điện thoại</label>
								<div class="col-sm-7">
									<input type="text" class="form-control" name="dienThoaiPH">
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label">Email</label>
								<div class="col-sm-7">
									<input type="email" class="form-control" name="emailPH">
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label">Địa chỉ</label>
								<div class="col-sm-7">
									<input type="text" class="form-control" name="diaChiPH">
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /.tab-pane -->

			</div>
			<!-- /.tab-content -->

			<!-- /.box-body -->
			<div class="box-footer">

				<div class="col-md-10">
					<div class="pull-right">
						<button type="submit" name="submit" value="submit"
							class="btn btn-info btn-flat">Lưu lại</button>
						<a class="btn btn-default btn-flat" href="danhsachhocsinh">Hủy</a>
					</div>

				</div>
			</div>
			<!-- /.box-footer -->

		</div>

		<!-- /.box -->
	</form>
</div>

<script>
	$("#cbChonPH").on('change', function() {

		if (!$(this).is(":checked")) {
			$("#phuHuynhInfo").removeClass('hide');
			$("select[name='maPHDanhSach']").attr("disabled", true);
			$("#cbChonPH").val(false);
		} else {
			$("#phuHuynhInfo").addClass('hide');
			$("select[name='maPHDanhSach']").attr("disabled", false);
			$("#cbChonPH").val(true);
		}
	})
</script>