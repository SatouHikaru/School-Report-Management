<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:layout pageTitle="Danh sách môn học">
	<div class="modal fade" id="modal-default" style="display: none;">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">×</span></button>
                <h4 class="modal-title">Thông tin môn học</h4>
              </div>
              <div class="modal-body">
                <input class="form-control" value="" placeholder="Tên môn học..." />
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                <button type="button" class="btn btn-primary">Lưu lại</button>
              </div>
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>
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

	<!-- Main content -->
	<div class="content">
		<div class="box box-default">
			<div class="box-header with-border">
				<h3 class="box-title text-center">Danh sách môn học</h3>
			</div>
			<jsp:include page="/monhoc/_danhSachMonHoc.jsp"></jsp:include>
		</div>
		<!-- /.box -->
	</div>
</t:layout>
